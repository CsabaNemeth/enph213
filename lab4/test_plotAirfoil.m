% TEST_PLOTAIRFOIL test_plotAirfoil
%   Written by: Tristan Fleming
%   Tests the function plotAirfoil

%% Test 1

x = [0 0.01 0.06 0.4 0.9 1.0];
y = [0 0.04 0.1 0.2 0.05 0]; 

plotAirfoil(x, y, 4, -0.5);