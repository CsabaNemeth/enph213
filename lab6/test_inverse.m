function [] = test_inverse()
%[] = test_inverse()
% Written by: Tristan Fleming
% tests the inverse function for finding the inverse of a matrix

% Define test matrices
testMatrix1 = [-1,-3;-7,3];
testMatrix2 = [-1,-1,-5;-3,-3,-7;3,5,-3];
testMatrix3 = [-5,11,-3;-5,-1,1;-3,-1,1];
testMatrix4 = [-5,-1,1;-3,-1,1;-5,11,-3];

invAct1 = inverse(testMatrix1);
invAct2 = inverse(testMatrix2);
invAct3 = inverse(testMatrix3);
invAct4 = inverse(testMatrix4);

% Expected value
invExp1 = inv(testMatrix1);
invExp2 = inv(testMatrix2);
invExp3 = inv(testMatrix3);
invExp4 = inv(testMatrix4);

% Check tolerance
tol = 0.0001;

% Check
checkEqual(invAct1, invExp1, tol, 1);
checkEqual(invAct2, invExp2, tol, 2);
checkEqual(invAct3, invExp3, tol, 3);
checkEqual(invAct4, invExp4, tol, 4);
     
end