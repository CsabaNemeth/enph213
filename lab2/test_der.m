% TEST_DER test_der
%   Written by: Tristan Fleming
%   Tests the function der with multiple test cases

%% Test 1: Simple function at single point

f=@(x) 10*atan(x);

x_test = 0.12;

h = pi/4;

df_dxAct = der(f, x_test, h);

df_dxExp = 9.1029;

tol = 1e-4;

checkEqual(df_dxAct, df_dxExp, tol, 1) 

%% Test 2: Simple function over a range of points

f=@(x) 10*atan(x);

x_test = 0:pi/4:2*pi;

h = pi/8;

df_dxAct = der(f, x_test, h);

df_dxExp = [9.87948874272725,6.23550784483975,2.88260754260913,1.52472144414788,0.919487469370209,0.608795847785250,0.430846497966573,0.320221459794454,0.247032052046177];

tol = 1e-4;

checkEqual(df_dxAct, df_dxExp, tol, 2)