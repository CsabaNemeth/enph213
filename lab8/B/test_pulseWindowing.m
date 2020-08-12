
close all
x = [-1/8:1/20:17/8].*pi;
pulse =@(X) sin(2*X);

% x = [-1/8:1/20:17/8].*pi;
% pulse =@(X) sin(2*X);

pulseWindowing(x,pulse)