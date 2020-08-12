% TEST_FINDIMPEDANCEANDRESISTANCE test_findImpedanceAndResistance
%   Written by: T. Fleming
%   Tests the function findImpedanceAndResistance with multiple test cases

% Define some test data
f_test = [152 361 568 823 1031 1358]; % frequency [Hz]
V_test = [1.63 2.01 2.47 3.00 3.34 3.75]; % inductor RMS voltage [V]
I_test = [0.0615 0.0593 0.056 0.0512 0.0472 0.0413]; % inductor RMS current [A]
dV_test = V_test*0.005 + 0.02; % Uncertainty in the voltage measurements [V]
dI_test = I_test*0.0075 + 0.0002; % Uncertainty in the current measurements [A]

% Call your findInductanceAndResistance function
[L_act, R_act, dL_act, dR_act] = findInductanceAndResistance(f_test, V_test, I_test, dV_test, dI_test);

% Define the expected values

L_exp = 1.025e-2; % Expected inductance [H]
R_exp = 24.6; % Expected resistance [Ohms]
dL_exp = 1.1e-4; %Expected uncertainty in the inductance [H]
dR_exp = 0.5; % Expected uncertainty in the resistance [Ohms]

% Check if the outputs of your function are behaving as expected, using a
% tolerance of the precision of the expected values

checkEqual(L_act, L_exp, 1e-5, 1)
checkEqual(R_act, R_exp, 0.1, 2)
checkEqual(dL_act, dL_exp, 1e-5, 3)
checkEqual(dR_act, dR_exp, 0.1, 4)