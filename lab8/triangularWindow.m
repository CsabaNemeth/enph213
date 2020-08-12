function [f_xTri] = triangularWindow(f_x)
%Triangular Window [f_xTri] = triangularWindow(f_x)
%Written By: Csaba Nemeth
%Version Since: 2020-03-09
%
% Takes an array input f_x and applies a triangular window function to the
% set of points.

    %Find number of samples N.
    N = size(f_x, 2);
    
    %Create window to define the triangular pulse.
    window = linspace(-1, 1, N);
    
    %Comput triangualar function using the window matrix.
    f_xTri = triangularPulse(window).*f_x;
    
end
