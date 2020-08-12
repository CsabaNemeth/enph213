% TEST_GRADIENT test_gradient
%   Written by: Tristan Fleming
%   Tests the function gradient

%% Test 1: Hyperbolic paraboloid

f =@(x,y) x.^2 - y.^2;

x = -1:0.1:1;
y = -1:0.1:1;

gradient(f, x, y);