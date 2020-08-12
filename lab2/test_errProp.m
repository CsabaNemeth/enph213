% TEST_ERRPROP test_errProp
%   Written by: Tristan Fleming
%   Tests the function errProp

%% Test 1: Low pass filter experiment from ENPH 253

f = [0.110 0.310 1.012 3.075 10.01 30.07 99.9]*1000; % frequency vector [Hz]
Vin = [23 22 24 21.5 18 21 21];       % input voltage measurements (RMS) [V]
dVin = [5 5 5.5 5 4.5 5 5]*0.2;            % uncertainty in Vin measurements [V] 
Vout = [26 18 20.5 15 6.2 4.20 0.66]; % output voltage measurements (RMS) [V]
dVout = [5 5 5 2 1 0.75 0.1]*0.1;      % uncertainty in Vout measurements [V]

Hmag_expt =@(Vin, Vout) Vout./Vin; % magnitude of the transform function

dyAct = errProp(Hmag_expt,Vin,dVin,Vout,dVout); % calculate uncertainty in magnitude

dyExp = [0.0537417671764706,0.0435842109834552,0.0443468287712416,0.0337563942368376,0.0180956933661353,0.0101712475213132,0.00157050045170129];

tol = 1e-12;

checkEqual(dyAct, dyExp, tol, 1);