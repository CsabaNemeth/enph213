function h_opt = derOptStep(f, fder, x)
%OPTIMAL STEPSIZE h_opt = derOptStep(f, fder, x)
%Written By: CSABA NEMETH
%
%Takes an input of a function, its analytical derivative and an array of x
%values. Returns the optimal step size h for conducting a Richardson's
%approximation.

%Evaluate the exact derivative at the x-values.
fder_exact = fder(x);

%Initialize with large values
mean_diff_optimal = 1000;
h_opt = 1000;

%To determine the intial step size, I took the average of the x-step
%between the points in the x dataset. This means that the function will
%choose a reasonable starting point for varying data set step sizes. This
%is not the best way to do this, but I wanted to avoid hard-coding a value.
step_array = zeros(1, length(x) - 1);
for i = 1:length(x) - 1
    step_array(i) = abs(x(i)-x(i+1));
end
h_curr = mean(step_array);

%The variation h_curr should be decreased by h_curr/20 each time.
h_step = h_curr./20;

%For simplicity sake, I used a brute force search (although this has the
%potential of falling into local minima).

%While the current h is greater than 0 (ideally I will break out of the
%loop before it reaches this point but I wanted to avoid a while(true)
%infinite loop).
while h_curr > 0
    
    %Calculate the approximate derivative and absolute difference.
    fder_approx = der(f, x, h_curr);
    abs_diff = abs(fder_exact - fder_approx);
    
    %If the iteration returns a better mean, set the optimal h value as the
    %current h value. If the value is becoming less optimal, breakout of
    %the search.
    if mean(abs_diff) < mean_diff_optimal
        h_opt = h_curr;
    else 
        break;
    end
    
    %Iterate the current value.
    h_curr = h_curr - h_step;
    
end

end


