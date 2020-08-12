function [server, observation] = game_client(server, function_mode, instruction)
% [SERVER, OBSERVATION] = GAME_CLIENT(SERVER, MODE, INSTRUCTION) permits
% communication with the ENPH213 2020 Game Server.  Once a game scenerio is
% initiated, observations should be collected once per second.
% 
% SERVER.address is a text string of the IP address of the Game Server in
% the form '192.168.0.1'
% 
% SERVER.id_number is a double containing the ID number of the participant
% 
% SERVER.net_id = is a character string of the form '17xxx  ' containing
% the NetID of the participant, padded with spaces to 7 characters
% 
% FUNCTION_MODE controls the purpose of the function call
% 
% SERVER = GAME_CLIENT(SERVER, 1) opens communication with the Game Server
% 
% GAME_CLIENT(SERVER, 3, INSTRUCTION) sends an instruction
% 
% [SERVER, OBSERVATION] = GAME_CLIENT(SERVER, 2) retrieves an observation
% [SERVER, OBSERVATION] = GAME_CLIENT(SERVER, 4, INSTRUCTION) sends an
% instruction and then waits to retrieve an observation
% 
% GAME_CLIENT(SERVER, 5) closes communication with the Game Server
% 
% GAME_CLIENT(SERVER, 9) instructs the Game Server to stop streaming
% observations.  Any Type 3 or Type 4 message will restart streaming.
% 
% OBSERVATION.game_time is the time stamp in seconds of the observation
% 
% OBSERVATION.pos_launch is an [x;y] pair of the location in metres of the
% launch vehicle controlled by the participant
% 
% OBSERVATION.pos_observ is an [x;y] pair of the location in metres of the
% observer vehicle controlled by the participant
% 
% OBSERVATION.vel_launch is a [Vx;Vy] pair of the velocity [m/s] of the
% launch vehicle controlled by the participant (use to confirm instructions)
% 
% OBSERVATION.vel_observ is a [Vx;Vy] pair of the velocity [m/s] of the
% observer vehicle controlled by the participant (use to confirm instructions)
% 
% OBSERVATION.target_contact is the index number of the target of a
% projectile launched by the participant, if defined (use to confirm)
% 
% OBSERVATION.planned_collision_time is the time in seconds of the planned
% collision with the target, if defined (use to confirm instructions)
% 
% OBSERVATION.pos_rel is an [x;y;z] triple of the relative position [m] of
% the target at the planned collision time, reported at that time
% 
% OBSERVATION.vel_rel is an [Vx;Vy;Vz] triple of the relative velocity [m/s]
% of the target at the planned collision time, reported at that time
% 
% OBSERVATION.az_launch is a col vector containing azimuth in radians of
% projectiles in flight observed from the launcher location, measured
% counterclockwise from the x-axis
% 
% OBSERVATION.az_observ is a col vector containing azimuth in radians of
% projectiles in flight observed from the observer location, measured
% counterclockwise from the x-axis
% 
% OBSERVATION.el_launch is a col vector containing elevation in radians
% of projectiles in flight observed from the launcher location, measured
% from the horizon
% 
% OBSERVATION.el_observ is a col vector containing elevation in radians
% of projectiles in flight observed from the observer location, measured
% from the horizon
% 
% OBSERVATION.msg_waiting is a boolean indicating whether another
% observation is waiting to be read
% 
% OBSERVATION.conn_stat contains status information [lat;reserved;reserved]
% 
% INSTRUCTION.vel_launch is a [Vx Vy] pair of the commanded velocity [m/s]
% of the launch vehicle
% 
% INSTRUCTION.vel_observ is a [Vx Vy] pair of the commanded velocity [m/s]
% of the observer vehicle
% 
% INSTRUCTION.vel_projectile is a [Vx Vy Vz] triple containing the launch
% velocity [m/s] of a commanded projectile launch (zero velocity ignored)
% 
% INSTRUCTION.t is the time in seconds of the planned collision with the target
% INSTRUCTION.c is the index number of the target of a projectile launched
% by the participant
% 
% INSTRUCTION.g = 9.81* (1 - density_air*volume_projectile/mass_projectile)
% INSTRUCTION.a = 0.5*density_air*drag_coefficient*frontal_area/mass_projectile
% 
% GAME_CLIENT version 2.2, 21 March 2020

