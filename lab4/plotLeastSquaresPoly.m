function [F] = plotLeastSquaresPoly(x, y, M)
% FIGURE F = plotLeastSquaresPoly(x, y, M).
%Written By: Csaba Nemeth
%
%plotLeastSquaresPoly takes an input of 1D arrays x, y and an integer M
%defining the order of the polynomial fit to plot against the x, y, data
%points. The equation is displayed on the plot as an annotation.

%Find coefficiants of least square fit.
coeffs = leastSquaresPoly(x, y, M);

%Create x y points defining the polynomial curve.
x_poly = linspace(x(1), x(length(x)), 100);
y_poly = polyval(flip(coeffs.'), x_poly);

%Initialize figure.
F = figure(1);
%Delete previous stored annotations.
delete(findall(gcf, 'type', 'annotation'));

%Plot x and y data points.
plot(x,y, 'ko');

%Plot the curve as a least squares fit.
hold on
plot(x_poly, y_poly, 'r');

%Create annotation with the displayed equation.
format short
string_eq = strcat('y =  ', num2str(coeffs(1)));
for k = 2:M+1
    string_eq = strcat(string_eq, ' + (', num2str(coeffs(k)), ')x^', num2str(k-1));
end

%Add annotations, legend and textbox.
annotation('textbox', 'String', string_eq);
legend("Data", "Least Squares Fit", 'location', 'northwest');
xlabel("x [x units]");
ylabel("y [y units]");
hold off

end

