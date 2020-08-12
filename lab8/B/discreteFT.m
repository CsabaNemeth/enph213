function [a, b] = discreteFT(f_x) 
%Created by: Alexander Shaw

N = length(f_x); %calcuates the length of the sample points array
R  = floor(N/2)+1; %Determine half of the length 
m = mod(R,2); %Determines if the lenght is an even or odd number
a = zeros(1,R);%Preassigns space for arrays a and b
b = zeros(1,R);
k = 0:1:N-1; %Creates an array thats the length of N but starts at 0

%Loops through half the length of the sample points 
for r = 1:R
    ak = f_x.*cos((2*pi*(r-1).*k)./N); %Determines the delta function for a
    a(r) = (2./N).*(sum(ak)); %Sums the delta function and mitliplies it by N/2
    bk = f_x.*sin((2*pi*(r-1).*k)./N);%Determines the delta function for b
    b(r) = (2./N).*(sum(bk));%Sums the delta function and mitliplies it by N/2
end 

%If the length of f_x is even, this sets the last element in b to zero
if m == 0
    b(end) = 0;
end

end 

        
    



