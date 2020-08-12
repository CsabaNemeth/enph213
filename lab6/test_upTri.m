function [] = test_upTri()
%[] = test_upTri()
% Written by: Tristan Fleming
% tests the upper triangular function for putting the inputted matrix in 
% upper triangular form

% Define test matrices
testMatrix1 = [-1,-3,1;-7,3,-3];
testMatrix2 = [-1,-1,-5,1;-3,-3,-7,-3;3,5,-3,-15];
testMatrix3 = [-5,11,-3,3;-5,-1,1,5;-3,-1,1,3];
testMatrix4 = [-5,-1,1,5;-3,-1,1,3;-5,11,-3,3];

% Actual matrices, as calculated using the student's function
[upTriMatrixAct1] = upTri(testMatrix1);
[upTriMatrixAct2] = upTri(testMatrix2);
[upTriMatrixAct3] = upTri(testMatrix3);
[upTriMatrixAct4] = upTri(testMatrix4);

% Expected matrices
upTriMatrixExp1 = [-7,3,-3;0,-3.42857142857143,1.42857142857143];
upTriMatrixExp2 = [-3,-3,-7,-3;0,2,-10,-18;0,0,-2.66666666666667,2];
upTriMatrixExp3 = [-5,11,-3,3;0,-12,4,2;0,0,0.266666666666667,-0.0666666666666664];
upTriMatrixExp4 = [-5,-1,1,5;0,12,-4,-2;0,0,0.266666666666667,-0.0666666666666667];

% Check tolerance
tol = 0.0001;

% Check matrices
checkEqual(upTriMatrixAct1, upTriMatrixExp1, tol, 1);
checkEqual(upTriMatrixAct2, upTriMatrixExp2, tol, 2);
checkEqual(upTriMatrixAct3, upTriMatrixExp3, tol, 3);
checkEqual(upTriMatrixAct4, upTriMatrixExp4, tol, 4);
     
end