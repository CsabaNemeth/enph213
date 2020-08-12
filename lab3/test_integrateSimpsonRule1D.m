function [] = test_integrateSimpsonRule1D()
% [] = test_integrateSimpsonRule1D()
% Written by: David DeVries
% tests the integrateSimpsonRule1D function with a basic integral (the
% error function)

% set function to integrate
f = @(x) (1/sqrt(2*pi)).*exp(-(x.^2)./2);

% set integration parameters
n = 20;
t= 0.5;

xL = -t;
xU = t;

% actual
integralAct = integrateSimpsonRule1D(f, xL, xU, n);

% expected
integralExp = 0.3829;

% tolerance
tol = 0.0001;


% checks
checkEqual(integralAct, integralExp, tol, 1);

end