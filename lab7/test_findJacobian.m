function [] = test_findJacobian()
%[] = test_findJacobian()
% Written by: David DeVries
% tests the findJacobian function for sample set of a V data

%% TEST 1
% set variables
t_fit = 0:0.02:0.18; % time [s]
V_fit = [0.976 0.329 -0.279 -0.408 -0.141 0.144 0.143 0.009 -0.072 -0.047];%[V]

a = 10;
f_0 = 15;

% actual value
jacobianAct = findJacobian(a, f_0, V_fit, t_fit);

% expect value
jacobianExp = [0.0184, 0.0041; 0.0041, -0.0046];

% tolerance
tol = 0.0001;

% check
checkEqual(jacobianAct, jacobianExp, tol, 1);



end

