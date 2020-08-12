function [C, R, dC, dR] = findCapacitanceAndResistance(f, V, I, dV, dI)
% FINDCAPACITANCEANDRESISTANCE [C, R, dC, dR] = findCapacitanceAndResistance(f, V, I, dV, dI)
%   Written by: Csaba Nemeth
%   takes in frequency in Hz (f), voltage in V (V), current in A (I), error
%   in voltage (dV), and error in current (dI). Through linear regression,
%   the capacitance in F (C) and resistance in Ohms (R) of the circuit are 
%   found, along with the errors (dL and dR)

% YOUR CODE GOES HERE

%Calculate angular frequency squared.
w2 = ((2*pi).*f).^2;

%Calculate uncertainty in Z by performing an error propogration.
dZSq = ((Z2(V+dV,I)-Z2(V,I)).^2+(Z2(V,I+dI)-Z2(V,I)).^2).^0.5;

%Call the previously defined weighted regression function with 1/w^2 as x
%and the impedence squared as y. 
[reg_b, reg_m, reg_db, reg_dm] = wRegression(1./w2, Z2(V, I), dZSq);

%Calculate the resistance and uncertainty in the resistance through
%error propagation.
R = sqrt(b);
dR = abs(sqrt(b+db)-sqrt(b));

%Calculate the capacitance and uncertainty in the capacitance through
%error propagation.
C = sqrt(1/m);
dC = abs(sqrt(1/(m+dm))-sqrt(1/m));

end

% HELPER FUNCTIONS

function zSqrd = Z2(V,I)
% takes the voltage (V) and current (I) and finds the impedance squared
% (zSqrd)

% YOUR CODE GOES HERE
%Calculate zSqrd using element operations.
zSqrd = (V./I).^2;

end
