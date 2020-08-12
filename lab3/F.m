function [Fx, Fy, Fz] = F(d)
% Magnetic Force [Fx, Fy, Fz] = F(d)
%Written By: Csaba Nemeth.
%
%F takes one argument d, the seperation distance between along the z-axis of two
%magnets. The function returns the x, y and z componenets of the force
%between the two magnets. This is done by integrating the magnetic field
%integrand across all angles and along the seperation distance including
%the magnet thickness.

%Initialize and import required global variables.
setupGlobalVariables();
global D n

%Initialize inline functions defining the integrands of the x, y, z
%componenets of the field.
fnX = @fn2ToIntegrateX;
fnY = @fn2ToIntegrateY;
fnZ = @fn2ToIntegrateZ;

%Integrate the integrands from phi: 0 -> 2pi and z: D+d -> 2D + d;
Fx = integrateSimpsonRule2D(fnX, 0, 2*pi, n, D+d, 2*D +d, n);
Fy = integrateSimpsonRule2D(fnY, 0, 2*pi, n, D+d, 2*D +d, n);
Fz = integrateSimpsonRule2D(fnZ, 0, 2*pi, n, D+d, 2*D +d, n);

end %End function.
