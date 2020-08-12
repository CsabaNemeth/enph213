function master()
% Controls all high level operation for the succesful implementation of a
% projectile intercept system. This is to be used in conjunction with the
% ENPH 213 2020 Game Theatre Project.
%
% Written By: Csaba Nemeth
% Version Since: 2020

    %Always true -> Used to keep the while loop running until exited by
    %user. 
    game_is_live = true;
    
    %--Stage Flags-- 
    %Stage 1 -> Move observer and launcher vehicles apart.
    stage1 = true;
    %Stage 2 -> Retrieve three observations, use observations to calculate
    %the wind speed and model the paths for 10 seconds.
    stage2 = false;
    collected_data = 0;
    %Stage 3 -> Select a target projectile and remodel the target until
    %ground impact point. Move the launcher towards the impact point and
    %complete a bisection search to find the initial veloecity.
    stage3 = false;
    %Stage 4 -> Launch the projectile.
    stage4 = false;
    
    %Initalize ID for Server Connection
    SERVER.id_number = 20090753;
    SERVER.net_id = '17cmn  ';
    %Retrieve Address
    SERVER.address = get_game_server_address;
    %Initialize Connection to Game Server
    [SERVER] = game_client(SERVER, 1);
    %Collect the inital observation
    [SERVER, OBSERVATION] = game_client(SERVER, 2);
    
    %Initialize game-time loop
    while game_is_live == true
        
        %STAGE 1
        if (stage1 == true)
            disp("Stage 1")
            
            %Collect an observation
            [SERVER, OBSERVATION] = game_client(SERVER, 2);
            
            %Retrieve the current positions of vehicles
            obs_pos = transpose(OBSERVATION.pos_launch);
            laun_pos = transpose(OBSERVATION.pos_observ);
            
            %If the position of the vehicles is the same, move the
            %vehicles apart.
            if isequal(obs_pos, laun_pos)
                %Send instruction to move the observer.
                instruction = setInstruction(NaN, [10, 10], NaN, NaN, NaN, NaN, NaN, NaN);
                game_client(SERVER, 3, instruction);
            else
                %Send instruction to stop the observer.
                instruction = setInstruction(NaN, [0, 0], NaN, NaN, NaN, NaN, NaN, NaN);
                game_client(SERVER, 3, instruction);
                
                %Display the final vehicle locations and confirm
                %completion of stage.
                disp("Stage 1 has been completed. The final vehicle locations are:");
                disp(obs_pos);
                disp(laun_pos);
                
                %Set flag variables to next stage.
                stage1 = false;
                stage2 = true;
                
                %Break to next iteration of the while loop.
                continue;
            end 
        end %END STAGE 1
        
        %STAGE 2
        if (stage2 == true)
            disp("Stage 2")
            disp(collected_data);
            if (collected_data < 3)
                %Collect an observation
                [SERVER, OBSERVATION] = game_client(SERVER, 2);  
                
                %Concatenate azimuth and elevation data
                [az_observ, indices, onlyBalloons] = removeNaN(OBSERVATION.az_observ);
                azimuths = [az_observ, removeNaN(OBSERVATION.az_launch)];
                elevations = [removeNaN(OBSERVATION.el_observ), removeNaN(OBSERVATION.el_launch)];
                
                %Convert the azimuth and elevation data to cartesian
                [X, Y, Z] = findCartesian(azimuths, elevations, obs_pos, laun_pos);
                
                %Switch stament to collect three sets of data.
                switch collected_data
                    case 0
                        %Save the observation into the first time-slot.
                        coords1 = [X, Y, Z];
                        collected_data = 1;
                        disp("First Collection");
                    case 1
                        disp("Second Collection");
                        %Save the observation into the second time-slot.
                        coords2 = [X, Y, Z];
                        
                        %Reset collection if the amount of projectiles
                        %chnages throughout the collection.
                        if (isequal(size(coords1),size(coords2)) == 0)
                            collected_data = 0;
                            disp("Case 1 Not Equal");
                            continue;
                        end
                        collected_data = 2;
                        
                    case 2
                        disp("Third Collection");
                        %Save the observation into the last time-slot.
                        coords3 = [X, Y, Z];
                        
                        %Reset collection if the amount of projectiles
                        %changes throughout the collection.
                        if (isequal(size(coords2),size(coords3)) == 0)
                            collected_data = 0;
                            disp("Case 2 Not Equal");
                            continue;
                        end
                        collected_data = 3;
                        continue;
                end %End data collection switch statement.
                
            else 
                if (collected_data == 3) 
                    disp("Analyzing Data");
                    if ( isequal(size(coords1), size(coords2), size(coords3)) == 1 )
                        %This if statement should always be true.
                        
                        %Use helper function to calculate the wind-speed.
                        wind = findWindV(coords2, coords1);
                        
                        %Create single matrix holding all of the
                        %observations.
                        coords = cat(3, coords1, coords2, coords3);
                        
                        %Predict the PATHS of all projectiles for the next
                        %10 seconds. 
                        [PATHS, ~] = findTrajectories(coords, 0.005, OBSERVATION.game_time , OBSERVATION.game_time + 10, wind);
                        stage2 = false;
                        
                        %Initialize stage 3.
                        stage3 = true;
                    else
                        collected_data = 0;
                        continue;
                    end
                else
                    continue;
                end
            end
        end %END STAGE 2
        
        %STAGE 3
        if (stage3 == true) 
            
            %Select the target projectile and read into array.
            [target_index, game_target_index] = selectTarget(PATHS, laun_pos, indices, onlyBalloons);
            target_coords = coords(target_index, :, :);
            
            %Remodel the projectile data until impact point on ground.
            [target_path, time_of_impact] = findTrajectories(target_coords, 0.005, OBSERVATION.game_time, 0, wind);
            
            %Move the launcher towards the target impact point. 
            target_position = [target_path(1, end, 1), target_path(2, end, 1)];
            [launcher_vx, launcher_vy] = moveLauncher(target_position, laun_pos);
            
            %Send instruction to move launcher.
            instruction = setInstruction([launcher_vx, launcher_vy], NaN, NaN, NaN, NaN, NaN, NaN, NaN);
            game_client(SERVER, 3, instruction);
            
            %Wait for 3 seconds to allow movement of launcher.
            pause(3);
            
            %Send instruction to stop the launcer.
            instruction = setInstruction(NaN, NaN, NaN, NaN, NaN, NaN, NaN, NaN);
            game_client(SERVER, 3, instruction);
            
            %Retrieve location of target at chosen time.
            target_x = target_path(1, end - floor(3/0.005),1);
            target_y = target_path(2, end - floor(3/0.005),1);
            target_z = target_path(3, end - floor(3/0.005),1);
            
            %Run bisection search on target path for that time.
            [proj_g, proj_A] = getAandG();
            target_location = [target_x, target_y, target_z];
            launch_velocity = bisectionSearch(target_location, laun_pos, OBSERVATION.game_time,...
                              OBSERVATION.game_time + time_of_impact - 3, proj_g, proj_A, wind);
            %Run next stage
            stage3 = false;
            stage4 = true;
            
        end %END STAGE 3
        
        %STAGE 4
        if (stage4 == true)
            instruction = setInstruction(NaN, NaN, launch_velocity, NaN, time_of_impact, game_target_index, proj_g, proj_A);
            game_client(SERVER, 3, instruction);
            
            %Restart detection and launch sequence.
            stage4 = false;
            stage1 = true;
            
        end %END STAGE 4
    end %END MASTER WHILE LOOP
