% TEST_POLYINTERP test_polyInterp
%   Written by: Tristan Fleming
%   Tests the function polyInterp with multiple test cases

%% Test 1

x = [1 3 5 9 10 14];
y = [2 3 4 5 3 3.5];

aExp = [-1.30026223776218;5.32170745920736;-2.51284236596731;0.538930167055157;-0.0490748834498825;0.00154186091686089];

aAct = polyInterp(x, y);

% Check whether the outputted coefficient vector is a column or row vector

[numRows, numCols] = size(aAct);
if numCols ~= 1
    error('Your function should output a column vector') 
end

tol = 1e-6;

checkEqual(aExp, aAct, tol, 1)

%% Test 2

x = 1:1:5;
y = 2 .* x + pi;

aExp = [3.14159265358979;2;0;0;0];

aAct = polyInterp(x, y);

% Check whether the outputted coefficient vector is a column or row vector

[numRows, numCols] = size(aAct);
if numCols ~= 1
    error('Your function should output a column vector') 
end

tol = 1e-6;

checkEqual(aExp, aAct, tol, 2);

%% Test 3

x = zeros(3,3,3);
x(:, :, 1) = [1,4,7;2,5,8;3,6,9];
x(:, :, 2) = [10,13,16;11,14,17;12,15,18];
x(:, :, 3) = [19,22,25;20,23,26;21,24,27];
y = 2 .* x + pi;

aExp = [3.14159265369482;1.99999999964387;5.21165486711514e-10;-4.44165475428317e-10;2.49642502542381e-10;-9.89786978867595e-11;2.88267500773724e-11;-6.32074908227927e-12;1.05706393595966e-12;-1.35082402614314e-13;1.30174005474986e-14;-9.05701616766294e-16;3.94380492354570e-17;-2.91551389247986e-19;-1.02954138475471e-19;8.61273475553590e-21;-3.61575519857659e-22;7.34985810543153e-24;3.30645726767631e-26;-4.09825634656028e-27;-1.17772364977827e-28;1.54471347001893e-29;-6.23191545058225e-31;1.43566759231027e-32;-2.02402125883657e-34;1.63993230268398e-36;-5.89702061110791e-39];

aAct = polyInterp(x, y);

% Check whether the outputted coefficient vector is a column or row vector

[numRows, numCols] = size(aAct);
if numCols ~= 1
    error('Your function should output a column vector') 
end

tol = 1e-6;

checkEqual(aExp, aAct, tol, 3)


