function [PATHS, collision_time] = findTrajectories(coords, dt, start_time, end_time, wind)
% Written By: Csaba Nemeth
% Version: 2.1 since 2020-03-27
%
% Takes a 3D array coords of the form:
% -> Each row represents a projectile in motion;
% -> Each column representes x, y, z location at indices 1, 2, 3
% -> Each page represents the same projectile information 1 second later
%    than the previous page.
%
% RETURNS:
%
% PATHS -> A 3D-Matrix where:
% x| x(start_time), x(start_time + dt),..., x(end_time)
% y|                        ...
% z|                        ...
% And each page represents a seperate projectile.
%
% FUNCTIONS -> A 3D-Cell Array where:
% x| fx(t) -> A third order polynomial
% y| fy(t) -> A third order polynomial
% z| fz(t) -> A third order polynomial
% And each page represents a seperate projectile.

    %Create Matrix to hold Functions. If no end time is given, then only
    %one projectile is being tracked until impact.
    if (end_time ~= 0)  
        num_points = length(start_time:dt:end_time);
        PATHS = zeros(3, num_points, 100);
    else
        PATHS = zeros(3, 10000, 1);
    end
    
    %Loop through all the projectile data
    for projectile = 1:size(coords,1)
             
            %Read points at time t = 1, 2, 3 into arrays
            x = coords(projectile, 1, :);
            y = coords(projectile, 2, :);
            z = coords(projectile, 3, :);
            
            %Calculate the difference between points to find the
            %approximate velocity. 
            v1 = [x(2) - x(1), y(2) - y(1), z(2) - z(1)];
            v2 = [x(3) - x(2), y(3) - y(2), z(3) - z(2)];
            
            %Average of these velocities is the approximate velocity at the
            %center measurement.
            velocity = (v1+v2)./2;
            
            %Calculate the acceleration as the difference between the
            %velociites.
            accel = v2 - v1;
            
            %Find magnitude of velocity at that instant:
            velocity_mag = sqrt(sum(velocity.^2));

            %Use both x and y accelerations to solve for the A coefficiant.
            A_coeff_x = -accel(1)/(velocity(1)*velocity_mag);
            A_coeff_y = -accel(2)/(velocity(2)*velocity_mag);
            
            %Average indiviudal components to achieve a best estimate of
            %the A coefficiant
            A_coeff = abs((1/2)*(A_coeff_x + A_coeff_y));
            
            %Solve for apparent acceleration due to gravity. Add a
            %correction factor of 0.002 to bring the estimate closer.
            g = -accel(3) - A_coeff.*velocity_mag.*velocity(3) + 0.002;
            
            %Call modelTrajectory to find the trajectory of the targets.
            [x_data, y_data, z_data, ~, collision_time] = ...
                modelTrajectory([x(2), y(2), z(2)], velocity, start_time, end_time, dt, A_coeff, g, wind);
            
            %Save points into the 3d Array.
            PATHS(1,:,projectile) = x_data;
            PATHS(2,:,projectile) = y_data;
            PATHS(3,:,projectile) = z_data;

    end %End For Loop
    
end %End Function findTrajectories(coords)
