function [b,m,db,dm] = uwRegression(x, y)
% UWREGRESSION [b,m,db,dm] = uwRegression(x, y, dy)
%   Written by: Csaba Nemeth
%   takes x and y values and outputs the slope
%   (m), intercept (b), slope error (dm), and intercept error (db) for the
%   linear regression (y = mx + b)

% YOUR CODE GOES HERE

%Find Nx, the number of data points.
Nx = length(x);

%Simple error catching measure. The if statement compares the length of the
%x and y data sets and only proceeds with the regression if the lengths
%match.
if (Nx == length(y))
 
    %Compute the unweighted sums that are needed for the regression
    %equations. This is done using component wise matrix math to avoid
    %loops.
    sumX = addUp(x);
    sumY = addUp(y);
    sumXY = addUp(x.*y);
    sumX2 = addUp(x.^2);
    
    %Calculate the slope, intercept and D values. Because this is an
    %unweighted regression, the weighting on each individual x, and y
    %element is essentially 1. Therefore addUp(w) is just the number of
    %elements.
    D = Nx.*sumX2 - (sumX).^2;
    b = (sumX2*sumY - sumX*sumXY)/D;
    m = (Nx*sumXY - sumX*sumY)/D;
    
    %Calculate the uncertainty in the slope, intercept, and y values.
    h = y - (m.*x + b);
    dy = sqrt(addUp(h.^2)/(Nx - 2));
    db = dy * sqrt(sumX2/D);
    dm = dy * sqrt(Nx/D);
    
else
    %Print simple error statement.
    fprintf("The number of data points in the X and Y datasets does not match.");

end %End function.

