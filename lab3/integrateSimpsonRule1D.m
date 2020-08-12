function [integral] = integrateSimpsonRule1D(f, xL, xU, xN)
% Simpson's Rule Integral [integral] = integrateSimpsonRule1D(f, xL, xU, xN)
% Written By: Csaba Nemeth
%
%integrateSimpsonRule1D takes four inputs where:
% f -> inline function of one variable as the integrand.
% xL -> lower limit on integration.
% xU -> upper limit on integration.
% xN -> number of intervals to compute.
%
%The function returns the value "integral", the approximate area defined
%by the curve using integration by Simpson's rule. 
%Reference for Simpson's Rule:
%https://en.wikipedia.org/wiki/Simpson%27s_rule

%Define step-size dx.
dx  = (xU - xL)./(2*xN);

%Simpson's rule requires alternating coefficants of 4 and 2 to complete the
%sum required for the approximation (excluding coefficiants on upper and
%lower limit). 
%form: (dx/3)*sum( f(xL) + 4(f(xL + dx)) + 2(f(xL + 2dx)) +...+ f(xU) )
% 
%Thus, we create a weighting array with alternating fours and twos,
%starting at the second element and ending before the final element.
%Initialize weighting array with ones.
W = ones(1, 2*xN +1);

%Starting at 2nd element, change every 2nd element to 4.
W(2:2:end-1) = 4;

%Starting at 3rd element, change every 2nd element to 2.
W(3:2:end-2) = 2;

%Create an array with x values to be evaluated by the function, where each
%value is the lower limit plus an increasing integer multiple of dx.
x = xL + (0:xN*2).*dx;

%Evaluate the function at all x values. 
fx = f(x);

%Multiply the evaluated function array fx by the weighting array and compute
%the sum. Multiply the sum by dx/3 to complete the integral.
integral = (dx/3).*sum(fx.*W);

end %end function.

