% TEST_LEASTSQUARESPOLY test_leastSquaresPoly
%   Written by: Tristan Fleming
%   Tests the function leastSquaresPoly

%% Test 1

x = [1 3 4.5 7 8 10];
y = [2 3 3.6 3.8 3.5 3];

[aAct] = leastSquaresPoly(x, y, 3);

aAct = reshape(aAct, [length(aAct), 1]);

aExp = [1.23979623648219;0.808665364738601;-0.0675933070521747;0.000411830457952356];

tol = 1e-6;

checkEqual(aAct, aExp, tol, 'a')

%% Test 2

x = 1:1:9;
y = [1 1 3 5 3 5 3 1 1];

[aAct] = leastSquaresPoly(x, y, 5);

aAct = reshape(aAct, [length(aAct), 1]);

aExp = [2.99999999963611;-4.00932400871046;2.26573426539896;-0.372960372881224;0.0186480186396246;3.28205155360942e-13];

tol = 1e-6;

checkEqual(aAct, aExp, tol, 'a')