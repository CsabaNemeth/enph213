function [val] = fn2ToIntegrateX(phi, z)
%Integrand Value [val] = fn2ToIntegrateX(phi, z)
%Written By: Csaba Nemeth
%
%fn2ToIntegrateX takes two vector arguments:
% phi -> Angular position along magnet.
% z -> height along magnet.
%
%The function returns an integrand in the x direction that can be used to integrate the force
%between the two magnets. This is done by calculating the magnetic field
%componenet across all phi and z using a for loop, and storing the field in
%a 2-D array "val".

%Initialize and import required global variables.
setupGlobalVariables();
global R K

%Initialize return array with dimensions (rows, cols) = z, phi.
val = ones(length(z), length(phi));

%Initiate nested for loop across all z and phi elements.
for m = 1:length(z)
    for n = 1:length(phi)
        
        %For each z, phi combination calculate x, y and z points.
        x1 = R*cos(phi(m, n));
        y1 = R*sin(phi(m, n));
        z1 = z(m, n);
        
        %Calcualte z-component of the magnetic field.
        [~, ~, Bz] = B(x1, y1, z1);
        
        %Append the integrand into the val 2-D array.
        val(m, n) = R*(-K*cos(phi(m, n))*Bz);
        
    end %end inner loop
end %end outer loop

end %End function.