end %End Function master(..)

%HELPER FUNCTIONS

%Classifies and cleans the obersvation data. Removes NaN values, finds the
%correct indices and specifies if only balloons exist in the simulation.
function [arr_out, indices, onlyBalloons] = removeNaN(arr_in)

 onlyBalloons = true; %boolean
 j = 1;
 indices = zeros(1, length(arr_in));
 
 %Loop through inputed array.
 for i = 1:size(arr_in, 1)
     if isnan(arr_in(i)) == 0
         indices(j) = i;
         j = j + 1;
         onlyBalloons = false;
     end
 end
 
 %Remove NaN values and reutrn specified indices.
 arr_out = arr_in(~isnan(arr_in));
 indices = indices(1:j);
 
end %End function.

%Returns A-coefficiant and the effective gravitational constant of the
%interceptor projectile. These justification for these values is found in
%the final report. 
function [g, a] = getAandG()

%Define projectile constants.
CD = 0.05;
mass = 5;
area = 0.007;
volume = 0.0005;

%Calculate a and g values.
a = (1/2)*1.225*CD*area/mass;
g = 9.81*(1 - 1.225*volume/mass);
    
end %End Function 

%Sets and returns an instruction object based on input values. If the
%instriction is not specified (NaN value specified) it is defualted to 0 value. 
function instruction = setInstruction(vel_launch, vel_observ, vel_projectile, next, t, c, g, a)

%Initialize instruction object with defualts.
instruction.vel_launch = [0, 0];
instruction.vel_observ = [0, 0];
instruction.vel_projectile = [0, 0, 0];
instruction.t = 0;
instruction.c = 0;
instruction.g = 0;
instruction.a = 0;

