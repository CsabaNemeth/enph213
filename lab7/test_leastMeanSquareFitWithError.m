function [] = test_leastMeanSquareFitWithError()
%[] = test_leastMeanSquareFitWithError()
% Written by: David DeVries
% tests the leastMeanSquareFitWithError function by using it to fit
% measured values for V and t. The error in a and f_0 is also tested

%% TEST 1
% set variables
t_fit = 0:0.02:0.18; % time [s]
V_fit = [0.976 0.329 -0.279 -0.408 -0.141 0.144 0.143 0.009 -0.072 -0.047];%[V]

V_fit_error = 0.03;

% starting values for a and f_0
a_init = 13;
f0_init = 10;

% actual value
[aAct, f_0Act, d_aAct, d_f0Act] = leastMeanSquareFitWithError(V_fit, t_fit, V_fit_error, a_init, f0_init);

% expect value
aExp = 15.4314;
f_0Exp = 8.5833;

d_aExp = 0.7600;
d_f0Exp = 0.1208;

% tolerance
tol = 0.001;

% check
checkEqual(aAct, aExp, tol, 1);
checkEqual(f_0Act, f_0Exp, tol, 2);
checkEqual(d_aAct, d_aExp, tol, 3);
checkEqual(d_f0Act, d_f0Exp, tol, 4);



end

