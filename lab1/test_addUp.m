% TEST_ADDUP test_addup
%   Written by: D. DeVries
%   Tests the function addUp with multiple test cases

%% Check tolerance of 0
tol = 0;

%% Test 1: Single element vector

vector = [4];
expected = 4;

checkEqual(addUp(vector), expected, tol, 1);

%% Test 2: Multiple element vector

vector = [1 5 7 12];
expected = 25;

checkEqual(addUp(vector), expected, tol, 2);

%% Test 3: Multiple element vector with some negatives and zeros

vector = [0 5 -9 3 -10];
expected = -11;

checkEqual(addUp(vector), expected, tol, 3);