% SERVER.next, OBSERVATION.next, and INSTRUCTION.next contain the time of
% validity of the next instruction based on the game_time of the last
% observation.  This field is meant to be undocumented.

% density_air = 1.225 [kg/m^3]
% density_lead = 11342 [kg/m^3]
% drag_coefficient = 0.47 (sphere)
% radius = 0.0276 [m] (1 [kg] of lead)
% volume_projectile = 0.00008817 [m^3]
% frontal_area = 0.00239 [m^2]
% g = 9.809 [m/s^2] (for 1-kg lead projectile)
% a = 0.0007 [1/m] (for 1-kg lead sphere)

% Copyright 2020 Shane Pinder, Ph.D., P.Eng.
    
    client_version = 2.4; % Version 2.4 is Version 2.0 compatible
    
    server_port = 30001;
    server.timeout.header = 30.0; % [s]
    server.timeout.remain = 30.0; % [s]
        
    switch function_mode
        
        case 1 % FUNCTION_MODE = 1, open communication with Game Server
            
            instrreset;
            
            tic;

            tcpip_client = tcpip(server.address, server_port);
            
            fprintf(1, 'Contacting Game Server . . . ');
            
            fopen(tcpip_client); % contact Game Server
            
            fprintf(1, 'Success.  Authenticating (Use Ctrl-C to stop) . . .\n');
            
            LocalPort = tcpip_client.LocalPort;
            
            fwrite(tcpip_client, client_version, 'double'); % send game_client version
            fwrite(tcpip_client, server.id_number, 'double'); % send ID Number
            fwrite(tcpip_client, server.net_id, 'uchar'); % send NetID
            fwrite(tcpip_client, LocalPort, 'double'); % port to use
            
            toc_ref = toc;
            
            while ((toc - toc_ref < 1.0) && (tcpip_client.BytesAvailable < 60))
                
            end
            
            if tcpip_client.BytesAvailable
                
                fprintf(1, '%s - use Ctrl-C to exit: ', fread(tcpip_client, tcpip_client.BytesAvailable, 'char'));
            end
            
            fclose(tcpip_client);
            instrreset;
            
            server.tcpip_server = tcpip(server.address, LocalPort, 'NetworkRole', 'server', 'InputBufferSize', 8192);
            fopen(server.tcpip_server); % open socket for observation data
            
            fprintf(1, 'Connection to Game Server Established.  Observations are streaming.\n');
            
            observation = [];
            server.next = -1;

        case 2 % FUNCTION_MODE = 2, get observation

            [server, observation] = get_observation(server);
            server.next = observation.next; % capture next instruction time of validity

        case 3 % FUNCTION_MODE = 3, send command
            
            instruction.next = server.next; % set instruction time of validity
            send_command(server.tcpip_server, instruction);
            observation = [];

        case 4 % FUNCTION_MODE = 4, send command and get observation

            instruction.next = server.next; % set instruction time of validity
            send_command(server.tcpip_server, instruction);
            [server, observation] = get_observation(server);
            server.next = observation.next; % capture next instruction time of validity

        case 5 % FUNCTION_MODE = 5, close connection to Game Server
            
            fprintf(1, 'Closing connection to Game Server.\n');
            fclose(server.tcpip_server);
            instrreset;
            
        case 9 % FUNCTION_MODE = 9, pause observations
            
            instruction.next = 0; % pause observation stream
            
            instruction.vel_launch = [0 0];
            instruction.vel_observ = [0 0];
            instruction.vel_projectile = [0 0 0];
            instruction.g = 0;
            instruction.a = 0;
            instruction.c = 0;
            instruction.t = 0;
            
            send_command(server.tcpip_server, instruction);
            
            server.next = -1; % flag next instruction as latent
    end
