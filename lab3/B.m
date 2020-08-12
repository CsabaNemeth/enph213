function [Bx, By, Bz] = B(x1, y1, z1)
% Magnetic Field [Bx, By, Bz] = B(x1, y1, z1);
% Written By: Csaba Nemeth
%
% B takes three vector arguments:
% x1 -> x-coordinate at point of measurement.
% y1 -> y-coordinate at point of measurement.
% z1 -> z-coordinate at point of measurement.
%
%The function integrates the componenets of the magnetic field across z and
%phi in cyclindrical coordinates.

%Initialize and import required global variables.
setupGlobalVariables();
global n D

%Create inline functions of arguments phi and z that define the integrand
%componenets at the point of measurement. The integrand is found using the previously
%defined functions.
fnX = @(phi, z) fnToIntegrateX(x1, y1, z1, phi, z);
fnY = @(phi, z) fnToIntegrateY(x1, y1, z1, phi, z);
fnZ = @(phi, z) fnToIntegrateZ(x1, y1, z1, phi, z);

%Caculate the magnetic field componenets by integrating the inline
%functions from phi: 0 -> 2pi and z: 0 -> D.
Bx = integrateSimpsonRule2D(fnX, 0, 2*pi, n, 0, D, n);
By = integrateSimpsonRule2D(fnY, 0, 2*pi, n, 0, D, n);
Bz = integrateSimpsonRule2D(fnZ, 0, 2*pi, n, 0, D, n);

end %End Function.
