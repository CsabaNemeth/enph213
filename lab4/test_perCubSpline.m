% TEST_PERCUBSPLINE test_perCubSpline
%   Written by: Tristan Fleming
%   Tests the function perCubSpline

%% Test 1

x = [1 3 5 9 10 14];
y = [2 3 4 5 3 3.5];

[aAct, bAct, cAct, dAct] = perCubSpline(x, y);

aExp = [2;3;4;5;3];
bExp = [0.731366459627329;0.370923913043478;0.784937888198758;-1.70147515527950;-1.75504658385093];
cExp = [-0.166828416149068;-0.0133928571428571;0.220399844720497;-0.842003105590062;0.788431677018634];
dExp = [0.0255725931677019;0.0389654503105590;-0.0885335791925466;0.543478260869565;-0.0796050077639752];
    
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

[aAct, bAct, cAct, dAct] = perCubSpline(x, y);

aExp = [1;1;2;1];
bExp = [0;0.750000000000000;-3.33066907387547e-16;-0.750000000000000];
cExp = [-0.750000000000000;1.50000000000000;-2.25000000000000;1.50000000000000];
dExp = [0.750000000000000;-1.25000000000000;1.25000000000000;-0.750000000000000];
    
[numRows, numCols] = size(aAct);
if numCols ~= 1
    error('Your function should output a column vector') 
end

tol = 1e-6;

checkEqual(aAct, aExp, tol, '2a')

checkEqual(bAct, bExp, tol, '2b')

checkEqual(cAct, cExp, tol, '2c')

checkEqual(dAct, dExp, tol, '2d')