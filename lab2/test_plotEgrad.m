% TEST_PLOTEGRAD test_plotEgrad
%   Written by: Tristan Fleming

%% Test 1: Electric dipole

x = -0.25:0.01:0.25;
y = -0.25:0.01:0.25;

rPlus =@(x,y,z) sqrt(x.^2+(y-0.1).^2+z.^2);
rMinus =@(x,y,z) sqrt(x.^2+(y+0.1).^2+z.^2);

V =@(x, y, z) (1./rPlus(x,y,z)) - (1./rMinus(x,y,z));

plotEgrad(V, x, y)