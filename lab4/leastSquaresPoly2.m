function [a] = leastSquaresPoly2(x,y,M)
%COEFFICIANTS a = leastSqauresPoly2(x, y, M);
%Written By: Csaba Nemeth
%
%Takes an input of two 1D arrays x, y, that define sampled dataset point.
%Also takes an input M defining the polynomial order fit. Returns
%coefficiants defining the polynomial using the modified least squares
%method.

%Initialize Y and H matrices.
Y = zeros(1,M+1)';
H = zeros(M+1);

%Create Y matrix,
for k = 1:M+1
    Y(k,1) = sum(x.^(k-1).*y);
end

%Edit first element
Y(1,1) = sum(x.^0.5.*y);

%Create inital H matrix.
for k = 1:M+1
    for p=1:M+1
        H(k,p) = sum(x.^(k+p-2));
    end
end

%Edit first row.
for k = 1:M+1
    H(1,k) = sum(x.^(k-0.5));
end

%Edit first column.
for k = 2:M+1
    H(k,1) = sum(x.^(k-0.5));
end

%Edit first element.
H(1,1) = sum(x);

%Solve for coeffs and return.
a = H\Y;

end %End function.

