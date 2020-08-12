function [] = test_plotLeastMeanSquareFit()
%[] = test_plotLeastMeanSquareFit()
% Written by: David DeVries
% tests the plotLeastMeanSquareFit function with test V and t data, and
% uses the leastMeanSquareFit function to get real a and f_0 values

%% TEST 1
% set variables
t_fit = 0:0.02:0.18; % time [s]
V_fit = [0.976 0.329 -0.279 -0.408 -0.141 0.144 0.143 0.009 -0.072 -0.047];%[V]

V_fit_error = 0.03;

% starting values for a and f_0
initial_a = 13;
initial_f_0 = 10;

% perform fit
[a, f_0] = leastMeanSquareFit(V_fit, t_fit, initial_a, initial_f_0);

% plot
plotLeastMeanSquareFit(V_fit, t_fit, V_fit_error, a, f_0)



end

