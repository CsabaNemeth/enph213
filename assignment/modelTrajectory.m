
function [data_sx, data_sy, data_sz, start_time, collision_time] = ...
    modelTrajectory(pos_0, vel_0, start_time, collision_time, dt, A_coeff, g, wind)
%Written By: Csaba Nemeth
%Version: 2.0 since 2020-03-27
%
%Models the the trajectory of the specified projectile and returns three
%data sets containing the x, y, z position at each interval of dt. Also
%returns the start time and the collision time, if no collision time is
%pre-specified.
%
%Takes inputs the inital position pos_0, the inital velocity vel_0, the
%start time, the collision time (if specified as 0 then the trajectory is
%computed until the ground is hit), the desired timestep dt, the A_coeff of
%the projectile
%(0.5*density_air*drag_coefficient*frontal_area/mass_projectile), the
%effective gravity g (9.81* (1 - density_air*volume_projectile/mass_projectile)
%and a vector defining the current wind.

%Import initial conditions into vectors.
s_vector = pos_0;
v_vector = vel_0;

%Initialize arrays to store data. The assumption is that 1000 points will
%be enough using the current time step.
data_sx = zeros(1, 10000);
data_sy = zeros(1, 10000);
data_sz = zeros(1, 10000);
T = zeros(1, 1000);

%Loop across the time interval. Terminating condition is either the passed
%time of collision or the moment that the ground is hit.
index = 1;
if collision_time ~= 0 
    for time = start_time:dt:collision_time
        %Append current time to array
        T(index) = time;
    
        %Append positions to arrays
        data_sx(index) = s_vector(1);
        data_sy(index) = s_vector(2);
        data_sz(index) = s_vector(3);
    
        %Update Values
        [v_vector, a_vector] = getNewValues(v_vector, wind, g, A_coeff, dt);
        s_vector = s_vector + v_vector.*dt + (1/2).*a_vector.*(dt.^2);
    
        %Update index value
        index = index + 1;
        
    end %End find posiitons loop.
else
    time = start_time;
    while s_vector(3) >= 0
        %Append current time to array
        T(index) = time;
    
        %Append positions to arrays
        data_sx(index) = s_vector(1);
        data_sy(index) = s_vector(2);
        data_sz(index) = s_vector(3);
    
        %Update Values
        [v_vector, a_vector] = getNewValues(v_vector, wind, g, A_coeff, dt);
        s_vector = s_vector + v_vector.*dt + (1/2).*a_vector.*(dt.^2);
    
        %Update index value
        index = index + 1;
        
        %Update time step
        time = time + dt;
    end
    collision_time = floor(time);
end

%Trim trailing zeros on data.
data_sx = data_sx(1:find(data_sx,1,'last'));
data_sy = data_sy(1:find(data_sy,1,'last'));
data_sz = data_sz(1:find(data_sz,1,'last'));

end %End function modelTrajectory(..)

%Helper function to update the velocity and acceleration values.
function [velocity, acceleration] = getNewValues(velocity, wind, g, A_coeff, dt)

%Correct velocity based on wind
v_corrected = [velocity(1) - wind(1), velocity(2) - wind(2), velocity(3)];

%Update acceleration value
acceleration = getAcceleration(v_corrected, g, A_coeff);

%Update velocities
velocity = velocity + acceleration.*dt;

end %End function getNewValues(..)

%Helper function to find the current acceleration
function acceleration = getAcceleration(velocity, g, A_coeff)

%Construction acceleration vector.
acceleration = [0, 0, 0];

%Find magnitude of the velocity.
v_mag = sqrt(sum(velocity.^2));

%Compute the acceleration due to drag.
drag_acceleration = findDragAccel(A_coeff, v_mag);

%Update the acceleration vector with the drag components and g.
acceleration(1) = - drag_acceleration.*velocity(1)./v_mag;
acceleration(2) = - drag_acceleration.*velocity(2)./v_mag;
acceleration(3) = - g - drag_acceleration.*velocity(3)./v_mag;

end %End function getAcceleration(..)

%Helper function to find the drag due to acceleration.
function acceleration = findDragAccel(A_coeff, v_mag)
%Compute using the A_coeff coefficiant.
acceleration = A_coeff.*v_mag.^2;
end %End function findDragAccel(..)

