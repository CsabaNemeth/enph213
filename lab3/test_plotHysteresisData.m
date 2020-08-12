function [] = test_plotHysteresisData()
%[] = test_plotHysteresisData()
% Written by: David DeVries
% loads up a test hysteresis data set and then called plotHystersisData to
% display the plotted vX and vY

% get data
[~, vX, vY] = getHysteresisData();

% plot it
plotHysteresisData(vX, vY);

end

% HELPER FUNCTIONS

function [t, vX, vY] = getHysteresisData()

rawData = [...
    -2.14E-02,-3.98E-01,-3.38E-01;
    -2.14E-02,-3.97E-01,-3.38E-01;
    -2.14E-02,-3.97E-01,-3.39E-01;
    -2.14E-02,-3.96E-01,-3.38E-01;
    -2.13E-02,-3.96E-01,-3.39E-01;
    -2.13E-02,-3.95E-01,-3.39E-01;
    -2.13E-02,-3.95E-01,-3.39E-01;
    -2.13E-02,-3.93E-01,-3.38E-01;
    -2.12E-02,-3.92E-01,-3.39E-01;
    -2.12E-02,-3.89E-01,-3.38E-01;
    -2.12E-02,-3.88E-01,-3.39E-01;
    -2.12E-02,-3.86E-01,-3.38E-01;
    -2.11E-02,-3.84E-01,-3.39E-01;
    -2.11E-02,-3.81E-01,-3.38E-01;
    -2.11E-02,-3.80E-01,-3.39E-01;
    -2.11E-02,-3.76E-01,-3.38E-01;
    -2.10E-02,-3.74E-01,-3.39E-01;
    -2.10E-02,-3.70E-01,-3.38E-01;
    -2.10E-02,-3.68E-01,-3.38E-01;
    -2.10E-02,-3.64E-01,-3.38E-01;
    -2.09E-02,-3.61E-01,-3.38E-01;
    -2.09E-02,-3.57E-01,-3.37E-01;
    -2.09E-02,-3.54E-01,-3.38E-01;
    -2.09E-02,-3.50E-01,-3.37E-01;
    -2.08E-02,-3.46E-01,-3.37E-01;
    -2.08E-02,-3.41E-01,-3.36E-01;
    -2.08E-02,-3.38E-01,-3.36E-01;
    -2.08E-02,-3.34E-01,-3.36E-01;
    -2.07E-02,-3.30E-01,-3.36E-01;
    -2.07E-02,-3.24E-01,-3.35E-01;
    -2.07E-02,-3.20E-01,-3.35E-01;
    -2.07E-02,-3.16E-01,-3.34E-01;
    -2.06E-02,-3.12E-01,-3.34E-01;
    -2.06E-02,-3.07E-01,-3.33E-01;
    -2.06E-02,-3.02E-01,-3.33E-01;
    -2.06E-02,-2.97E-01,-3.32E-01;
    -2.05E-02,-2.93E-01,-3.32E-01;
    -2.05E-02,-2.88E-01,-3.31E-01;
    -2.05E-02,-2.83E-01,-3.31E-01;
    -2.05E-02,-2.78E-01,-3.31E-01;
    -2.04E-02,-2.74E-01,-3.30E-01;
    -2.04E-02,-2.69E-01,-3.30E-01;
    -2.04E-02,-2.64E-01,-3.30E-01;
    -2.04E-02,-2.58E-01,-3.29E-01;
    -2.03E-02,-2.54E-01,-3.29E-01;
    -2.03E-02,-2.50E-01,-3.29E-01;
    -2.03E-02,-2.44E-01,-3.28E-01;
    -2.03E-02,-2.38E-01,-3.28E-01;
    -2.02E-02,-2.35E-01,-3.27E-01;
    -2.02E-02,-2.30E-01,-3.27E-01;
    -2.02E-02,-2.25E-01,-3.26E-01;
    -2.02E-02,-2.21E-01,-3.24E-01;
    -2.01E-02,-2.17E-01,-3.24E-01;
    -2.01E-02,-2.12E-01,-3.22E-01;
    -2.01E-02,-2.07E-01,-3.21E-01;
    -2.01E-02,-2.04E-01,-3.20E-01;
    -2.00E-02,-2.00E-01,-3.19E-01;
    -2.00E-02,-1.96E-01,-3.19E-01;
    -2.00E-02,-1.91E-01,-3.17E-01;
    -2.00E-02,-1.87E-01,-3.17E-01;
    -1.99E-02,-1.83E-01,-3.16E-01;
    -1.99E-02,-1.79E-01,-3.15E-01;
    -1.99E-02,-1.74E-01,-3.14E-01;
    -1.99E-02,-1.71E-01,-3.13E-01;
    -1.98E-02,-1.67E-01,-3.12E-01;
    -1.98E-02,-1.64E-01,-3.11E-01;
    -1.98E-02,-1.59E-01,-3.10E-01;
    -1.98E-02,-1.56E-01,-3.09E-01;
    -1.97E-02,-1.53E-01,-3.08E-01;
    -1.97E-02,-1.49E-01,-3.07E-01;
    -1.97E-02,-1.44E-01,-3.05E-01;
    -1.97E-02,-1.41E-01,-3.04E-01;
    -1.96E-02,-1.38E-01,-3.02E-01;
    -1.96E-02,-1.36E-01,-3.01E-01;
    -1.96E-02,-1.33E-01,-2.99E-01;
    -1.96E-02,-1.29E-01,-2.98E-01;
    -1.95E-02,-1.25E-01,-2.96E-01;
    -1.95E-02,-1.22E-01,-2.95E-01;
    -1.95E-02,-1.19E-01,-2.94E-01;
    -1.95E-02,-1.16E-01,-2.92E-01;
    -1.94E-02,-1.13E-01,-2.90E-01;
    -1.94E-02,-1.10E-01,-2.89E-01;
    -1.94E-02,-1.07E-01,-2.87E-01;
    -1.94E-02,-1.05E-01,-2.86E-01;
    -1.93E-02,-1.01E-01,-2.84E-01;
    -1.93E-02,-9.88E-02,-2.82E-01;
    -1.93E-02,-9.53E-02,-2.79E-01;
    -1.93E-02,-9.34E-02,-2.78E-01;
    -1.92E-02,-9.02E-02,-2.77E-01;
    -1.92E-02,-8.87E-02,-2.76E-01;
    -1.92E-02,-8.55E-02,-2.74E-01;
    -1.92E-02,-8.36E-02,-2.72E-01;
    -1.91E-02,-8.01E-02,-2.69E-01;
    -1.91E-02,-7.81E-02,-2.67E-01;
    -1.91E-02,-7.54E-02,-2.65E-01;
    -1.91E-02,-7.38E-02,-2.63E-01;
    -1.90E-02,-7.07E-02,-2.60E-01;
    -1.90E-02,-6.91E-02,-2.58E-01;
    -1.90E-02,-6.64E-02,-2.55E-01;
    -1.90E-02,-6.48E-02,-2.53E-01;
    -1.89E-02,-6.17E-02,-2.51E-01;
    -1.89E-02,-6.02E-02,-2.50E-01;
    -1.89E-02,-5.82E-02,-2.48E-01;
    -1.89E-02,-5.78E-02,-2.46E-01;
    -1.88E-02,-5.59E-02,-2.43E-01;
    -1.88E-02,-5.43E-02,-2.41E-01;
    -1.88E-02,-5.12E-02,-2.38E-01;
    -1.88E-02,-4.92E-02,-2.36E-01;
    -1.87E-02,-4.65E-02,-2.33E-01;
    -1.87E-02,-4.49E-02,-2.32E-01;
    -1.87E-02,-4.26E-02,-2.30E-01;
    -1.87E-02,-4.14E-02,-2.27E-01;
    -1.86E-02,-3.98E-02,-2.24E-01;
    -1.86E-02,-3.91E-02,-2.21E-01;
    -1.86E-02,-3.79E-02,-2.20E-01;
    -1.86E-02,-3.71E-02,-2.18E-01;
    -1.85E-02,-3.52E-02,-2.15E-01;
    -1.85E-02,-3.36E-02,-2.13E-01;
    -1.85E-02,-3.16E-02,-2.10E-01;
    -1.85E-02,-3.01E-02,-2.07E-01;
    -1.84E-02,-2.89E-02,-2.04E-01;
    -1.84E-02,-2.73E-02,-2.02E-01;
    -1.84E-02,-2.66E-02,-2.00E-01;
    -1.84E-02,-2.54E-02,-1.97E-01;
    -1.83E-02,-2.42E-02,-1.94E-01;
    -1.83E-02,-2.27E-02,-1.91E-01;
    -1.83E-02,-2.15E-02,-1.88E-01;
    -1.83E-02,-2.07E-02,-1.86E-01;
    -1.82E-02,-1.95E-02,-1.85E-01;
    -1.82E-02,-1.80E-02,-1.81E-01;
    -1.82E-02,-1.72E-02,-1.77E-01;
    -1.82E-02,-1.56E-02,-1.74E-01;
    -1.81E-02,-1.48E-02,-1.73E-01;
    -1.81E-02,-1.33E-02,-1.70E-01;
    -1.81E-02,-1.29E-02,-1.67E-01;
    -1.81E-02,-1.13E-02,-1.63E-01;
    -1.80E-02,-1.09E-02,-1.61E-01;
    -1.80E-02,-9.38E-03,-1.57E-01;
    -1.80E-02,-8.98E-03,-1.55E-01;
    -1.80E-02,-8.20E-03,-1.52E-01;
    -1.79E-02,-7.81E-03,-1.49E-01;
    -1.79E-02,-6.64E-03,-1.45E-01;
    -1.79E-02,-6.64E-03,-1.42E-01;
    -1.79E-02,-5.47E-03,-1.38E-01;
    -1.78E-02,-5.08E-03,-1.35E-01;
    -1.78E-02,-3.91E-03,-1.31E-01;
    -1.78E-02,-3.91E-03,-1.29E-01;
    -1.78E-02,-2.73E-03,-1.25E-01;
    -1.77E-02,-2.73E-03,-1.22E-01;
    -1.77E-02,-1.95E-03,-1.18E-01;
    -1.77E-02,-1.95E-03,-1.15E-01;
    -1.77E-02,-1.56E-03,-1.11E-01;
    -1.76E-02,-1.56E-03,-1.09E-01;
    -1.76E-02,-1.17E-03,-1.04E-01;
    -1.76E-02,-1.17E-03,-1.01E-01;
    -1.76E-02,-3.91E-04,-9.70E-02;
    -1.75E-02,-3.91E-04,-9.43E-02;
    -1.75E-02,7.81E-04,-9.00E-02;
    -1.75E-02,3.91E-04,-8.73E-02;
    -1.75E-02,1.95E-03,-8.37E-02;
    -1.74E-02,1.56E-03,-8.02E-02;
    -1.74E-02,3.52E-03,-7.55E-02;
    -1.74E-02,3.13E-03,-7.32E-02;
    -1.74E-02,4.69E-03,-7.05E-02;
    -1.73E-02,4.69E-03,-6.73E-02;
    -1.73E-02,5.86E-03,-6.30E-02;
    -1.73E-02,5.86E-03,-5.99E-02;
    -1.73E-02,7.03E-03,-5.56E-02;
    -1.72E-02,7.03E-03,-5.25E-02;
    -1.72E-02,7.81E-03,-4.98E-02;
    -1.72E-02,7.81E-03,-4.66E-02;
    -1.72E-02,9.38E-03,-4.23E-02;
    -1.71E-02,9.38E-03,-3.84E-02;
    -1.71E-02,1.05E-02,-3.45E-02;
    -1.71E-02,1.05E-02,-3.18E-02;
    -1.71E-02,1.21E-02,-2.90E-02;
    -1.70E-02,1.21E-02,-2.55E-02;
    -1.70E-02,1.33E-02,-2.16E-02;
    -1.70E-02,1.33E-02,-1.93E-02;
    -1.70E-02,1.45E-02,-1.58E-02;
    -1.69E-02,1.45E-02,-1.19E-02;
    -1.69E-02,1.52E-02,-7.17E-03;
    -1.69E-02,1.56E-02,-2.88E-03;
    -1.69E-02,1.64E-02,1.03E-03;
    -1.68E-02,1.64E-02,4.16E-03;
    -1.68E-02,1.76E-02,8.06E-03;
    -1.68E-02,1.80E-02,1.16E-02;
    -1.68E-02,1.91E-02,1.43E-02;
    -1.67E-02,1.95E-02,1.70E-02;
    -1.67E-02,2.07E-02,2.17E-02;
    -1.67E-02,2.11E-02,2.56E-02;
    -1.67E-02,2.19E-02,2.80E-02;
    -1.66E-02,2.27E-02,3.11E-02;
    -1.66E-02,2.34E-02,3.50E-02;
    -1.66E-02,2.42E-02,3.89E-02;
    -1.66E-02,2.50E-02,4.20E-02;
    -1.65E-02,2.62E-02,4.52E-02;
    -1.65E-02,2.70E-02,4.83E-02;
    -1.65E-02,2.77E-02,5.26E-02;
    -1.65E-02,2.81E-02,5.61E-02;
    -1.64E-02,2.93E-02,6.00E-02;
    -1.64E-02,3.01E-02,6.39E-02;
    -1.64E-02,3.13E-02,6.82E-02;
    -1.64E-02,3.16E-02,7.06E-02;
    -1.63E-02,3.28E-02,7.41E-02;
    -1.63E-02,3.32E-02,7.80E-02;
    -1.63E-02,3.44E-02,8.23E-02;
    -1.63E-02,3.48E-02,8.50E-02;
    -1.62E-02,3.63E-02,8.85E-02;
    -1.62E-02,3.71E-02,9.13E-02;
    -1.62E-02,3.91E-02,9.52E-02;
    -1.62E-02,3.98E-02,9.83E-02;
    -1.61E-02,4.14E-02,1.03E-01;
    -1.61E-02,4.22E-02,1.06E-01;
    -1.61E-02,4.38E-02,1.10E-01;
    -1.61E-02,4.41E-02,1.13E-01;
    -1.60E-02,4.53E-02,1.17E-01;
    -1.60E-02,4.57E-02,1.20E-01;
    -1.60E-02,4.73E-02,1.24E-01;
    -1.60E-02,4.77E-02,1.26E-01;
    -1.59E-02,5.04E-02,1.30E-01;
    -1.59E-02,5.16E-02,1.33E-01;
    -1.59E-02,5.43E-02,1.37E-01;
    -1.59E-02,5.55E-02,1.40E-01;
    -1.58E-02,5.82E-02,1.45E-01;
    -1.58E-02,5.90E-02,1.48E-01;
    -1.58E-02,6.17E-02,1.50E-01;
    -1.58E-02,6.25E-02,1.53E-01;
    -1.57E-02,6.41E-02,1.57E-01;
    -1.57E-02,6.45E-02,1.60E-01;
    -1.57E-02,6.68E-02,1.64E-01;
    -1.57E-02,6.76E-02,1.66E-01;
    -1.56E-02,7.07E-02,1.69E-01;
    -1.56E-02,7.23E-02,1.71E-01;
    -1.56E-02,7.50E-02,1.76E-01;
    -1.56E-02,7.62E-02,1.78E-01;
    -1.55E-02,7.89E-02,1.81E-01;
    -1.55E-02,8.05E-02,1.83E-01;
    -1.55E-02,8.28E-02,1.86E-01;
    -1.55E-02,8.40E-02,1.88E-01;
    -1.54E-02,8.67E-02,1.92E-01;
    -1.54E-02,8.83E-02,1.94E-01;
    -1.54E-02,9.14E-02,1.97E-01;
    -1.54E-02,9.30E-02,1.99E-01;
    -1.53E-02,9.53E-02,2.02E-01;
    -1.53E-02,9.65E-02,2.05E-01;
    -1.53E-02,1.00E-01,2.08E-01;
    -1.53E-02,1.03E-01,2.11E-01;
    -1.52E-02,1.06E-01,2.14E-01;
    -1.52E-02,1.08E-01,2.15E-01;
    -1.52E-02,1.11E-01,2.16E-01;
    -1.52E-02,1.14E-01,2.19E-01;
    -1.51E-02,1.16E-01,2.23E-01;
    -1.51E-02,1.19E-01,2.26E-01;
    -1.51E-02,1.22E-01,2.27E-01;
    -1.51E-02,1.25E-01,2.28E-01;
    -1.50E-02,1.28E-01,2.31E-01;
    -1.50E-02,1.30E-01,2.33E-01;
    -1.50E-02,1.34E-01,2.36E-01;
    -1.50E-02,1.37E-01,2.38E-01;
    -1.49E-02,1.42E-01,2.40E-01;
    -1.49E-02,1.45E-01,2.43E-01;
    -1.49E-02,1.47E-01,2.45E-01;
    -1.49E-02,1.50E-01,2.46E-01;
    -1.48E-02,1.55E-01,2.48E-01;
    -1.48E-02,1.59E-01,2.50E-01;
    -1.48E-02,1.63E-01,2.53E-01;
    -1.48E-02,1.65E-01,2.55E-01;
    -1.47E-02,1.68E-01,2.57E-01;
    -1.47E-02,1.73E-01,2.59E-01;
    -1.47E-02,1.76E-01,2.60E-01;
    -1.47E-02,1.80E-01,2.63E-01;
    -1.46E-02,1.84E-01,2.65E-01;
    -1.46E-02,1.88E-01,2.67E-01;
    -1.46E-02,1.92E-01,2.69E-01;
    -1.46E-02,1.95E-01,2.70E-01;
    -1.45E-02,1.98E-01,2.71E-01;
    -1.45E-02,2.03E-01,2.73E-01;
    -1.45E-02,2.07E-01,2.74E-01;
    -1.45E-02,2.11E-01,2.75E-01;
    -1.44E-02,2.14E-01,2.77E-01;
    -1.44E-02,2.18E-01,2.79E-01;
    -1.44E-02,2.22E-01,2.81E-01;
    -1.44E-02,2.27E-01,2.82E-01;
    -1.43E-02,2.31E-01,2.83E-01;
    -1.43E-02,2.35E-01,2.85E-01;
    -1.43E-02,2.39E-01,2.86E-01;
    -1.43E-02,2.44E-01,2.88E-01;
    -1.42E-02,2.46E-01,2.89E-01;
    -1.42E-02,2.51E-01,2.90E-01;
    -1.42E-02,2.55E-01,2.90E-01;
    -1.42E-02,2.60E-01,2.92E-01;
    -1.41E-02,2.63E-01,2.92E-01;
    -1.41E-02,2.67E-01,2.94E-01;
    -1.41E-02,2.71E-01,2.95E-01;
    -1.41E-02,2.76E-01,2.96E-01;
    -1.40E-02,2.79E-01,2.96E-01;
    -1.40E-02,2.84E-01,2.98E-01;
    -1.40E-02,2.87E-01,2.98E-01;
    -1.40E-02,2.92E-01,3.00E-01;
    -1.39E-02,2.95E-01,3.00E-01;
    -1.39E-02,3.00E-01,3.02E-01;
    -1.39E-02,3.02E-01,3.02E-01;
    -1.39E-02,3.07E-01,3.04E-01;
    -1.38E-02,3.11E-01,3.04E-01;
    -1.38E-02,3.15E-01,3.06E-01;
    -1.38E-02,3.19E-01,3.06E-01;
    -1.38E-02,3.23E-01,3.07E-01;
    -1.37E-02,3.26E-01,3.07E-01;
    -1.37E-02,3.30E-01,3.08E-01;
    -1.37E-02,3.33E-01,3.08E-01;
    -1.37E-02,3.38E-01,3.10E-01;
    -1.36E-02,3.40E-01,3.10E-01;
    -1.36E-02,3.42E-01,3.10E-01;
    -1.36E-02,3.44E-01,3.11E-01;
    -1.36E-02,3.48E-01,3.12E-01;
    -1.35E-02,3.52E-01,3.12E-01;
    -1.35E-02,3.56E-01,3.12E-01;
    -1.35E-02,3.58E-01,3.12E-01;
    -1.35E-02,3.61E-01,3.13E-01;
    -1.34E-02,3.62E-01,3.13E-01;
    -1.34E-02,3.65E-01,3.14E-01;
    -1.34E-02,3.67E-01,3.14E-01;
    -1.34E-02,3.70E-01,3.14E-01;
    -1.33E-02,3.71E-01,3.15E-01;
    -1.33E-02,3.73E-01,3.15E-01;
    -1.33E-02,3.74E-01,3.15E-01;
    -1.33E-02,3.76E-01,3.16E-01;
    -1.32E-02,3.77E-01,3.16E-01;
    -1.32E-02,3.78E-01,3.17E-01;
    -1.32E-02,3.79E-01,3.17E-01;
    -1.32E-02,3.79E-01,3.17E-01;
    -1.31E-02,3.79E-01,3.17E-01;
    -1.31E-02,3.80E-01,3.17E-01;
    -1.31E-02,3.79E-01,3.17E-01;
    -1.31E-02,3.79E-01,3.18E-01;
    -1.30E-02,3.79E-01,3.18E-01;
    -1.30E-02,3.78E-01,3.18E-01;
    -1.30E-02,3.77E-01,3.18E-01;
    -1.30E-02,3.76E-01,3.18E-01;
    -1.29E-02,3.75E-01,3.18E-01;
    -1.29E-02,3.74E-01,3.18E-01;
    -1.29E-02,3.73E-01,3.18E-01;
    -1.29E-02,3.71E-01,3.18E-01;
    -1.28E-02,3.70E-01,3.19E-01;
    -1.28E-02,3.67E-01,3.18E-01;
    -1.28E-02,3.65E-01,3.19E-01;
    -1.28E-02,3.62E-01,3.18E-01;
    -1.27E-02,3.61E-01,3.18E-01;
    -1.27E-02,3.59E-01,3.18E-01;
    -1.27E-02,3.56E-01,3.18E-01;
    -1.27E-02,3.51E-01,3.17E-01;
    -1.26E-02,3.47E-01,3.18E-01;
    -1.26E-02,3.43E-01,3.17E-01;
    -1.26E-02,3.41E-01,3.17E-01;
    -1.26E-02,3.39E-01,3.16E-01;
    -1.25E-02,3.35E-01,3.17E-01;
    -1.25E-02,3.30E-01,3.16E-01;
    -1.25E-02,3.27E-01,3.16E-01;
    -1.25E-02,3.22E-01,3.15E-01;
    -1.24E-02,3.19E-01,3.15E-01;
    -1.24E-02,3.14E-01,3.15E-01;
    -1.24E-02,3.09E-01,3.15E-01;
    -1.24E-02,3.04E-01,3.14E-01;
    -1.23E-02,3.00E-01,3.14E-01;
    -1.23E-02,2.95E-01,3.13E-01;
    -1.23E-02,2.92E-01,3.14E-01;
    -1.23E-02,2.86E-01,3.13E-01;
    -1.22E-02,2.82E-01,3.13E-01;
    -1.22E-02,2.77E-01,3.12E-01;
    -1.22E-02,2.72E-01,3.12E-01;
    -1.22E-02,2.66E-01,3.12E-01;
    -1.21E-02,2.63E-01,3.12E-01;
    -1.21E-02,2.58E-01,3.11E-01;
    -1.21E-02,2.54E-01,3.11E-01;
    -1.21E-02,2.47E-01,3.10E-01;
    -1.20E-02,2.44E-01,3.10E-01;
    -1.20E-02,2.38E-01,3.09E-01;
    -1.20E-02,2.34E-01,3.09E-01;
    -1.20E-02,2.28E-01,3.08E-01;
    -1.19E-02,2.24E-01,3.08E-01;
    -1.19E-02,2.18E-01,3.06E-01;
    -1.19E-02,2.14E-01,3.06E-01;
    -1.19E-02,2.09E-01,3.05E-01;
    -1.18E-02,2.06E-01,3.05E-01;
    -1.18E-02,2.00E-01,3.04E-01;
    -1.18E-02,1.96E-01,3.03E-01;
    -1.18E-02,1.92E-01,3.02E-01;
    -1.17E-02,1.88E-01,3.01E-01;
    -1.17E-02,1.83E-01,3.00E-01;
    -1.17E-02,1.79E-01,2.99E-01;
    -1.17E-02,1.75E-01,2.98E-01;
    -1.16E-02,1.71E-01,2.97E-01;
    -1.16E-02,1.66E-01,2.96E-01;
    -1.16E-02,1.63E-01,2.96E-01;
    -1.16E-02,1.59E-01,2.94E-01;
    -1.15E-02,1.55E-01,2.94E-01;
    -1.15E-02,1.49E-01,2.92E-01;
    -1.15E-02,1.46E-01,2.91E-01;
    -1.15E-02,1.43E-01,2.90E-01;
    -1.14E-02,1.39E-01,2.89E-01;
    -1.14E-02,1.35E-01,2.88E-01;
    -1.14E-02,1.32E-01,2.87E-01;
    -1.14E-02,1.28E-01,2.86E-01;
    -1.13E-02,1.25E-01,2.84E-01;
    -1.13E-02,1.21E-01,2.83E-01;
    -1.13E-02,1.18E-01,2.82E-01;
    -1.13E-02,1.14E-01,2.80E-01;
    -1.12E-02,1.12E-01,2.79E-01;
    -1.12E-02,1.08E-01,2.77E-01;
    -1.12E-02,1.05E-01,2.75E-01;
    -1.12E-02,1.01E-01,2.73E-01;
    -1.11E-02,9.69E-02,2.72E-01;
    -1.11E-02,9.45E-02,2.71E-01;
    -1.11E-02,9.18E-02,2.70E-01;
    -1.11E-02,8.87E-02,2.69E-01;
    -1.10E-02,8.55E-02,2.66E-01;
    -1.10E-02,8.32E-02,2.64E-01;
    -1.10E-02,8.05E-02,2.62E-01;
    -1.10E-02,7.77E-02,2.60E-01;
    -1.09E-02,7.46E-02,2.58E-01;
    -1.09E-02,7.19E-02,2.57E-01;
    -1.09E-02,6.84E-02,2.55E-01;
    -1.09E-02,6.60E-02,2.53E-01;
    -1.08E-02,6.41E-02,2.50E-01;
    -1.08E-02,6.29E-02,2.48E-01;
    -1.08E-02,6.02E-02,2.46E-01;
    -1.08E-02,5.78E-02,2.45E-01;
    -1.07E-02,5.43E-02,2.43E-01;
    -1.07E-02,5.20E-02,2.41E-01;
    -1.07E-02,4.84E-02,2.39E-01;
    -1.07E-02,4.69E-02,2.37E-01;
    -1.06E-02,4.49E-02,2.34E-01;
    -1.06E-02,4.38E-02,2.32E-01;
    -1.06E-02,4.14E-02,2.29E-01;
    -1.06E-02,3.95E-02,2.28E-01;
    -1.05E-02,3.63E-02,2.26E-01;
    -1.05E-02,3.52E-02,2.25E-01;
    -1.05E-02,3.28E-02,2.22E-01;
    -1.05E-02,3.16E-02,2.19E-01;
    -1.04E-02,2.93E-02,2.16E-01;
    -1.04E-02,2.81E-02,2.15E-01;
    -1.04E-02,2.54E-02,2.13E-01;
    -1.04E-02,2.42E-02,2.12E-01;
    -1.03E-02,2.19E-02,2.08E-01;
    -1.03E-02,2.07E-02,2.05E-01;
    -1.03E-02,1.84E-02,2.02E-01;
    -1.03E-02,1.76E-02,1.99E-01;
    -1.02E-02,1.56E-02,1.97E-01;
    -1.02E-02,1.48E-02,1.96E-01;
    -1.02E-02,1.29E-02,1.92E-01;
    -1.02E-02,1.21E-02,1.90E-01;
    -1.01E-02,9.77E-03,1.87E-01;
    -1.01E-02,8.98E-03,1.85E-01;
    -1.01E-02,7.42E-03,1.82E-01;
    -1.01E-02,6.64E-03,1.80E-01;
    -1.00E-02,5.08E-03,1.79E-01;
    -1.00E-02,4.30E-03,1.76E-01;
    -9.98E-03,1.95E-03,1.72E-01;
    -9.95E-03,1.17E-03,1.69E-01;
    -9.93E-03,-7.81E-04,1.67E-01;
    -9.90E-03,-1.17E-03,1.65E-01;
    -9.88E-03,-1.95E-03,1.62E-01;
    -9.85E-03,-1.95E-03,1.59E-01;
    -9.83E-03,-2.73E-03,1.56E-01;
    -9.80E-03,-3.13E-03,1.53E-01;
    -9.78E-03,-4.30E-03,1.50E-01;
    -9.75E-03,-4.69E-03,1.48E-01;
    -9.73E-03,-5.86E-03,1.46E-01;
    -9.70E-03,-6.64E-03,1.42E-01;
    -9.68E-03,-7.42E-03,1.38E-01;
    -9.65E-03,-7.81E-03,1.35E-01;
    -9.63E-03,-8.59E-03,1.32E-01;
    -9.60E-03,-8.98E-03,1.29E-01;
    -9.58E-03,-1.02E-02,1.26E-01;
    -9.55E-03,-1.05E-02,1.24E-01;
    -9.53E-03,-1.17E-02,1.21E-01;
    -9.50E-03,-1.21E-02,1.17E-01;
    -9.48E-03,-1.33E-02,1.14E-01;
    -9.45E-03,-1.41E-02,1.10E-01;
    -9.43E-03,-1.48E-02,1.07E-01;
    -9.40E-03,-1.56E-02,1.03E-01;
    -9.38E-03,-1.64E-02,9.99E-02;
    -9.35E-03,-1.68E-02,9.63E-02;
    -9.33E-03,-1.76E-02,9.32E-02;
    -9.30E-03,-1.84E-02,8.97E-02;
    -9.28E-03,-1.91E-02,8.70E-02;
    -9.25E-03,-1.99E-02,8.38E-02;
    -9.23E-03,-2.03E-02,8.07E-02;
    -9.20E-03,-2.11E-02,7.68E-02;
    -9.18E-03,-2.15E-02,7.29E-02;
    -9.15E-03,-2.23E-02,7.02E-02;
    -9.13E-03,-2.27E-02,6.74E-02;
    -9.10E-03,-2.38E-02,6.28E-02;
    -9.08E-03,-2.42E-02,5.92E-02;
    -9.05E-03,-2.50E-02,5.53E-02;
    -9.03E-03,-2.50E-02,5.18E-02;
    -9.00E-03,-2.58E-02,4.75E-02;
    -8.98E-03,-2.62E-02,4.48E-02;
    -8.95E-03,-2.70E-02,4.13E-02;
    -8.93E-03,-2.70E-02,3.85E-02;
    -8.90E-03,-2.77E-02,3.42E-02;
    -8.88E-03,-2.81E-02,3.07E-02;
    -8.85E-03,-2.93E-02,2.76E-02;
    -8.83E-03,-2.89E-02,2.56E-02;
    -8.80E-03,-3.05E-02,2.13E-02;
    -8.78E-03,-3.05E-02,1.74E-02;
    -8.75E-03,-3.20E-02,1.39E-02;
    -8.73E-03,-3.16E-02,1.20E-02;
    -8.70E-03,-3.32E-02,7.67E-03;
    -8.68E-03,-3.32E-02,4.94E-03;
    -8.65E-03,-3.48E-02,6.41E-04;
    -8.63E-03,-3.44E-02,-2.48E-03;
    -8.60E-03,-3.59E-02,-7.56E-03;
    -8.58E-03,-3.59E-02,-1.15E-02;
    -8.55E-03,-3.75E-02,-1.65E-02;
    -8.53E-03,-3.75E-02,-1.93E-02;
    -8.50E-03,-3.83E-02,-2.20E-02;
    -8.48E-03,-3.83E-02,-2.51E-02;
    -8.45E-03,-3.91E-02,-2.94E-02;
    -8.43E-03,-3.91E-02,-3.14E-02;
    -8.40E-03,-3.98E-02,-3.45E-02;
    -8.38E-03,-3.98E-02,-3.80E-02;
    -8.35E-03,-4.10E-02,-4.27E-02;
    -8.33E-03,-4.10E-02,-4.58E-02;
    -8.30E-03,-4.26E-02,-5.01E-02;
    -8.28E-03,-4.26E-02,-5.21E-02;
    -8.25E-03,-4.41E-02,-5.60E-02;
    -8.23E-03,-4.45E-02,-5.95E-02;
    -8.20E-03,-4.65E-02,-6.34E-02;
    -8.18E-03,-4.69E-02,-6.69E-02;
    -8.15E-03,-4.88E-02,-7.08E-02;
    -8.13E-03,-4.88E-02,-7.32E-02;
    -8.10E-03,-5.08E-02,-7.71E-02;
    -8.08E-03,-5.12E-02,-8.10E-02;
    -8.05E-03,-5.35E-02,-8.49E-02;
    -8.03E-03,-5.39E-02,-8.76E-02;
    -8.00E-03,-5.55E-02,-9.15E-02;
    -7.98E-03,-5.59E-02,-9.51E-02;
    -7.95E-03,-5.70E-02,-9.90E-02;
    -7.93E-03,-5.70E-02,-1.02E-01;
    -7.90E-03,-5.78E-02,-1.07E-01;
    -7.88E-03,-5.82E-02,-1.10E-01;
    -7.85E-03,-5.86E-02,-1.13E-01;
    -7.83E-03,-5.90E-02,-1.17E-01;
    -7.80E-03,-6.05E-02,-1.20E-01;
    -7.78E-03,-6.13E-02,-1.24E-01;
    -7.75E-03,-6.29E-02,-1.28E-01;
    -7.73E-03,-6.41E-02,-1.31E-01;
    -7.70E-03,-6.56E-02,-1.35E-01;
    -7.68E-03,-6.68E-02,-1.38E-01;
    -7.65E-03,-6.80E-02,-1.42E-01;
    -7.63E-03,-6.91E-02,-1.46E-01;
    -7.60E-03,-7.07E-02,-1.50E-01;
    -7.58E-03,-7.23E-02,-1.53E-01;
    -7.55E-03,-7.38E-02,-1.56E-01;
    -7.53E-03,-7.50E-02,-1.59E-01;
    -7.50E-03,-7.66E-02,-1.63E-01;
    -7.48E-03,-7.81E-02,-1.66E-01;
    -7.45E-03,-7.97E-02,-1.70E-01;
    -7.43E-03,-8.13E-02,-1.73E-01;
    -7.40E-03,-8.28E-02,-1.74E-01;
    -7.38E-03,-8.48E-02,-1.78E-01;
    -7.35E-03,-8.63E-02,-1.82E-01;
    -7.33E-03,-8.83E-02,-1.85E-01;
    -7.30E-03,-8.95E-02,-1.88E-01;
    -7.28E-03,-9.10E-02,-1.91E-01;
    -7.25E-03,-9.26E-02,-1.94E-01;
    -7.23E-03,-9.53E-02,-1.97E-01;
    -7.20E-03,-9.69E-02,-2.00E-01;
    -7.18E-03,-9.96E-02,-2.02E-01;
    -7.15E-03,-1.01E-01,-2.04E-01;
    -7.13E-03,-1.04E-01,-2.08E-01;
    -7.10E-03,-1.05E-01,-2.11E-01;
    -7.08E-03,-1.08E-01,-2.15E-01;
    -7.05E-03,-1.09E-01,-2.17E-01;
    -7.03E-03,-1.13E-01,-2.20E-01;
    -7.00E-03,-1.14E-01,-2.21E-01;
    -6.98E-03,-1.17E-01,-2.24E-01;
    -6.95E-03,-1.19E-01,-2.27E-01;
    -6.93E-03,-1.21E-01,-2.31E-01;
    -6.90E-03,-1.23E-01,-2.32E-01;
    -6.88E-03,-1.27E-01,-2.34E-01;
    -6.85E-03,-1.29E-01,-2.36E-01;
    -6.83E-03,-1.33E-01,-2.39E-01;
    -6.80E-03,-1.35E-01,-2.41E-01;
    -6.78E-03,-1.38E-01,-2.45E-01;
    -6.75E-03,-1.39E-01,-2.47E-01;
    -6.73E-03,-1.42E-01,-2.49E-01;
    -6.70E-03,-1.45E-01,-2.51E-01;
    -6.68E-03,-1.50E-01,-2.52E-01;
    -6.65E-03,-1.52E-01,-2.54E-01;
    -6.63E-03,-1.55E-01,-2.58E-01;
    -6.60E-03,-1.57E-01,-2.60E-01;
    -6.58E-03,-1.62E-01,-2.63E-01;
    -6.55E-03,-1.65E-01,-2.65E-01;
    -6.53E-03,-1.68E-01,-2.67E-01;
    -6.50E-03,-1.71E-01,-2.69E-01;
    -6.48E-03,-1.76E-01,-2.72E-01;
    -6.45E-03,-1.79E-01,-2.74E-01;
    -6.43E-03,-1.82E-01,-2.76E-01;
    -6.40E-03,-1.86E-01,-2.77E-01;
    -6.38E-03,-1.89E-01,-2.78E-01;
    -6.35E-03,-1.93E-01,-2.79E-01;
    -6.33E-03,-1.97E-01,-2.82E-01;
    -6.30E-03,-2.00E-01,-2.84E-01;
    -6.28E-03,-2.05E-01,-2.86E-01;
    -6.25E-03,-2.07E-01,-2.88E-01;
    -6.23E-03,-2.12E-01,-2.90E-01;
    -6.20E-03,-2.16E-01,-2.91E-01;
    -6.18E-03,-2.20E-01,-2.93E-01;
    -6.15E-03,-2.23E-01,-2.94E-01;
    -6.13E-03,-2.28E-01,-2.95E-01;
    -6.10E-03,-2.32E-01,-2.97E-01;
    -6.08E-03,-2.35E-01,-2.98E-01;
    -6.05E-03,-2.38E-01,-2.99E-01;
    -6.03E-03,-2.43E-01,-3.01E-01;
    -6.00E-03,-2.48E-01,-3.02E-01;
    -5.98E-03,-2.52E-01,-3.04E-01;
    -5.95E-03,-2.55E-01,-3.06E-01;
    -5.93E-03,-2.60E-01,-3.08E-01;
    -5.90E-03,-2.64E-01,-3.09E-01;
    -5.88E-03,-2.69E-01,-3.10E-01;
    -5.85E-03,-2.73E-01,-3.11E-01;
    -5.83E-03,-2.77E-01,-3.11E-01;
    -5.80E-03,-2.80E-01,-3.13E-01;
    -5.78E-03,-2.84E-01,-3.14E-01;
    -5.75E-03,-2.88E-01,-3.15E-01;
    -5.73E-03,-2.93E-01,-3.16E-01;
    -5.70E-03,-2.96E-01,-3.17E-01;
    -5.68E-03,-3.00E-01,-3.17E-01;
    -5.65E-03,-3.05E-01,-3.18E-01;
    -5.63E-03,-3.09E-01,-3.19E-01;
    -5.60E-03,-3.13E-01,-3.20E-01;
    -5.58E-03,-3.16E-01,-3.21E-01;
    -5.55E-03,-3.20E-01,-3.22E-01;
    -5.53E-03,-3.24E-01,-3.23E-01;
    -5.50E-03,-3.29E-01,-3.25E-01;
    -5.48E-03,-3.33E-01,-3.26E-01;
    -5.45E-03,-3.36E-01,-3.27E-01;
    -5.43E-03,-3.38E-01,-3.27E-01;
    -5.40E-03,-3.43E-01,-3.28E-01;
    -5.38E-03,-3.47E-01,-3.28E-01;
    -5.35E-03,-3.51E-01,-3.29E-01;
    -5.33E-03,-3.54E-01,-3.29E-01;
    -5.30E-03,-3.57E-01,-3.29E-01;
    -5.28E-03,-3.60E-01,-3.30E-01;
    -5.25E-03,-3.64E-01,-3.30E-01;
    -5.23E-03,-3.66E-01,-3.30E-01;
    -5.20E-03,-3.70E-01,-3.31E-01;
    -5.18E-03,-3.72E-01,-3.31E-01;
    -5.15E-03,-3.75E-01,-3.32E-01;
    -5.13E-03,-3.77E-01,-3.32E-01;
    -5.10E-03,-3.80E-01,-3.33E-01;
    -5.08E-03,-3.82E-01,-3.33E-01;
    -5.05E-03,-3.85E-01,-3.35E-01;
    -5.03E-03,-3.86E-01,-3.35E-01;
    -5.00E-03,-3.89E-01,-3.36E-01;
    -4.98E-03,-3.90E-01,-3.35E-01;
    -4.95E-03,-3.93E-01,-3.36E-01;
    -4.93E-03,-3.94E-01,-3.36E-01;
    -4.90E-03,-3.95E-01,-3.37E-01;
    -4.88E-03,-3.96E-01,-3.37E-01;
    -4.85E-03,-3.96E-01,-3.38E-01;
    -4.83E-03,-3.96E-01,-3.37E-01;
    -4.80E-03,-3.97E-01,-3.38E-01;
    -4.78E-03,-3.97E-01,-3.38E-01;
    -4.75E-03,-3.98E-01,-3.38E-01;
    ];

rawData = flipud(rawData);

t = rawData(:,1)';
vX = rawData(:,2)';
vY = rawData(:,3)';

end