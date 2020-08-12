function [] = regressionPlot(x, y, dy)
% REGRESSIONPLOT [] = regressionPlot(x, y, dy)
%   Written by: Csaba Nemeth
%   takes x and y values, and y error values (dy) and displays the
%   calculated regression line and original data points with error bars

% YOUR CODE GOES HERE

%Simple error catching measure. The if statement compares the length of the
%x and y data sets and only proceeds with the regression if the lengths
%match.
if (length(x) == length(y))

    %Call a weighted regression to calculate the slope and intercept, and
    %the uncertainties in each.
    [reg_b, reg_m, reg_db, reg_dm]  = wRegression(x, y, dy);
    
    %Define an inline function of the form y = mx + b to plot a regression
    %line.
    reg_f = @(x)reg_m.*x + reg_b; 
    
    %Save the first and last element of the x-data set to allow for quick
    %plot formatting later.
    x_first = x(1);
    x_last = x(length(x));
    
    %Turn on hold to allow multiple elements to be plotted.
    hold on
    
    %Plot the error bars and corresponding points.
    err_bar = errorbar(x, y, dy, '.');
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
    xlim([x_first-0.5,x_last + 0.5]); 
    
    %To properly format the legend, a string (legend_linfit) is created that describes the
    %regression equation. strcat combines multiple strings and num2str
    %converts numerical values to a string type.
    legend_linfit = strcat("Linear Fit: y = ", num2str(reg_m), "*x + ", num2str(reg_b));
    
    %Create the legend using legend_linfit.
    legend('Original Data', legend_linfit,...
        'Location', 'northwest'... %Set legend position.
    ); %End legend.

    %Create the x and y axis labels.
    xlabel("x variable [x units]");
    ylabel("y variable [y units]");
    
    %Create strings to annotate uncertainties.
    db_string = strcat("Uncertainty in b is +/- ", num2str(reg_db)," ");
    dm_string = strcat("Uncertainty in m is +/- ", num2str(reg_dm));
    
    %Dimension of annotation. This is a workaround because the dimension
    %does not scale with the plot, therefore this is a less than ideal way
    %of displaying the annotation block.
    dim = [.15, .7, .37, .1];
    
    %Display annotation.
    annotation('textbox', dim, 'String',strcat(db_string, dm_string));
    
    %Turn off hold.
    hold off;
    
else
    %Print simple error statement.
    fprintf("The number of data points in the X and Y datasets do not match");

end %End function.

