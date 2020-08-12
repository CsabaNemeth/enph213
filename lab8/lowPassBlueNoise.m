function f_xFiltered = lowPassBlueNoise(x, f_x, freq_c)
%Filtered Data f_xFiltered = lowPassBlueNoise(x, f_x, freq_c)
%Written By: Csaba Nemeth
%Version Since: 2020-03-15
%
%Filters the input signal defined by the arrays x, the independent variable
%sample, f_x, the dependent variable sample and cut off frequency freq_c.
%Assumes the signal is corrupted by blue-noise. 

%Finds N the number of data points. 
N = length(x);

%Calculates the Fourier coefficients of the sampled data.
c = discreteCFT(f_x);

%Calculate the angular cut off frequency.  
ang_c = 2*pi*freq_c;

%Initialize array of angular frequency values.
ang_f = -floor(N/2):floor(N/2)-1;

%Set coefficiant to 0 if the frequncy is above the cut-off frequency.
c(find(ang_f >= ang_c)) = 0 + 0i;
c(find(ang_f <= -ang_c)) = 0 + 0i;

%Save the filtered data.
f_xFiltered = real(discreteICFT(c));
end