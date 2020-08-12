% TEST_UWREGRESSION test_uwRegression
%   Written by: T. Fleming
%   Tests the function uwRegression with multiple test cases

%% Test 1: Linear regression using sample data given in lab handout

% Define the sample data given in the lab handout
x = [0, 1, 2, 3, 4, 5];
y = [0.5, 1, 2.2, 3.3, 4.2, 7.1];

b_exp = -0.0714;
m_exp = 1.2486;
db_exp = 0.5032;
dm_exp = 0.1662;

%Set the tolerance to be the precision of the expected values
tol = 1e-4;

%Use your function to perform a linear regression
[b_act, m_act, db_act, dm_act] = uwRegression(x, y);

%Check each of your function's output variables against the expected values
checkEqual(b_act, b_exp, tol, 1);
checkEqual(m_act, m_exp, tol, 2);
checkEqual(db_act, db_exp, tol, 3);
checkEqual(dm_act, dm_exp, tol, 4);

%% Test 2: Linear regression using sample data given in lab handout

% Define the sample data given in the lab handout
x = [0, 1, 2, 3, 4, 6]';
y = [0.5, 1, 2.2, 3.3, 4.2, 7.1]';

b_exp = 0.0900;
m_exp = 1.1100;
db_exp = 0.2344;
dm_exp = 0.0707;

%Set the tolerance to be the precision of the expected values
tol = 1e-4;

%Use your function to perform a linear regression
[b_act, m_act, db_act, dm_act] = uwRegression(x, y);

%Check each of your function's output variables against the expected values
checkEqual(b_act, b_exp, tol, 5);
checkEqual(m_act, m_exp, tol, 6);
checkEqual(db_act, db_exp, tol, 7);
checkEqual(dm_act, dm_exp, tol, 8);