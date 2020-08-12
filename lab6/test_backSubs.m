function [] = test_backSubs()
%[] = test_backSubs()
% Written by: Tristan Fleming
% tests the back substitution function for solving the augmented matrix AB
% using Gaussian elimination, pivoting and back substitution

%% Non-singular matrix tests

% Define test matrices
testMatrix1 = [-1,-3,1;-7,3,-3];
testMatrix2 = [-1,-1,-5,1;-3,-3,-7,-3;3,5,-3,-15];
testMatrix3 = [-5,11,-3,3;-5,-1,1,5;-3,-1,1,3];
testMatrix4 = [-5,-1,1,5;-3,-1,1,3;-5,11,-3,3];

% Actual matrices, as calculated using the student's function
xAct1 = backSubs(testMatrix1);
xAct2 = backSubs(testMatrix2);
xAct3 = backSubs(testMatrix3);
xAct4 = backSubs(testMatrix4);

% Expected matrices
xExp1 = [0.250000000000000;-0.416666666666667];
xExp2 = [15.5000000000000;-12.7500000000000;-0.750000000000000];
xExp3 = [-1.00000000000000;-0.250000000000000;-0.249999999999999];
xExp4 = [-1;-0.250000000000000;-0.250000000000000];

% Check tolerance
tol = 0.0001;

% Check
checkEqual(xAct1, xExp1, tol, 1);
checkEqual(xAct2, xExp2, tol, 2);
checkEqual(xAct3, xExp3, tol, 3);
checkEqual(xAct4, xExp4, tol, 4);

%% Under-determined system matrix test

testMatrix = [
    0, 1, 2, 3;
    4, 5, 6, 7
    ];
backSubs(testMatrix);

%Your code should return an error

%% Over-determined system matrix test

testMatrix = [
    0, 1, 2, 3;
    4, 5, 6, 7;
    -1, 1, 3, 3;
    -5, 5, 1, 7
    ];
backSubs(testMatrix);

%Your code should return an error

%% Singular matrix test

testMatrix = [zeros(2, 2), ones(2, 1)];
backSubs(testMatrix);

%Your code should return an error
     
end