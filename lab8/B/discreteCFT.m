function c = discreteCFT(f_x)
%Created by: Alexander Shaw

N = length(f_x); %calcuates the length of the sample points array
c = zeros(1,N);%Preassigns space for arrays c
k = 0:1:N-1; %Creates an array thats the length of N but starts at 0
i = sqrt(-1); %Saves a value for the complex number i
R  = floor(N/2)+1; %Determine half of the length 

%Loops through the length of the sample points 
for r = 1:N
    
    ck = f_x.*exp((-2*pi*i.*(r-R).*k)./N); %Determines the delta function for a
    c(r) = (1./N).*(sum(sum(ck))); %Sums the delta function and mitliplies it by 1/N
end 
end 