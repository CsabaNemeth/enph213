function [F] = plotHysteresisData(voltageDataFilename)
%Figure F = plotHysteresisData(voltageDataFilename)
%Written By: Csaba Nemeth
%
% plotHysteresisData takes an input of type string; the name of a .csv file
% in the curren directory where:
% First Column -> Time Data
% Second Column -> X Component Data
% Third Column -> Y Component Data
%
% The function returns and displays a figure F, a plot of the hysteresis
% data contained in the .csv file.

%Read the hysteresis data into an array.
hyst_data = csvread(voltageDataFilename);

%Initialize figure into return variable.
F = figure(1);

%To save on memory for relatively large data files, plot is called directly
%with the hyst_data set. The colon operator is used to access all the rows
%in the 2, 3, columns.
plot(hyst_data(:, 2), hyst_data(:, 3), 'LineWidth', 1)

%Add title and axis labels.
title("Hysteresis Loop");
xlabel("V_x [V]");
ylabel("V_y [V]");
legend("Hysteresis Data");

%Use the minimum and maximum x data points to add cleaner spacing to the
%plot.
xlim([min(hyst_data(:, 2))  - 0.1,  max(hyst_data(:, 2)) + 0.1]);

end %end function

