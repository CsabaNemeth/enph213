function [integral] = integrateSimpsonRule2D(f, xL, xU, xN, yL, yU, yN)
%Simpson's Rule Integral [integral] = integrateSimpsonRule2D(f, xL, xU, xN, yL, yU, yN)
%Written By: Csaba Nemeth
%
%integrateSimpsonRule2D takes 7 inputs where:
% f -> inline function of two variables as the integrand.
% xL -> lower x limit on integration.
% xU -> upper x limit on integration.
% xN -> number of x intervals to compute.
% yL -> lower y limit on integration.
% yU -> upper y limit on integration.
% yN -> number of y intervals to compute.

% The function returns the value "integral", the approximate volume defined
% by the curve using integration by Simpson's rule. 
% Reference for Simpson's Rule:
% https://en.wikipedia.org/wiki/Simpson%27s_rule

%Define step-size dx and step size dy.
dx  = (xU - xL)./(2*xN);
dy  = (yU - yL)./(2*yN);

%Simpson's rule requires alternating coefficants of 4 and 2 to complete the
%sum required for the approximation (excluding coefficiants on upper and
%lower limit). 
%We create a weighting matrix with alternating fours and twos,
%starting at the second element and ending before the final element.

%Initialize weighting matrices with ones.
W_x = ones(1, 2*xN +1);
W_y = ones(1, 2*yN +1);

%Populate both x, and y arrays with 2s and 4s.
%Starting at 2nd element, change every 2nd element to 4.
W_x(2:2:end-1) = 4;
%Starting at 3rd element, change every 2nd element to 2.
W_x(3:2:end-2) = 2;
%Starting at 2nd element, change every 2nd element to 4.
W_y(2:2:end-1) = 4;
%Starting at 3rd element, change every 2nd element to 2.
W_y(3:2:end-2) = 2;

%To compute the weighting matrix, create a 2-D grid with the w_x vector as
%the rows in the matrix.
W = meshgrid(W_x, W_y);

%The weighting matrix is multiplied by the transformed w_y matrix to
%create the weighting grid.
W = (W_y.') .* W;

%Create arrays with x, y values to be evaluated by the function.
x = xL + (0:xN*2).*dx;
y = yL + (0:yN*2).*dy;

%Create a 2-D grid with x, y points to be evaluted.
[X, Y] = meshgrid(x, y);

%Evaluate all points across the matrix.
f_xy = f(X, Y);

%Multiply the evaluated points by the weighting and sum the values.
%Multiply the sum by dx/3 and dy/3 to complete the integral.
integral = (dx/3).*(dy/3).*sum(sum((f_xy.*W)));

end %End Function
