function [] = test_discreteFT()
% [] = test_discreteFT()
% Written by: Tristan Fleming
% tests the discrete Fourier transform function discreteFT

%% Sine function

% Define the sample points
x = [0:1:7].*pi/8;
f_x = sin(4*x);

% Actual values, as calculated using the student's function
[aAct, bAct] = discreteFT( f_x );

% Expected values
aExp = [0, 0, 0, 0, 0];
bExp = [0, 0, 1, 0, 0];

% Check tolerance
tol = 0.0001;

% Check
checkEqual(aAct, aExp, tol, 1);
checkEqual(bAct, bExp, tol, 2);

%% Cosine function

% Define the sample points
x = [0:1:7].*pi/8;
f_x = cos(4*x);

% Actual values, as calculated using the student's function
[aAct, bAct] = discreteFT( f_x );

% Expected values
aExp = [0, 0, 1, 0, 0];
bExp = [0, 0, 0, 0, 0];

% Check tolerance
tol = 0.0001;

% Check
checkEqual(aAct, aExp, tol, 3);
checkEqual(bAct, bExp, tol, 4);

%% Undersampled sine function

% Define the sample points
x = [0:1:7].*pi/8;
f_x = sin(3*x);

% Actual values, as calculated using the student's function
[aAct, bAct] = discreteFT( f_x );

% Expected values
aExp = [0.374151440666372,0.711939766255644,-0.603553390593274,-0.211939766255643,-0.167044659479825];
bExp = [0,0,0,0,0];

% Check tolerance
tol = 0.0001;

% Check
checkEqual(aAct, aExp, tol, 5);
checkEqual(bAct, bExp, tol, 6);

%% Square wave

x = linspace(0, 5*pi, 20);
f_x = square(x')';

% Actual values, as calculated using the student's function
[aAct, bAct] = discreteFT( f_x );

% Expected values
aExp = [0.200000000000000,0.268509595407938,0.785410196624968,-0.721586454726535,-0.161803398874989,0,0.114589803375032,0.274372859226577,0.0618033988749901,0.178704000092022,0.200000000000000];
bExp = [0,-0.0108508539255465,-0.190211303259031,0.469571752592515,0.262865556059567,0.200000000000000,0.117557050458494,-0.145964954842536,0.425325404176020,0.134457651675525,-1.50668695133320e-15];

% Check tolerance
tol = 0.0001;

% Check
checkEqual(aAct, aExp, tol, 7);
checkEqual(bAct, bExp, tol, 8);

%% Pulse

x = linspace(pi, 2*pi, 13);
f_x=sin(2*pi*4*x).*(0.5+0.5*cos(2*pi*x+pi)).^3;

% Actual values, as calculated using the student's function
[aAct, bAct] = discreteFT( f_x );

% Expected values
aExp = [-0.286444054426244,0.0614325153621905,-0.0462086483493725,-0.0232243819789777,0.180965433527992,-0.0679006846199803,0.0355866296010704];
bExp = [0,-0.186602437315462,0.00413479942329281,-0.238666132294680,0.00343607099767275,0.0175151240521789,-0.0967659926603234];
     
% Check
checkEqual(aAct, aExp, tol, 9);
checkEqual(bAct, bExp, tol, 10);

end
