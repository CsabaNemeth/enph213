function setupGlobalVariables()
%Initialize Global Variables [] =  setupGlobalVariables()
%Written by: Csaba Nemeth
%
%setupGlobalVariables() takes no inputs and does not return an output. The
%function initializes global variables (accessible to all functions in the
%directory):
%
% R -> Magnet Radius 0.025 [m] 
% D -> Magnet Thickness 0.05 [m]
% K -> Surface Current 0.95e+6 [A/m]
% u_0 -> Magnetic Permeability (4pi)e-7 [N/A^2]
% n -> Number Of Regions 10 []

%Declare global variable names.
global R D K u_0 n

%Assign values to global variables.
R = 0.025;
D = 0.05;
K = 0.95e+6;
u_0 = (4*pi)*1e-7;
n = 10;

end %End function.

