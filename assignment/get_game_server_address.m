function address = get_game_server_address
% ADDRESS = GET_GAME_SERVER_ADDRESS retrieves the IP address of the
% Game Server from the value published on the internet.

    address = urlread('https://matlab.mathworks.com/users/sdpinder@gmail.com/Published/server/server.html');
    address = address(17:end-8);
end