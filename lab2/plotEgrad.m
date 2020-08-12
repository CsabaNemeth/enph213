function plotEgrad(V, x, y)
%PLOT ELECTRIC FIELD void = plotEgrad(V, x, y)
%Written By: CSABA NEMETH
%
%Takes an input of potential as an inline function and vectors x, y.
%Plots the electric field as a vector field and plots potential as gradient lines.

%Step size h used to compute the partial derivatives.
h = 0.01;

%Call meshgrid at points spaced by 5 to properly scale quivers. Without
%this statement the quivers at areas of high-potential mask the lower
%potential quivers. Returns a 2-D matrix defined by the points.
[X, Y] = meshgrid(x(1:5:end), y(1:5:end));

%Create a =2-D matrix with grid coordinates defined by the vectors x, y.
[X2, Y2] = meshgrid(x, y);

%Compute partial derivatives with step size h. Suppress Z componenet of pDer output
%as it is assumed to be 0.
[dv_dx, dv_dy, ~] = pDer(V, X, h, Y, h, 0, h);

%Electric field is inverse sign of the potential partial componenet.
Ex = -dv_dx;
Ey = -dv_dy;

%Set spacing of contour lines to log scale for readability. Save the sign and and compute
%with absolute value, then redistribute the sign. Calling log with negative
%values would return an error.
VVplot_sign = V(X2, Y2, 0)./abs(V(X2, Y2, 0));
VVlog = log10(abs(V(X2, Y2, 0)) + 1);
VVplot = VVlog .* VVplot_sign;

%Call the quiver function to plot the vector components Ex, Ey at the points
%defined by X, Y, the spaced out points.
hold on
quiver(X, Y, Ex, Ey, 0.5, 'k', 'LineWidth', 1);

%Display 20 contour lines with meshgrid x, y points at all dataset points.
contour(X2, Y2, VVplot, 20, 'LineWidth', 0.5);
colorbar(); %Add side colourbar.
colormap hsv;

%Add title and labels for plot for understandability.
title("Dipole Field");
ylabel("y Variable [y units]");
xlabel("x variable [x units]");
legend("Dipole Field", "log_1_0(|V+1|) * V/|V|",'location', 'southwest');

hold off;
end %End the function.
