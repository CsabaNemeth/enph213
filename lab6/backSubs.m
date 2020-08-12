function [X] = backSubs(AB)
% Solutions X = backsubs(AB)
% Written By: Csaba Nemeth 20090753
% Since: 2020-02-04
% backSubs takes in a matrix AB , the augmented matrix for the system of
% linear equations A*x = B. The function returns a column vector X,the
% solutions to the system. AB has dimension (n, m) and X has dimensions
% (m-1, 1). The function tests for undertermined, over-determined and
% singular inputs.

    %Check to see if the system of equations is undetermined:
    if size(AB,2)-1 > size(AB,1)
        msg = 'Error: The system of equations is undetermined. A has more columns than rows.';
        error(msg);
    end
    
   %Check to see if the system of equations is over-determined:
   if size(AB,2)-1 < size(AB,1)
       msg = 'Error: The system of equations is overdetermined. A has fewer columns than rows.';
       error(msg);
   end
   
   %Check to see if matrix A is singular:
   if det(AB(:,1:end-1)) == 0
       msg = 'Error: Matrix A is singular with determinant 0.';
       error(msg);
   end
   
   %Declare solution vector:
   X = zeros(size(AB,1),1);
   
   %Find upper triangular matrix of AB, MY;
   AB = upTri(AB);
   
   %Seperate matrix MY into componenents M and solutions Y.
   A = AB(:,1:end-1);
   B = AB(:,size(AB,2));
   
   %If the system is non-singular, solve each row starting from the bottom:
   for row = size(A,1):-1:1
       X(row, 1) = (B(row) - A(row,:)*X)/A(row, row);
   end %End for loop
   
end %End Function backSubs(...).
