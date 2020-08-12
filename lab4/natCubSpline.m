function [a, b, c, d] = natCubSpline(x, y)
%Cubic Spline Coefficiants [a, b, c, d] = natCubSpline(x, y)
%Written By: Csaba Nemeth
%
%natCubSpline takes two arguments of x and y values defining a datapoints.
%The arrays are of dimension (1, n+1). The function returns coefficiants
%defining cubic functions within each region.

%Define n;
n = length(x) - 1;

%Find n h coefficiants.
h = diff(x);

%SOLVE FOR A COEFFICIANTS
a = y(1:end-1).';

%CONSTRUCT H MATRIX.

%Sum all adjacent h values, returns length n;
sum_h = movsum(h, [0, 1]);

%Remove last element of sum_h as this is not a sum of adjacent elements but
%the the final element of h. Consequence of using movsum. After removal
%have a array of length n-1.
sum_h = sum_h(1:end-1);

%Multiply sum_h elements by 2 and append ones to either end.
%sum_diag is length n+1.
sum_diag = [1, 2.*sum_h, 1];

%Create diagonal matrix on +1 super diagonal from h2 -> hn.
H_diag_sup_up = diag([0, h(2:end)], 1);

%Create diagonal matrix on -1 super diagonal from h1 -> hn-1.
H_diag_sup_low = diag([h(1:end - 1), 0], -1);

%Create diagonal matrix from sum_diag.
H_diag = diag(sum_diag);

%Add matrices to create final H matrix.
H = H_diag_sup_up + H_diag + H_diag_sup_low;

%CREATE Y MATRIX.

%Initialize column vector with height n-1;
Y = zeros(n+1, 1);
%Starting at second element, loop through n-1 times and apply algorithm.
for k = 2:n
    Y(k) = 3*( ((y(k+1) - y(k)) / h(k)) - ((y(k) - y(k-1))/h(k-1)));
end

%find c coefficiants, still n+1 array.
c = mldivide(H, Y);

%SOLVE D COEFFICIANTS
d = zeros(n, 1);
for k = 1:n
    d(k) = (c(k+1) - c(k))/(3*h(k));
    
end

%SOLVE B COEFFICIANTS
b = zeros(n, 1);
for k = 1:n
    b(k) = ((y(k+1) - y(k))/h(k)) - ((2*c(k) + c(k+1))*h(k))/3;
end

%SOLVE C COEFFICIANTS (return c at length n).
c = c(1:end-1);

end


