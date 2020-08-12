function [integral] = integrateTrapRule(x, y)
% Trapezoidal Integral [integral] = integrateTrapRule(x, y)
% Written By: Csaba Nemeth
% 
% integrateTrapRule takes two inputs of 1-D arrays where:
% x -> x component of data point.
% y -> y componenet of data point.
%
% The function returns the value "integral", the approximate area defined
% by the curve using trapezoidal integration. 
% Reference for trapezoidal integration:
% https://en.wikipedia.org/wiki/Trapezoidal_rule.

%Calculate the x difference bewteen adjacent data points. Returns a vector of
%length N-1.
diff_x = diff(x);

%Calculate the sum between adjacent sets. Returns vector of length N.
sum_y = movsum(y, [0, 1]);

%Movsum returns a vector of length N with an input of length N (in this
%case, the final element is returned as there is no next element). The
%final element is thus discarded to return an N-1 array, which matches the
%dimensions of the differences.
sum_y = sum_y(1:length(diff_x));

%Using the formula found at the reference above, the trapezoids are
%calculated and summed.
integral = sum((diff_x.*(sum_y./2)));

%NOTE: alternatively, the matlab function trapz(x, y) is equivilant to the
%method implemented above.

end %end function