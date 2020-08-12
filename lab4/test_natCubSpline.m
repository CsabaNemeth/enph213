% TEST_NATCUBSPLINE test_natCubSpline
%   Written by: Tristan Fleming
%   Tests the function natCubSpline

%% Test 1

x = [1 3 5 9 10 14];
y = [2 3 4 5 3 3.5];

[aAct, bAct, cAct, dAct] = natCubSpline(x, y);

aExp = [2;3;4;5;3];
bExp = [0.537685232498723;0.424629535002555;0.763796627491058;-1.68203883495146;-1.79835206949412];
cExp = [0;-0.0565278487480838;0.226111394992335;-0.837570260602964;0.721257026060296];
dExp = [-0.00942130812468063;0.0471065406234032;-0.0886401379662749;0.519609095554420;-0.0601047521716914];

[numRows, numCols] = size(aAct);
if numCols ~= 1
    error('Your function should output a column vector') 
end

tol = 1e-6;

checkEqual(aAct, aExp, tol, '1a')

checkEqual(bAct, bExp, tol, '1b')

checkEqual(cAct, cExp, tol, '1c')

checkEqual(dAct, dExp, tol, '1d')

%% Test 2
x = 1:1:5;
y = [1 1 2 1 1];

[aAct, bAct, cAct, dAct] = natCubSpline(x, y);

aExp = [1;1;2;1];
bExp = [-0.428571428571429;0.857142857142857;0;-0.857142857142857];
cExp = [0;1.28571428571429;-2.14285714285714;1.28571428571429];
dExp = [0.428571428571429;-1.14285714285714;1.14285714285714;-0.428571428571429];

[numRows, numCols] = size(aAct);
if numCols ~= 1
    error('Your function should output a column vector') 
end

tol = 1e-6;

checkEqual(aAct, aExp, tol, '2a')

checkEqual(bAct, bExp, tol, '2b')

checkEqual(cAct, cExp, tol, '2c')

checkEqual(dAct, dExp, tol, '2d')