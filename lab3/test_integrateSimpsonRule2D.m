function [] = test_integrateSimpsonRule2D()
% [] = test_integrateSimpsonRule2D()
% Written by: David DeVries
% tests the integrateSimpsonRule2D function with a basic integral

% set function for integration
f = @(theta,psi) 10.*cos(theta).*sin(psi);

% set integration params
thetaN = 10;
psiN = 2;

thetaL = 0;
thetaU = pi/2;

psiL = 0;
psiU = pi/4;

% actual
integralAct = integrateSimpsonRule2D(f, thetaL, thetaU, thetaN, psiL, psiU, psiN);

% expected
integralExp = 2.9290;

% tolerance
tol = 0.0001;

% checks
checkEqual(integralAct, integralExp, tol, 1);

end