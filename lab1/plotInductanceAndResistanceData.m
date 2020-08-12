function [] = plotInductanceAndResistanceData(f, V, I, dV, dI)
%PLOTINDUCTANCEANDRESISTANCEDATA [] = plotInductanceAndResistanceData(f, V, I, dV, dI)
%   Written by: Csaba Nemeth
%   takes in frequency in Hz (f), voltage in V (V), current in A (I), error
%   in voltage (dV), and error in current (dI), and plots the data in a
%   figure with error bars, and the linear regression

% YOUR CODE GOES HERE

%Calculate angular frequency, y and x values.
w2 = ((2*pi).*f).^2;
y = Z2(V, I);


%Calculate uncertainty in Z
dZSq = ((Z2(V+dV,I)-Z2(V,I)).^2+(Z2(V,I+dI)-Z2(V,I)).^2).^0.5;

%Call regression to calculate slope and intercept
[reg_b, reg_m, reg_db, reg_dm] = wRegression(w2, Z2(V, I), dZSq);

%Define an inline function of the form y = mx + b to plot a regression
%line.
reg_f = @(x)reg_m.*x + reg_b; 

%Save the first and last element of the x-data set to allow for quick
%plot formatting later.
x_first = w2(1);
x_last = w2(length(w2));

hold on;

%Plot the error bars and corresponding points.
err_bar = errorbar(w2, y, dZSq, '.');
err_bar.MarkerSize = 15; %set point size.
err_bar.Color = 'blue'; %set colour.
err_bar.LineWidth = 0.7; %set thickness of error bars.
    
%Using the regression line function, plot the regression line from the
%first until the last x element.
fplot(reg_f, [x_first, x_last],...
    'Linewidth', 1,... %set width of line.
    'Color', 'red'... %set colour of line.
); %End regression plot
    
%Set the x-axis to run from slighty before to slightly after the data
%set. Creates a cleaner looking plot.
xlim([x_first - 1.0E7,x_last + 1.0E7]); 

%To properly format the legend, a string (legend_linfit) is created that describes the
%regression equation. strcat combines multiple strings and num2str
%converts numerical values to a string type.
legend_linfit = strcat("Linear Fit: y = ", num2str(reg_m), "*x + ", num2str(reg_b));
    
%Create the legend using legend_linfit.
legend('Original Data', legend_linfit,...
    'Location', 'northwest'... %Set legend position.
); %End legend.

%Create the x and y axis labels.
xlabel("Angular Frequency Squared [rad^2/s^2]");
ylabel("Impedence Squared [Ohm^2]");

end

function zSqrd = Z2(V,I)
% takes the voltage (V) and current (I) and finds the impedance squared
% (zSqrd)

% YOUR CODE GOES HERE
%Calculate zSqrd using element operations.
zSqrd = (V./I).^2;

end

