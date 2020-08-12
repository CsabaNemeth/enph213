function [] = test_plotDiscreteFT()
% [] = test_plotDiscreteFT()
% Written by: Tristan Fleming
% tests the discrete Fourier transform function discreteFT by plotting the
% outputs

% Test Data 

x = [0:1:7].*pi/8;
f_x = sin(4*x);


plotDiscreteFT( x, f_x )



end