end

function [server, observation] = get_observation(server)

    [server, msg_type, msg_length] = get_header(server);
    
    [server, msg_type, msg_length] = wait_for_message(server, msg_type, msg_length);
    
    tcpip_server = server.tcpip_server;

    switch msg_type
        
        case 1 % Type-1 message
            
            observation.conn_stat = fread(tcpip_server, 3, 'double');
            
            observation.game_time = fread(tcpip_server, 1, 'double');
            
            observation.pos_launch = fread(tcpip_server, 2, 'double');
            observation.pos_observ = fread(tcpip_server, 2, 'double');
            observation.vel_launch = fread(tcpip_server, 2, 'double');
            observation.vel_observ = fread(tcpip_server, 2, 'double');
            
            observation.target_contact = fread(tcpip_server, 1, 'double');
            observation.planned_collision_time = fread(tcpip_server, 1, 'double');
            
            observation.pos_rel = fread(tcpip_server, 3, 'double');
            observation.vel_rel = fread(tcpip_server, 3, 'double');
            
            observation.az_launch = fread(tcpip_server, (msg_length - 20)/4, 'double');
            observation.az_observ = fread(tcpip_server, (msg_length - 20)/4, 'double');
            observation.el_launch = fread(tcpip_server, (msg_length - 20)/4, 'double');
            observation.el_observ = fread(tcpip_server, (msg_length - 20)/4, 'double');
            
            observation.msg_waiting = (tcpip_server.BytesAvailable > 0);
            
            if observation.msg_waiting
                
                observation.next = -1; % flag next instruction at latent
            else
                
                observation.next = observation.game_time + 1;
            end
            
        otherwise
            
            [dump.message, dump.bytes] = fread(tcpip_server);
            dump.readme = 'ENPH213 Game Server rejected message from game_client.m';
            dump.datestr = datestr(now, 31);
            save dump dump;
            fprintf(1, 'DUMPING message fragment %d b\n', dump.bytes);
            
            observation = get_observation(tcpip_server);
    end
end

function [server, msg_type, msg_length] = get_header(server)

    toc_ref = toc;
    
    while server.tcpip_server.BytesAvailable < 16 % waiting for packet from Game Server
        % wait for message header
        if toc - toc_ref > server.timeout.header
            
            disp('Header timeout exceeded, message(s) skipped, reconnecting to Game Server');
            game_client(server, 5); % close
            server = game_client(server, 1); % reconnect
            
            toc_ref = toc; % restart timeout clock
        end
    end

    msg_type = fread(server.tcpip_server, 1, 'double'); % message type
    msg_length = fread(server.tcpip_server, 1, 'double'); % message length
end

function [server, msg_type, msg_length] = wait_for_message(server, msg_type, msg_length)

    toc_ref = toc;

    while ((server.tcpip_server.BytesAvailable < msg_length*8) && (msg_type == 1))
        % wait for full message to arrive
        if toc - toc_ref > server.timeout.remain
           
            disp('Message timeout exceeded, message(s) skipped, reconnecting to Game Server');
            game_client(server, 5); % close
            server = game_client(server, 1); % reconnect
            
            [server, msg_type, msg_length] = get_header(server);
            
            toc_ref = toc; % restart timeout clock
        end
    end
end

function send_command(tcpip_server, instruction)

   fwrite(tcpip_server, [instruction.next, instruction.vel_launch(1) instruction.vel_launch(2) instruction.vel_observ(1) instruction.vel_observ(2) instruction.vel_projectile(1) instruction.vel_projectile(2) instruction.vel_projectile(3) instruction.g(1) instruction.a(1) instruction.c(1) instruction.t(1)], 'double');
end
