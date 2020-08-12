function [] = test_fn2ToIntegrateZ()
%[] = test_fn2ToIntegrateZ()
% Written by: David DeVries
% tests the integration function for the z component of the force
% calculation between two magnets

[psi, z] = meshgrid(0:2, 3:5);

% actual
valsAct = fn2ToIntegrateZ(psi, z);

% expect
valsExp = 1.0e-03 * [...
    0.2121,    0.2121,    0.2121;
    0.0665,    0.0665,    0.0665;
    0.0271,    0.0271,    0.0271];

% tolerance
tol = 1.0e-03 * 0.0001;

% check
checkEqual(valsAct, valsExp, tol, 1);

end

