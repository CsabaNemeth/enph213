server.id_number = input('Enter your Student ID Number: ');
server.net_id = input('Enter your NetID username: ', 's');

address = urlread('https://matlab.mathworks.com/users/sdpinder@gmail.com/Published/server/server.html');
server.address = address(17:end-8);

% server.address = input('Server address [10.217.209.22]: ', 's');
% 
% if isempty(server.address)
    
%     server.address = '10.217.209.22';
% end

while length(server.net_id) < 7
    
    server.net_id = [server.net_id ' ']; % pad net_id to seven characters
end

fprintf(1, 'Attempting to connect to %s: ', server.address);

for attempts = 1:5 % try (maximum five times) to connect to Game Server
    
    fprintf(1, '%i ', attempts);
    
    try % game_client will throw an error if connection is unsuccesful
        
        server = game_client(server, 1); % open communication with Game Server
        
        % IF NOT AUTH, GAME SERVER WILL NEVER CONNECT, and no message
        % will be received to indicate not auth - CODE WILL HANG HERE
        
        disp('- connection successful.');
        
        break; % connection was successful, so do not try again, break out of for loop
    end
end

if attempts < 5
    
    disp('Retrieving 30 observations . . .');
    
    for obs = 1:30
        
        fprintf(1, '%i ', obs);
        
        [server, observation(obs)] = game_client(server, 2); % get observations
    end
    
    disp(' -done.');
    
    game_client(server, 5); % closes connection with Game Server
    
    disp('Observations are stored in your workspace in observation(1), observation(2), etc.');
end