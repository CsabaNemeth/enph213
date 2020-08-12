function [] = test_G()
%[] = test_G()
% Written by: David DeVries
% tests the G function to make sure the values are right

%% TEST 1
% set variables
t_fit = 0:0.02:0.18; % time [s]
V_fit = [0.976 0.329 -0.279 -0.408 -0.141 0.144 0.143 0.009 -0.072 -0.047];%[V]

a = 10;
f_0 = 15;

% actual value
dAct = G(a, f_0, V_fit, t_fit);

% expect value
dExp = 0.0989;

% tolerance
tol = 0.0001;

% check
checkEqual(dAct, dExp, tol, 1);



end

