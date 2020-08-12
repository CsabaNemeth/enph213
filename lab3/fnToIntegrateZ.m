function [val] = fnToIntegrateZ(x1, y1, z1, phi, z)
%Integrand Value [val] = fnToIntegrateZ(x1, y1, z1, phi, z)
%Written By: Csaba Nemeth
%
%fnToIntegrateZ takes five vector arguments:
% x1 -> x-coordinate at point of measurement.
% y1 -> y-coordinate at point of measurement.
% z1 -> z-coordinate at point of measurement.
% phi -> angular position along magnet at source point.
% z -> height along the magnet at source point.
%
%The function calculates the integrand necesary to compute the
%z-componenet Bz of the magnetic field. 

%Initialize and import required global variables.
setupGlobalVariables();
global R u_0 K

%Calculate the x, y, z components of the seperation vector r.
r_x = x1-R.*cos(phi);
r_y = y1 - R.*sin(phi);
r_z = z1 - z;

%Calculate the required components of the surface current density.
k_x = -K*sin(phi);
k_y = K.*cos(phi);

%Calculate the magnitude of the seperation vector.
mag_r = sqrt(r_x.^2 + r_y.^2 + r_z.^2);

%Calculate the integrand value by multiplying the constant term with K
%cross R in the z direction.
val = ((u_0 .* R)./(4.*pi.*mag_r.^3)).*(k_x.*r_y - k_y.*r_x);

end %End function.