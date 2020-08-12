function [] = test_elim()
%[] = test_elim()
% Written by: Tristan Fleming
% tests the elimination function for replacing the elements below the first
% pivot element with zeros using elementary row operations

% Define test matrices
testMatrix1 = [-6,-8,-4;-12,-2,-8];
testMatrix2 = [-6,-6,-10,-4;-8,-8,-12,-8;-2,0,-8,-20];
testMatrix3 = [-10,6,-8,-2;-10,-6,-4,0;-8,-6,-4,-2];
testMatrix4 = [-10,-6,-4,0;-8,-6,-4,-2;-10,6,-8,-2];

% Actual matrices, as calculated using the student's function
[elimMatrixAct1] = elim(testMatrix1);
[elimMatrixAct2] = elim(testMatrix2);
[elimMatrixAct3] = elim(testMatrix3);
[elimMatrixAct4] = elim(testMatrix4);

% Expected matrices
elimMatrixExp1 = [-12,-2,-8;0,-7,0];
elimMatrixExp2 = [-8,-8,-12,-8;0,0,-1,2;0,2,-5,-18];
elimMatrixExp3 = [-10,6,-8,-2;0,-12,4,2;0,-10.8000000000000,2.40000000000000,-0.400000000000000];
elimMatrixExp4 = [-10,-6,-4,0;0,-1.20000000000000,-0.800000000000000,-2;0,12,-4,-2];

% Check tolerance
tol = 0.0001;

% Check matrices
checkEqual(elimMatrixAct1, elimMatrixExp1, tol, 1);
checkEqual(elimMatrixAct2, elimMatrixExp2, tol, 2);
checkEqual(elimMatrixAct3, elimMatrixExp3, tol, 3);
checkEqual(elimMatrixAct4, elimMatrixExp4, tol, 4);
     
end