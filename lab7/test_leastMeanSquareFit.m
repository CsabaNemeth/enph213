function [] = test_leastMeanSquareFit()
%[] = test_leastMeanSquareFit()
% Written by: David DeVries
% tests the leastMeanSquareFit function by using it to fit the test values
% for V and t

%% TEST 1
% set variables
t_fit = 0:0.02:0.18; % time [s]
V_fit = [0.976 0.329 -0.279 -0.408 -0.141 0.144 0.143 0.009 -0.072 -0.047];%[V]

% starting values for a and f_0
a_init = 13;
f0_init = 10;

% actual value
[aAct, f0_Act, ~] = leastMeanSquareFit(V_fit, t_fit, a_init, f0_init);

% expect value
aExp = 15.4314;
f0_Exp = 8.5833;

% tolerance
tol = 0.001;

% check
checkEqual(aAct, aExp, tol, 1);
checkEqual(f0_Act, f0_Exp, tol, 2);



end

