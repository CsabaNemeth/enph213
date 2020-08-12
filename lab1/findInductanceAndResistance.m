function [L, R, dL, dR] = findInductanceAndResistance(f, V, I, dV, dI)
% FINDINDUCTANCEANDRESISTANCE [L, R, dL, dR] = findInductanceAndResistance(f, V, I, dV, dI)
%   Written by: Csaba Nemeth
%   takes in frequency in Hz (f), voltage in V (V), current in A (I), error
%   in voltage (dV), and error in current (dI). Through linear regression,
%   the inductance in H (L) and resistance in Ohms (R) of the circuit are 
%   found, along with the errors (dL and dR)

% YOUR CODE GOES HERE

%Calculate angular frequency
w2 = ((2*pi).*f).^2;

%Calculate uncertainty in Z
dZSq = ((Z2(V+dV,I)-Z2(V,I)).^2+(Z2(V,I+dI)-Z2(V,I)).^2).^0.5;

%Call regression to calculate slope and intercept
[b, m, db, dm] = wRegression(w2, Z2(V, I), dZSq);

%Calculate the resistance and uncertainty in the resistance through
%error propagation.
R = sqrt(b);
dR = abs(sqrt(b+db)-sqrt(b));

%Calculate the inductance and uncertainty in the inductance through
%error propagation.
L = sqrt(m);
dL = abs(sqrt(m+dm)-sqrt(m));

end

% HELPER FUNCTIONS

function zSqrd = Z2(V,I)
% takes the voltage (V) and current (I) and finds the impedance squared
% (zSqrd)

% YOUR CODE GOES HERE
%Calculate zSqrd using element operations.
zSqrd = (V./I).^2;

end