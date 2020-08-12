function f_x = discreteICFT(c)
%Created by: Alexander Shaw

N = length(c); %calcuates the length of the coefficient array
k = N-1:-1:0; %Creates an array thats the length of N but starts at 0
i = sqrt(-1); %Saves a value for the complex number i
R  = floor(N/2)+1; %Determine half of the length 
c = (c.*N)';%Changes c to a column vector
b = zeros(N,N);%Creates an empty array b

%Creates a matrix with columns for every k value and rows for every value of r
%This is to allow for solving the system of equations, which will result in
%the values for f_x
for r = 1:N
    b(r,1:end) = exp((-2*pi*i.*(r-R).*k)./N);
end 
%Solves the system of Equations 
f_x = (real(b\c))';
%For unknwon reasons, the first f_x value would appear as the last element,
%so this will rearrange the matrix
f_x = [f_x(end) f_x];
f_x(end) = [];
end 
