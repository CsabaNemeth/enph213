function f_xTri = triangularWindow(f_x)
%Created by: Alexander Shaw

%Calculates the length of the inputted array of sample points
N = length(f_x);
%Creates an array between -1 and 1 with the same number of points as in the
%inputted array 
t = linspace(-1,1,N);
%Uses the matlab function triangularPulse to create a triangular wave and
%applies it to the sampled points
f_xTri = f_x.*triangularPulse(t);

end