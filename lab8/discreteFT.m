function [a, b] = discreteFT(f_x)
%Coefficients [a, b] = discreteFT(f_x)
%Written By: Csaba Nemeth
%Version Since: 2020-03-09
%
%Takes an input array f_x of N sampled values for a periodic function and
%returns the N sized row vectors a and b defining the fourier transform of
%the function. Function is limited to periodic datasets.

%Find number of samples N.
N = length(f_x);

%Initialize the row vectors a and b.
a = zeros(1, floor(N/2) + 1);
b = zeros(1, floor(N/2) + 1);

%Solve for coefficiants c_r;
for r = 1:floor(N/2)+1
   
    %Compute sum for each element r in a and b.
    for k = 0:N-1
        a(r) = a(r) + (2/N)*f_x(k+1)*cos(2*pi*(r-1)*k/N);
        b(r) = b(r) + (2/N)*f_x(k+1)*sin(2*pi*(r-1)*k/N);
    end %End Sum Compute
    
end %End loop through elements.

end %End Function
