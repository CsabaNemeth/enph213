function [c] = discreteCFT(f_x)
%Coefficiants [c] = discreteCFT(f_x)
%Written By: Csaba Nemeth
%Version Since: 2020-03-09
%
%Caluclates the complex fourier transform of N sampled data points given in
%the row vector f_x. Returns c, the coefficiants defining the fourier sum.
%Function is limited to periodic functions, and returns coeffeciants
%such that the median value is centered on 0.

    %Find number of samples N.
    N = length(f_x);

    %Initialize row vector coefficiants c;
    c = zeros(1, N);
    
    %For N elements in c..
    for r = 1:N
        
        %Apply expression for a single element in the sum. The element in
        %the sum has to be r-floor((N+1)/2) because the complex fourier sum
        %runs from -inf to inf as opposed to 0 to inf.
        for k = 0:N-1
            c(r) = c(r) + (1/N)*f_x(k+1)*exp(-2*pi*1i*(r-floor((N+1)/2))*k/N);
        end %End Sum
        
    end %End compute elements.

end %End complex fourier.

