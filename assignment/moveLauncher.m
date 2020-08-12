function velocity = moveLauncher(targetPosition, currentPosition)
%Target VELOCITY velocity = moveLauncher(targetPosition, currentPosition)
%Written By: Csaba Nemeth
%Version Since: 2020-04-05
%
% Returns the maximum velocity of the launcher ot move in the direction of
% the target position. Takes an input of the current position
% currentPosition and the target position targetPosition. Returns the
% velocity vector velocity.

%Find direction and declare maximum total velocty.
direction_vector = targetPosition - currentPosition;

%Keep adding velocities in the direction until a total velocity of 30 m/s
%is reached.
for vel = 1:30
    v = vel.*direction_vector;
    v_mag = sqrt(sum(v.^2));
    if (v_mag > 29)
        break;
    end
end

%Set final velocity.
velocity = v;

end
