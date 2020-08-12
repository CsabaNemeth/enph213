function [a, b, c, d] = perCubSpline(x, y)
%Periodic Spline Coefficiants [a, b, c, d] = perCubSpline(x, y)
%Written By: Csaba Nemeth
%
%natCubSpline takes two 1D arguments of x and y values defining a datapoints.
%Returns column vectors defining cubic functions for each data region.

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

%Specify first and last elements of the main diagonal as these arent
%included in the loop.
sum_diag_start = 2.*h(1);
sum_diag_end = -1;

%Concatenate the diagonal into one array.
sum_diag = [sum_diag_start, 2.*sum_h, sum_diag_end];

%Create diagonal matrix on +1 super diagonal from h1 -> hn.
H_diag_sup_up = diag(h, 1);

%Create diagonal matrix on -1 super diagonal from h1 -> hn-1.
H_diag_sup_low = diag([h(1:end - 1), 0], -1);

%Create diagonal matrix using the diagonal vector.
H_diag = diag(sum_diag);

%Add matrices to create final H matrix.
H = H_diag_sup_up + H_diag + H_diag_sup_low;

%Specify values in H that cannot be created through the loops specified
%above. These values were found using the derivation in the lab.
H(n+1, 1) = 1;
H(1, n) = h(n);
H(1, n+1) = 2*h(n);

%CREATE Y MATRIX.

%Initialize column vector with height n-1;
Y = zeros(n+1, 1);
%Starting at second element, loop through n-1 times and apply algorithm.
for k = 2:n
    Y(k) = 3*( ( ( y(k+1)-y(k) ) / h(k) ) - ( (y(k)-y(k-1) ) / h(k-1)) );
end

%Edit the first element of the y column vector to be consistent with the
%linear equation.
Y_str = 3*( ( -(y(n+1)- y(n) ) /h(n) ) + ( (y(2)-y(1) ) /h(1) ) );
Y(1) = Y_str;

%find c coefficiants, still n+1 array.
c = mldivide(H, Y);

%SOLVE D COEFFICIANTS
%Define array of zeros.
d = zeros(n, 1);
%Fill array using defined equation.
for k = 1:n
    d(k) = (c(k+1) - c(k))/(3*h(k));
    
end

%SOLVE B COEFFICIANTS
%Define array of zeros.
b = zeros(n, 1);
%Fill array using defined equation.
for k = 1:n
    b(k) = ((y(k+1) - y(k))/h(k)) - ((2*c(k) + c(k+1))*h(k))/3;
end

%SOLVE C COEFFICIANTS (return c at length n).
c = c(1:end-1);

end


