function f_xFiltered = lowPassBlueNoise(x,f_x,freq_c)
%Created by: Alexander Shaw

%Caculates the length of the inputted x array
N = length(x);
%Calculates the Fourier coefficients for the inputted samples function 
c = discreteCFT(f_x);
%Calculate the angular cut off frequency  
angc = 2*pi*freq_c;
%Creates an array of angular frequencies
angf = -floor(N/2):floor(N/2)-1;

%If the angular frequency is above the cutoff frequency, the Fourier coefficient is set to zero  
c(find(angf >= angc)) = 0 + 0i;
c(find(angf <= -angc)) = 0 + 0i;

%Outputs the new data 
f_xFiltered = real(discreteICFT(c));
end