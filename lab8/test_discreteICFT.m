function [] = test_discreteICFT()
% TEST [] = test_discreteICFT()
% Written By: Csaba Nemeth
% Version Since: 2020-03-09

%% TEST PULSE

x = linspace(pi, 4*pi, 13);
f_x_exp = sin(2*pi*3*x).*(0.5+0.5*cos(2*pi*x+pi)).^3;
c = discreteCFT(f_x_exp);
f_x_act = discreteICFT(c);


tol = 0.0001;

checkEqual(f_x_act, f_x_exp, tol, 1);

%% TEST SQUARE WAVE

x = linspace(0, 5*pi, 20);
f_x_exp = square(x')';
c = discreteCFT(f_x_exp);
f_x_act = discreteICFT(c);

tol = 0.0001;
checkEqual(f_x_act, f_x_exp, tol, 2);

end
