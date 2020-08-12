% FUNCTION [X, Y, Z, T] = P_MODEL(V0X, V0Y, V0Z, DT)
% computes projectile trajectory, X=f(T) [m], Y=f(T) [m], and Z=f(T) [m],
% and corresponding time vector, T [s], given initial projectile speeds
% in the x, y, and z directions, V0X [m/s], V0Y [m/s], and V0Z [m/s], and
% differential time step, DT [s].
% The dynamic model for this motion uses g = 9.81 [m/s^2].

% Note: The differential time step is the spacing of times in the time
% vector.
% You may wish to use: The projectile is launched from X=Y=Z=0.

% Note future plans to include capability to model trajectories in the
% presence of aerodynamic drag:
%
% FUNCTION [X, Y, T] = P_MODEL(V0X, V0Y, DT, M, CD, A, VOL, RHO)
% 
% projectile mass, M [kg], coefficient of drag, CD, frontal area, A [m^2],
% volume, VOL [m^3], and air density, RHO [kg/m^3].

[X, Y, Z, T] = P_MODEL(50, 10, 0, 0.01, 1, 0.47, 2, 1.225);
%plotTrajectory(X, Y, Z, T);

function [X, Y, Z, T] = P_MODEL(VOX, VOY, VOZ, DT, M, CD, A, RHO)

    %Setup initial conditions:
    s_vector = [0, 0, 0]; %Initial location is 0;
    v_vector = [VOX, VOY, VOZ]; %Velocity is inital veloctity.
    a_vector = [0, 0, -9.81];
    drag_a_vector = [0, 0, 0];
    T = 0;

    curr_index = 1;
    
    drag = @(V) ((1/2).*CD.*RHO.*A.*V.^2)/M;
    
    %Initialize arrays of data
    data_sx = zeros(1000);
    data_sy = zeros(1000);
    data_sz = zeros(1000);
    data_T = zeros(1000);
  
    %Initiate while loop.
    while (s_vector(3) >= 0)
    
        %Update velocities.
        v_vector = v_vector + a_vector.*DT;
        vmag = sqrt(sum(v_vector.^2));
        
        %Update positions.
        s_vector = s_vector + v_vector.*DT;

        %Calculate drag.
        drag_mag = drag(vmag);
        signs_v = sign(v_vector);
        
        %Update accelerations.
        drag_a_vector = drag_a_vector + -signs_v.*((v_vector./vmag).*drag_mag);
        %a_vector = a_vector + drag_a_vector;
        
        %Save current x, y, z position of projectile.
        data_sx(curr_index) = s_vector(1);
        data_sy(curr_index) = s_vector(2);
        data_sz(curr_index) = s_vector(3);
        
        %Save and update current time 
        T = T + DT;
        data_T(curr_index) = T;
        curr_index = curr_index + 1;
   
    end
    
    x_limit = data_sx(curr_index-1) + 20;
    y_limit = data_sy(curr_index-1) + 20;
    z_limit = data_sz(find(data_sz == max(data_sz), 1, 'first')) + 20;

    figure;
    pause(0.3);
    
    for index = 1:curr_index
        
        
        plot3(data_sx(1:index), data_sy(1:index), data_sz(1:index));
        grid minor;
        xlim([0, x_limit]);
        ylim([-y_limit, y_limit]);
        zlim([0, z_limit]);
        pause(DT);
        
    end
    
    X = polyfit(data_T, data_sx, 2);
    Y = polyfit(data_T, data_sy, 2);
    Z = polyfit(data_T, data_sz, 2);
    
end









