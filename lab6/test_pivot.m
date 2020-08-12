function [] = test_pivot()
%[] = test_pivot()
% Written by: Tristan Fleming
% tests the pivot function for placing the row with the largest element in
% the first column in the first row

% Define test matrices
testMatrix1 = [-6,-8,-4;-12,-2,-8];
testMatrix2 = [-6,-6,-10,-4;-8,-8,-12,-8;-2,0,-8,-20];
testMatrix3 = [-10,6,-8,-2;-10,-6,-4,0;-8,-6,-4,-2];
testMatrix4 = [-10,-6,-4,0;-8,-6,-4,-2;-10,6,-8,-2];

% Actual matrices, as calculated using the student's function
[pivotAct1] = pivot(testMatrix1);
[pivotAct2] = pivot(testMatrix2);
[pivotAct3] = pivot(testMatrix3);
[pivotAct4] = pivot(testMatrix4);

% Expected matrices
pivotExp1 = [-12,-2,-8;-6,-8,-4];
pivotExp2 = [-8,-8,-12,-8;-6,-6,-10,-4;-2,0,-8,-20];
pivotExp3 = [-10,6,-8,-2;-10,-6,-4,0;-8,-6,-4,-2];
pivotExp4 = [-10,-6,-4,0;-8,-6,-4,-2;-10,6,-8,-2];

% Check tolerance
tol = 0.0001;

% Check pivoted matrices
checkEqual(pivotAct1, pivotExp1, tol, 1);
checkEqual(pivotAct2, pivotExp2, tol, 2);
checkEqual(pivotAct3, pivotExp3, tol, 3);
checkEqual(pivotAct4, pivotExp4, tol, 4);

     
end