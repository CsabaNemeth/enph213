function a = leastSquaresPoly(x, y, M)
% COEFFICIANTS a = leastSquaresPoly(x, y, M);
% Written By: Csaba Nemeth
%
% leastSquaresPoly takes 1d array inputs of x and y data points and an
% order M. Returns a vector a containing the coefficiants for a polynomial
% fit of order M.

%Initialize matrix with zeros.
sum_mat = zeros(M+1);

%Initialize column vector.
Y = zeros(M+1, 1);

%Populate matrix using nested for-loop and the summation of x and y
%elements.
for rows = 1:M+1
    for cols = 1:M+1   
        sum_mat(rows, cols) = sum(x.^(rows+cols-2));
    end
end

%Populate Y matrix using for loop and summations.
for k = 1:M+1
    Y(k) = sum(x.^(k-1) .* y);
end

%Solve matrix and return.
a = sum_mat\Y;

end
