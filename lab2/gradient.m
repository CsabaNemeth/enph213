function [F] = gradient(f, x, y)
%PLOT GRADIENT void = gradient(f, x, y)
%Written By: CSABA NEMETH
%
%Takes an input of an inline function f of two variables, and vectors x, y
%that define points. The gradient of the function is plotted as a
%vector field using the quiver function.

%Step size h used to compute the partial derivatives.
h = 0.01;

%Call pDer to compute the partial derivatives of the function f.
[df_dx, df_dy] = pDer(f, x, h, y, h);

%Call meshgrid with the partial derivatives to create a matrix with 2_D grid coordinates
%defining the gradient at the point.
[U, V] = meshgrid(df_dx, df_dy);

%Instantiante figure.
F = figure(1);

hold on

%Call the quiver function to plot the vector components U, V at the points
%defined by x, y.
quiver(x, y, U, V)

%Add titles and axis labels, units are unknown.
title("Gradient of x^2-y^2");
xlabel("x Variable [x units]");
ylabel("y Variable [y units]");

hold off

end %End function.

