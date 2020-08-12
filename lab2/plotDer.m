function abs_diff = plotDer(f, fder, x, h)
%ABDOLUTE DIFFERENCE abs_diff = plotDer(f, fder, x, h)
%Written by: CSABA NEMETH
%
% Takes inputs of an inline function, and its derivative, an array of x values and a step size h.
% The function returns an array containting the absolute difference between
% the exact derivatie and the Richardson's approximation.
%
% The function also outputs two plots; the Richardson's extrapolation and
% the absolute difference.

%FUNCTION START

%Calculate the approximate derivative using Richardson's approximation.
%Evaluate the exact derivative at all x points.
fder_approx = der(f, x, h);
fder_exact = fder(x);

%Calculate the absolute difference.
abs_diff = abs(fder_exact - fder_approx);

%Calculate the value of the first and last element in the x values (used to
%clean up graph).
x_first = x(1);
x_last = x(length(x));

%PLOTTING

%Plot Figure 1 (exact and approximated derivative)
figure(1)
hold on

%Call plot with both exact and approximate values.
plot(x, fder_exact, 'LineWidth', 1.5);
plot(x, fder_approx, ':', 'LineWidth', 2);

%Format legend and axis labels.
legend("Derivative (Analytical)" , "Derivative (Richardson's Extrapolation)")
xlabel("x Variable [x units]");
ylabel("f ' (x) [units]");

%Set x limits.
xlim([x_first - 0.5, x_last + 0.5]);
hold off

%Plot Figure 2 (absolute difference)
figure(2)
hold on

%Plot the absolute difference with formatted line width.
plot(x, abs_diff, 'LineWidth', 1.5);

%Format legend and axis labels.
legend("Absolute difference in derivative |Analytical - Richardson's|"); 
xlabel("x Variable [x units]");
ylabel("Absolute Difference [units]");

%Set x limits.
xlim([x_first - 0.5, x_last + 0.5]);
hold off
end

