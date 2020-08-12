function [] = pulseWindowing(x, pulse)
%Figures []  = pulseWindowing(x, pulse)
%Written By: Csaba Nemeth
%Version Since: 2020-03-15
%
% Using the inline function pulse, which defines the signal shape,
% pulseWindowing outputs three plots evaluated at the sample points x. The
% first figure shows the original sample data, the Hann windowed data and
% the triangular windowed data. The second plot shows the absolute error
% between the known signal values and each fourier expansion. The final
% plot shows the magnitude of the Fourier coefficiants found using the
% sampled, Hann and Triangular data.

%Calculate the values for the pulse function across the original x value
%and an x range over 1000 values.
y = pulse(x);
X = linspace(min(x), max(x), 1000);

%Calculates the Hann windowing.
Hann =  hannWindow(y);

%Calculates the Triangular windowing .
Tri = triangularWindow(y);

%Caculates the error on the different data sets 
d_orig = abs(y - y);
d_Hann = abs(Hann - y);
d_Tri = abs(Tri - y);

%Calculates the Fourier Coefficients for each data set
c = abs(discreteCFT(pulse(x)));
cHann = abs(discreteCFT(Hann));
cTri = abs(discreteCFT(Tri));

%Plots the original data, the Hann, and Triangular WIndowing 
figure(1);
hold on
plot(x./pi, y, 'ro-');
plot(x./pi, Tri, 'bo-');
plot(x./pi, Hann, 'go-');
legend('Original Data','Triangular Window', 'Hann Window')
xlabel("x/\pi");
ylabel('f(x)');
hold off

%Plots the absolute error of the fourier coefficiants.
figure(2)
hold on
plot(x, d_orig, 'ro-');
plot(x, d_Tri, 'bo-');
plot(x, d_Hann, 'go-');
legend('Original Data','Triangular Window', 'Hann Window')
xlabel("x/\pi");
ylabel('Absolute Error');
hold off

%Plots the magnitude of the Fourier coefficients.
figure(3)
hold on
plot(x, c, 'ro-');
plot(x, cTri, 'bo-');
plot(x, cHann,'go-');
legend('Original Data','Triangular Window', 'Hann Window')
xlabel('Angular frequency (rad)');
ylabel('Fourier Coefficients');
hold off

end 