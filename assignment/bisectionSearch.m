function velocity = bisectionSearch(pos_target, pos_launcher, t_initial, t_collision, g, A_coeff, wind)
%TARGET VELOCITY velocity = bisectionSearch(pos_target, pos_launcher, t_initial, t_collision, g, A_coeff, wind)
%Written By: Csaba Nemeth
%Version Since: 2020-04-05
%
% Uses a bisection search to find the initial velocity needed to intersect
% a position pa_target at a time t_collision. The function takes an input of 
% the target position pos_target, the position of the launcher
% pos_launcher, the initial time t_initial, the desired time of collision
% t_collision, the effective gravity g, the A coefficiant of the launch
% projectile and the wind. The Function completes 16 iterations for an
% absolute accuracy of 0.002%.

%Define anonymous function as modelTrajectory.m
F = @(V) modelTrajectory(pos_launcher, V, t_initial, t_collision, A_coeff, g, wind);

%Declare solution.
velocity = zeros(1, 3);
V_a_init = zeros(1, 3);
V_b_init = zeros(1, 3);

%Set the inital boundary on condition for the interval. The velocity is the
%calculaed velocity for a maximum 5000 J launch.
for i = 1:3
    if pos_target(i) - pos_launhcer(i) > 0
        V_a_init(i) = 44.7;
        V_b_init(i) = 0;
    else
        V_a_init(i) = 0;
        V_b_init(i) = -44.7;
    end
end

%Complete initial bisection, here we force the first bisection to occur for
%a velocity of 5 m/s. This is an arbitrary value, but for safety, do not
%want to pass 0 m/s to modelTrajectory.
V_m_init = 5;

%Run bisection search for x, y, z, coordinates.
for dim = 1:3
    
    %Set current interval and bisection as starting values.
    V_a = V_a_init;
    V_b = V_b_init;
    V_m = V_m_init;
    
    for N = 1:16
        value_a = F(V_a).*F(V_m);
        value_b = F(V_b).*F(V_b);
        
        %Check bisection and adjust [a, b] interval.
        if (value_a(dim) > 0)
            V_a = V_m;
            V_m = (V_a + V_b)/2;     
        elseif (value_b(dim) > 0)
            V_b = V_m;
            V_m = (V_a + V_b)/2;    
        else
            V_a = V_m;
            V_b = V_m;
            break;
        end
    end
    %Set velocity solution to current bisection.
    velocity(dim) = V_m(dim);
end
