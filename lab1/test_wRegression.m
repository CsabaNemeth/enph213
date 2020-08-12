% TEST_WREGRESSION test_wRegression
%   Written by: T. Fleming
%   Tests the function wRegression with multiple test cases

%% Test 1: Linear regression using sample data given in lab handout

% Define the sample data given in the lab handout
x = [0, 1, 2, 3, 4, 5];
y = [0.5, 1, 2.2, 3.3, 4.2, 7.1];
dy = [0.4, 0.2, 0.4, 0.4, 0.5, 0.8];

b_exp = -0.0148;
m_exp = 1.1381;
db_exp = 0.2313;
dm_exp = 0.1123;

%Set the tolerance to be the precision of the expected values
tol = 1e-4;

%Use your function to perform a linear regression
[b_act, m_act, db_act, dm_act] = wRegression(x, y, dy);

%Check each of your function's output variables against the expected values
checkEqual(b_act, b_exp, tol, 1);
checkEqual(m_act, m_exp, tol, 2);
checkEqual(db_act, db_exp, tol, 3);
checkEqual(dm_act, dm_exp, tol, 4);

%% Test 2: Linear regression using sample data given in lab handout

% Define the sample data given in the lab handout
x = [0, 1, 2, 3, 4, 5]';
y = [0.5, 1, 2.2, 3.3, 4.2, 7.1]';
dy = [0.4, 0.2, 0.4, 0.4, 0.5, 0.8]';

b_exp = -0.0148;
m_exp = 1.1381;
db_exp = 0.2313;
dm_exp = 0.1123;

%Set the tolerance to be the precision of the expected values
tol = 1e-4;

%Use your function to perform a linear regression
[b_act, m_act, db_act, dm_act] = wRegression(x, y, dy);

%Check each of your function's output variables against the expected values
checkEqual(b_act, b_exp, tol, 5);
checkEqual(m_act, m_exp, tol, 6);
checkEqual(db_act, db_exp, tol, 7);
checkEqual(dm_act, dm_exp, tol, 8);

%% Test 2: Additional sample data: mileage against weight and horsepower

%Load an example Matlab dataset to check your wRegression function against
load carsmall

%Assign as your independent (x) variable the Weight of the cars in the
%dataset
x = Weight;
%Assign as your dependent (y) variable the miles per gallon (MPG) of the
%cars in the dataset
y = MPG;

%Find any missing data in either the Weight or MPG and ignore it
ind = ~(isnan(x)|isnan(y));
x_fit = x(ind);
X = [ones(length(x_fit), 1) x_fit];
y_fit = y(ind);

%Let's also assume that the uncertainty in the y variable, the MPG of the
%sampled cars is 1% of the value for each data point
dy = y_fit.*0.01;

%Perform a weighted linear regression using linear algebra. You will be
%using a more straight forward method to accomplish the same goal.
w = 1./(dy.^2);
W = eye(length(y_fit), length(y_fit)).*w;
coeff = (X'*W*X)\(X'*W*y_fit);

%Use your function to perform a linear regression
[b_act, m_act, db_act, dm_act] = wRegression(x_fit, y_fit, dy);

%Let's set the tolerances to be the uncertainty in the y-intercept and
%slope, respectively, as found using your wRegression function
b_exp = coeff(1);
m_exp = coeff(2);

checkEqual(b_act, b_exp, db_act, 9);
checkEqual(m_act, m_exp, dm_act, 10);

%% Test 4: Curve Fitting Tool (not required)

% The third method you can test your function wRegression is by opening the
% Curve Fitting Toolbox under Apps. Select x_fit from the dropdown of your
% Workspace variables for X data, y_fit for Y data and w for Weights. Leave
% everything else as is (the type of fit should be Polynomial). Look at the
% results in bottom left half of the Curve Fitting Tool window and you
% should see values for p1, the slope (what you've defined as m), and p2,
% the y-intercept (what you've defined as b) along with intercepts. These
% should match the outputs of your function.
