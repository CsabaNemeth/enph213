% TEST_PLOTLEASTSQUARESPOLY test_plotLeastSquaresPoly
%   Written by: Tristan Fleming
%   Tests the function leastSquaresPoly

%% Test 1

x = [1 3 4.5 7 8 10];
y = [2 3 3.6 3.8 3.5 3];

fig1 = plotLeastSquaresPoly(x, y, 3);

%% Test 2

x = 1:1:9;
y = [1 1 3 5 3 5 3 1 1];

fig2 = plotLeastSquaresPoly(x, y, 5);

