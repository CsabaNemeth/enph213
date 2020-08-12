function [] = plotLeastMeanSquareFit(V_fit, t_fit, V_fit_error, a, f_0)
%Figure [] = plotLeastMeanSquareFit(V_fit, t_fit, V_fit_error, a, f_0)
%Written By: Csaba Nemeth
%Version Since: 2020-03-01
%
%plotLeastMeanSquareFit plots the sampled data against a least mean square
%fit for a damped sinusoidal pulse system, given by:
%
%                       V(t) = e^(-at)cos(2pi*f_0*t)
%
%The function takes inputs of:
%V_fit and t_fit, the sampled data points, the error in the sampling
%V_fit_error, as well as the attenutation coefficiant a and fundamental
%frequency f_0.
%This function is limited to only plotting the fit for the equation
%described above.

%Define ananoymous function for a damped sinusoidal pulse.
V = @(t) exp(-a.*t).*cos(2.*pi.*f_0.*t);

%Create an array of erros to plot with.
V_errors = ones(1, length(V_fit)).*V_fit_error;

%Create figure.
figure(1)
hold on
%Plot points and curve of best fit.
fplot(V, [t_fit(1), t_fit(length(t_fit))]);
errorbar(t_fit, V_fit, V_errors, '*');
fplot(@(x) x.*0, [t_fit(1), t_fit(length(t_fit))], 'k--');

%Add axis labels and legend.
ylabel("Pulse Amplitude [V]");
xlabel("Time [s]");
legend("Curve of Best Fit:", "Sampled Data");

hold off

end %End Function plotLeastMeanSquareFit(V_fit, t_fit, V_fit_error, a, f_0)
