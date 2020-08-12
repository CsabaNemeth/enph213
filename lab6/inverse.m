function [mInv] = inverse(m)
% Inverse Matrix mInv = inverse(m)
% Written By: Csaba Nemeth 20090753
% Since: 2020-02-04
% Function inverse takes an input matrix m and returns the inverse matrix
% mInv. This is done by solving for the columns of the inverse matrix
% independently using back-substitution.

    %Find size of matrix.
    n = size(m,1);
    
    %Initialie mInv matrix with zeros.
    mInv = zeros(n);

    %Complete n times where n is the size of the matrix.
    for k = 1:n
        
        %Initialize solution as all zeros. The current element at row k
        %should be equal to 1.
        Y = zeros(n,1);
        Y(k, 1) = 1;
    
        %Concatenate m with current solution and solve for column of
        %inverse.
        AB = [m,Y];
        mInv(:,k) = backSubs(AB);
    
    end %End for loop.
    
end %End Function inverse(...).
