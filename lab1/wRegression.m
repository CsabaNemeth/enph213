function [b,m,db,dm] = wRegression(x, y, dy)
% WREGRESSION [b,m,db,dm] = wRegression(x, y, dy)
%   Written by: Csaba Nemeth
%   takes x and y values, and uncertainies on y (dy), and outputs the slope
%   (m), intercept (b), slope error (dm), and intercept error (db) for the
%   linear regression (y = mx + b)

% YOUR CODE GOES HERE

%Simple error catching measure. The if statement compares the length of the
%x and y data sets and only proceeds with the regression if the lengths
%match.
if (length(x) == length(y))
    
    %Create weighting vector using component wise operation of dy.
    w = 1./(dy.^2);
    
    %Compute the weighted sums that are needed for the regression
    %equations. This is done using component wise matrix math to avoid
    %loops.
    sumW = addUp(w);
    sumWX = addUp(w.*x);
    sumWY = addUp(w.*y);
    sumWXY = addUp(w.*x.*y);
    sumWX2 = addUp(w.*(x.^2));

    %Calculate the slope, intercept and D of the regression.
    D = sumW*sumWX2 - sumWX^2;
    b = (sumWX2*sumWY - sumWX*sumWXY)/D;
    m = (sumW*sumWXY - sumWX*sumWY)/D;
    
    %Calculate uncertainties in slope and intercept.
    db = sqrt(sumWX2/D);
    dm = sqrt(sumW/D);
    
else
    %Print simple error statement.
    fprintf("The number of data points in the X and Y datasets do not match");
    
end %End function.

