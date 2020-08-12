% TEST_PLOTIMPEDANCEANDRESISTANCEDATA test_plotImpedanceAndResistanceData
%   Written by: T. Fleming 
%   Tests the function plotImpedanceAndResistanceData with multiple test 
%   cases

% Define some test data
f_test = [152 361 568 823 1031 1358]; % frequency [Hz]
V_test = [1.63 2.01 2.47 3.00 3.34 3.75]; % inductor RMS voltage [V]
I_test = [0.0615 0.0593 0.056 0.0512 0.0472 0.0413]; % inductor RMS current [A]
dV_test = V_test*0.005 + 0.02; % Uncertainty in the voltage measurements [V]
dI_test = I_test*0.0075 + 0.0002; % Uncertainty in the current measurements [A]

% Plot the data, along with the line of fit outputted from your
% findInductanceAndResistance function, using your
% plotInductanceAndResistance function

plotInductanceAndResistanceData(f_test, V_test, I_test, dV_test, dI_test)