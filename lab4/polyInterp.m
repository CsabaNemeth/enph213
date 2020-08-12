function a = polyInterp(x, y)
%Polynomial Coefficiants [a] = polyInterp(x, y)
%Written By: Csaba Nemeth
%
%polyInterp takes two 1D arrays x, y, of length n+1 which define x, y
%points for a dataset. The function returns a column vector [a] of length n
%which contains the coefficients of a polynomial of order n.

%Create array containing n powers increasing by 1 from 0.
n = 0:length(x) - 1;

%Transpose data sets into column vectors.
x_trans = x.';
y_trans = y.';

%Repeat the column vector x, n times to create bases for the vander matrix.
vander_bases = repmat(x_trans, [1, length(n)]);

%Raise each row in matrix by the powers found in n.
vander = vander_bases.^n;

%Solve the matrix to return the coefficiants in a.
a = mldivide(vander, y_trans);

end
