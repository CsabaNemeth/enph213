function f_xHann = hannWindow(f_x)
%Created by; Alexander Shaw

%Computes the length of the inputted array
N = length(f_x);
%Creates a series of values for k between 0 and one less then the length of
%the inputted array
k = 0:N-1;
%Multiplies the inpuuted function by the Hann function
f_xHann =f_x.*((sin((pi.*k)./(N-1))).^2);
end