function [] = plotElectricField(V)
%FIGURE [] = plotElectricField(V)
%Written By: Csaba Nemeth
%
%Creates a contour plot of electric potential V and the electric field
%vectors from an input grid V of potentials.

%x,y = (0,0) corresponds to (n,0) on matlab grid.
V = flip(V,1);

%Find the negative gradient to solve for the electric field.
[Ex, Ey] = gradient(V);
Ex = -Ex;
Ey = -Ey;

%Create a set of X, Y arrays to plot Ex and Ey components on.
X = 1:size(V,1);
Y = 1:size(V,2);

%Start figure.
hold on

%Create quiver plot.
quiver(X, Y, Ex, Ey, 'k');
xlim([0,length(X)]+1);
ylim([0,length(Y)]+1);
xlabel("x [mm]");
ylabel("y [mm]");

%Create contour plot.
contour(X, Y, V, 15, 'LineWidth', 0.5);
cbar = colorbar(); %Add side colourbar.
ylabel(cbar, "Voltage [V]");

end %End function plotElectricField(...)
