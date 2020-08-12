function [] = test_plotElectricField()
%[] = test_plotElectricField()
% Written by: David DeVries
% use solveLaplace to get V and then use plotElectricField to plot contours
% and E field

% get V values
V = solveLaplace(...
    41, 41,...
    10, 25, 20, 10,...
    10, 15, 20, -10);

% plot electric potential contours and E field values
plotElectricField(V);

end

