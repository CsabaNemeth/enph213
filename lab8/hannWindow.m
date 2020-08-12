function [f_xHann] = hannWindow(f_x)
% Windowed Sample Points [f_xHann] = hannWindow(f_x)
% %Written By: Csaba Nemeth
% Version Since: 2020-03-09
%
%Applies a Hann window function to a set of sample points. Takes an input
%array f_x of sample points and returns a same sized array f_xHann. 

    %Find the number of points N.
    N = size(f_x, 2);
    
    %Create k values.
    k = 0:N-1;
    
    %Apply Hann window function to set of points.
    f_xHann = f_x.*((sin((pi.*k)./(N-1))).^2);

end %End Function 
