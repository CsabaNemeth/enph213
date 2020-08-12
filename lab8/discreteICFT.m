function [f_x] = discreteICFT(c)
%Fourier Transform [f_x] = discreteICFT(c)
%Written By: Csaba Nemeth
%Version Since: 2020-03-09
%
%Finds the inverse complex fourier transform of a set of coefficiants c as
%a row vector of length N. 

    %Find number of data points.
    N = size(c, 2);
    
    %Declare solution array.
    f_x = zeros(size(c));

    %Define k from 1 to N.
    r = (1:N) - floor((N+1)/2);

    %Perform inverse fourier sum.
    for row = 1:size(c,1)
        for k = 1:N
            f_x(k) = sum(c.*exp(1j*2*pi*(r)*(k-1)/N));
        end
    end
    
end
