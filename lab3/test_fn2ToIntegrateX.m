function [] = test_fn2ToIntegrateX()
%[] = test_fn2ToIntegrateX()
% Written by: David DeVries
% tests the integration function for the x component of the force
% calculation between two magnets

[psi, z] = meshgrid(0:2, 3:5);

% actual
valsAct = fn2ToIntegrateX(psi, z);

% expect
valsExp = [...
    -0.0168,   -0.0091,    0.0070;
    -0.0071,   -0.0038,    0.0029;
    -0.0036,   -0.0019,    0.0015];

% tolerance
tol = 0.0001;

% check
checkEqual(valsAct, valsExp, tol, 1);

end

