function [] = test_fn2ToIntegrateY()
%[] = test_fn2ToIntegrateY()
% Written by: David DeVries
% tests the integration function for the y component of the force
% calculation between two magnets

[psi, z] = meshgrid(0:2, 3:5);

% actual
valsAct = fn2ToIntegrateY(psi, z);

% expect
valsExp = [...
    0,   -0.0142,   -0.0153;
    0,   -0.0059,   -0.0064;
    0,   -0.0030,   -0.0033];

% tolerance
tol = 0.0001;

% check
checkEqual(valsAct, valsExp, tol, 1);

end

