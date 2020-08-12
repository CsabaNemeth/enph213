% TEST_FINDCAPACITANCEANDRESISTANCE test_findCapacitanceAndResistance
%   Written by: T. Fleming
%   Tests the function findCapacitanceAndResistance with multiple test 
%   cases

% Define some test data
f_test = [109 120 208 234 290 346 391 485]; % frequency [Hz]
V_test = [7.39 7.47 7.46 7.35 7.36 7.35 7.44 7.43]; % inductor RMS voltage [V]
I_test = [2.51 2.73 4.82 5.41 6.61 7.81 8.91 11.2]*10^-3; % inductor RMS current [A]
dV_test = V_test*0.005 + 0.02; % Uncertainty in the voltage measurements [V]
dI_test = I_test*0.0075 + 0.0002; % Uncertainty in the current measurements [A]

% Call your findInductanceAndResistance function
[C_act, R_act, dC_act, dR_act] = findCapacitanceAndResistance(f_test, V_test, I_test, dV_test, dI_test);

% Define the expected values

C_exp = 4.93e-7; % Expected inductance [H]
R_exp = 34.64; % Expected resistance [Ohms]
dC_exp = 1.3e-8; %Expected uncertainty in the inductance [H]
dR_exp = 161.97; % Expected uncertainty in the resistance [Ohms]

% Note: the value of the intercept should be zero within the experimental
% uncertainty so it is safe to say that R is zero within the experimental
% uncertainty. For this reason, I have set the tolerance for checkEquals on
% R and dR to be 1. Worry more about the check on C and dC.

% Check if the outputs of your function are behaving as expected, using a
% tolerance of the precision of the expected values

checkEqual(C_act, C_exp, 1e-8, 1)
checkEqual(R_act, R_exp, 1, 2)
checkEqual(dC_act, dC_exp, 1e-9, 3)
checkEqual(dR_act, dR_exp, 1, 4)