%Change instruction if the input value exists.
if ~isnan(vel_launch)
    instruction.vel_launch = vel_launch;
end
if ~isnan(vel_observ)
    instruction.vel_observ = vel_observ;
end
if ~isnan(vel_projectile)
    instruction.vel_projectile = vel_projectile;
end
if ~isnan(next)
    instruction.next = next;
end
if ~isnan(t)
    instruction.t = t;
end
if ~isnan(c)
    instruction.c = c;
end
if ~isnan(g)
    instruction.g = g;
end
if ~isnan(a)
    instruction.a = a;
end

end %End function.

%Finds the wind velocity assuming the last coordinate describes a balloon.
function wind = findWindV(coords1, coords2)

%Subtract positional data across one seocnd to find x, y componenet.
windX = coords2(end, 1) - coords1(end, 1);
windY = coords2(end, 2) - coords1(end, 2);
wind = [windX, windY];
    
end %End function.

%Chooses the target projectile by sorting the projected distances, heights
%and velocities. Returns the best projectile as an index in the input
%matrix paths, and also returns the corresponding game_index. If only
%balloons exist, then a balloon is chosen for the target.
function [best_index, game_index] = selectTarget(paths, launcher_position, indices, onlyBalloons)

    %Initialize variables
    closest_absolute_distance = 10000;
    best_index = 1;
    game_index = 1;
    
    %Choose a balloon based on absolute distance to current observer. 
    if (onlyBalloons == true)
        for i = 1:size(paths, 3)
            
            %Retrieve x, y, and z position at 10 seconds into flight of
            %balloon.
            x = paths(1, end, i);
            y = paths(2, end, i);
            z = paths(3, end, i);
            
            %Calculate absolute distance from launcher.
            distance = sqrt((x - launcher_position(1))^2 + (y - launcher_position(2))^2 + (z)^2);
            
            %If the current distance is better than previously saved, save the current
            %indices.
            if (distance < closest_absolute_distance)
                best_index = i;
                game_index = indices(i);
                closest_absolute_distance = distance;
            end
        end
    else %If other targets exist other than balloons...
        %Loop through all targets except for the ballons
        
        %If there is only one projectile, choose that one.
        number_of_targets = (size(paths, 3) - 5);
        if ( number_of_targets == 1 )
            game_index = indices(1);
            best_index = 1;
            return;
        end
        
        %If there are more projectiles, loop through them. Want to choose
        %projectiles that are currently moving upwards, at the currently
        %lowest z position with the closest absolute distance.
        
        %An array that contains a 1 if the projectile is currently
        %moving upwards and a 0 if it is not.
        going_upwards = zeros(1, number_of_targets);
            
        %The current z position of the projectile.
        z_positions = zeros(1, number_of_targets);
            
        %The absolute distance from the projectile to the launcher
        %after a projected 10 seconds.
        absolute_distance = zeros(1, number_of_targets);
        
        %Start loop.
        for i = 1:number_of_targets
            
            %If velocity upwards in z at observation time, save into array
            if (paths(3,3,i) - paths(3, 2, i)) > 0 
                going_upwards(i) = 1;
            end
            
            %Save current z position
            z_positions(i) = paths(3, 1, i);

            %Save absolute distance at t = 10s
            x = paths(1, end, i);
            y = paths(2, end, i);
            z = paths(3, end, i);
            absolute_distance(i) = sqrt((x - launcher_position(1))^2 + (y - launcher_position(2))^2 + (z)^2);
            
        end
        
        %Declare sorted index arrays
        sorted_indices_absolute_distance = 1:1:number_of_targets;
        sorted_indices_height = 1:1:number_of_targets;
        
        %Sort indices by absolute distance from launcher, the closer, the
        %more towards the front the projectile is. Also sort by current
        %height.
        sorted_absolute_distance = sort(absolute_distance);
        sorted_z_position = sort(z_positions);
        
        %Save indices of projectiles in the order of the sort.
        for i = 1:length(absolute_distance)
            sorted_indices_absolute_distance(i) = find(sorted_absolute_distance == absolute_distance(i));
            sorted_indices_height(i) = find(sorted_z_position == z_positions(i));
        end
        
        %Apply scoring based on z velocity and height ranking.
        scores = 1:number_of_targets;
        for i = 1:number_of_targets
            if going_upwards(i) == 1
                scores(i) = scores(i) - (number_of_targets - find(sorted_indices_height == i));
            else
                scores(i) = scores(i) - find(sorted_indices_height == i);
            end
        end
        
        %Compute final best targets.
        winning_index = min(scores);
        best_index = sorted_indices_absolute_distance(winning_index);
        game_index = indices(best_index);
    end    
end %End function



