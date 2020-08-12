% TEST_REGRESSIONPLOT test_regressionPlot
%   Written by: T. Fleming
%   Tests the function regressionPlot with multiple test cases

% Define the sample data given in the lab handout
x = [0, 1, 2, 3, 4, 5];
y = [0.3, 1, 2.2, 3.7, 4.0, 5.9];
dy = [0.1, 0.2, 0.3, 0.4, 0.5, 0.8];

% Plot the data, along with the line of fit outputted from your wRegression
% function, using your regressionPlot function
% Compare to the figure in the lab write-up

regressionPlot(x, y, dy);