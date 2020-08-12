function plotCurveFits(x, y)
%VOID = plotCurveFits(x, y)
%Written By: Csaba Nemeth
%
%plotCurveFits plots a polynomial, natural cubic spline fit and periodic
%cubic spline fit against data values.

%Call interplation functions and save values into vectors.
poly_coeff = polyInterp(x, y);
[nat_a, nat_b, nat_c, nat_d] = natCubSpline(x, y);
[per_a, per_b, per_c, per_d] = perCubSpline(x, y);

%Create linearly spaced vector and evaluate polynomial at x values. Array
%had to be flipped and transposed to provide correct input for polyval.
x_poly = linspace(x(1), x(length(x)), 1000);
y_poly = polyval(flip(poly_coeff.'), x_poly);

%Plot all points.
pointplot = plot(x, y, 'ko');

%Turn hold on
hold on

%Plot the polynomial.
polyplot = plot(x_poly, y_poly, 'b');

%Natural cubic spline plot.
%Loop through each region and plot the cubic spline using the coefficiants.
for k = 1:length(nat_a)
    %Create linear spaced matrix within the region.
    x_nat = linspace(x(k), x(k+1), 100);
    %Apply function.
    y_nat = nat_a(k) + nat_b(k).*(x_nat - x(k)) + nat_c(k).*(x_nat - x(k)).^2 + nat_d(k).*(x_nat - x(k)).^3;
    %Plot.
    natplot = plot(x_nat, y_nat, 'r');
    
end

%Periodic cubic spline plot.
%Loop through each region and plot the cubic spline using the coefficiants.
for k = 1:length(per_a)
    %Create linear spaced matrix within the region.
    x_per = linspace(x(k), x(k+1), 100);
    %Apply function.
    y_per = per_a(k) + per_b(k).*(x_per - x(k)) + per_c(k).*(x_per - x(k)).^2 + per_d(k).*(x_per - x(k)).^3;
    %Plot.
    perplot = plot(x_per, y_per, 'g');
    
end

%Add labels.
xlabel("x [x units]");
ylabel("y [y units]");

%Create legend using defined plots.
subset = [pointplot, polyplot, natplot, perplot];
legend(subset, "Sampled Data",...
        "Polynomial Interpolation",...
        "Natural Cubic Spline",...
        "Periodic Cubic Spline",...
'location', 'best');

%Hold off.
hold off

end
