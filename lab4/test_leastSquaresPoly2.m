% TEST_LEASTSQUARESPOLY test_leastSquaresPoly
%   Written by: Tristan Fleming
%   Tests the function leastSquaresPoly

%% Test 1

x = [0 0.01 0.06 0.4 0.9 1.0];
y = [0 0.04 0.1 0.2 0.05 0]; 

[aAct] = leastSquaresPoly2(x, y, 4);

aAct = reshape(aAct, [length(aAct), 1]);

aExp = [0.389560129148928;0.109984228222443;-0.557886228158356;-0.0678360785358697;0.126177949322856];

tol = 1e-6;

checkEqual(aAct, aExp, tol, '1a')

%% Test 2

x = 1:1:7;
y = [1 1 3 5 3 1 1]; 

[aAct] = leastSquaresPoly2(x, y, 4);

aAct = reshape(aAct, [length(aAct), 1]);

aExp = [22.7594973375867;-31.0525204285596;11.1500355526667;-1.95951472070010;0.118259766643622];

tol = 1e-6;

checkEqual(aAct, aExp, tol, '2a')