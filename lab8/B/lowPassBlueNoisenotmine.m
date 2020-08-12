function [f_xFiltered] = lowPassBlueNoise(x,f_x,freq_c)
%LOWPASSBLUENOISE [f_xFiltered] = lowPassBlueNoise(x, f_x, freq_c)
% Fourier filters a signal corrupted with blue noise by removing the fourier
% coefficients above a specified frequency freq_c

N = length(x);
c = discreteCFT(f_x);% Runs fourier transform on original data
rad_c = 2*pi*freq_c;% Converts to rad/s
rad = -floor(N/2):floor(N/2)-1;% Angular frequency array

%If frequency is above cutoff, set c to 0
c(find(rad >= rad_c)) = 0 + 0i;
c(find(rad <= -rad_c)) = 0 + 0i;

%New data
f_xFiltered = real(discreteICFT(c));
end




