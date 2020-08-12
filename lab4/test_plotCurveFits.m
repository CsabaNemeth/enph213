% TEST_PLOTCURVEFITS test_plotCurveFits
%   Written by: Tristan Fleming
%   Tests the function plotCurveFits

%% Test 1

x = [1 3 5 9 10 14];
y = [2 3 4 5 3 3.5];

plotCurveFits(x, y)

%% Test 2

x = 1:1:9;
y = [1 1 3 5 3 5 3 1 1];

plotCurveFits(x, y)