% TEST_DEROPTSTEP test_derOptStep
%   Written by: Tristan Fleming
%   Tests the function derOptStep

%% Test 1: Cumulative distribution function of the Gaussian distribution

f =@(x) (1/2)*(1 + erf(x/sqrt(2)));

fder =@(x) (1/sqrt(2*pi))*exp(-x.^2/2);

x_test = 0:0.1:10;

h_optAct = derOptStep(f, fder, x_test);

h_optExp = 1e-03;

tol = 1e-02;

checkEqual(h_optAct, h_optExp, tol, 1);