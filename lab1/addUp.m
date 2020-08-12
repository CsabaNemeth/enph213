function sums = addUp(vector)
% ADDUP sums = addUp(vector)
%   Written by: Csaba Nemeth
%   inputs a row vector (vector) and returns the sum of the elements (sums)

% YOUR CODE GOES HERE

    %Set the initial sum to 0.
    sums = 0; 
    
    %Check that the vector is numeric and can be summed.
    if isnumeric(vector)
        
        %Loop through the vector, accessing each element by index. The
        %limit on the for loop is the number of elements in the vector,
        %which can be found through length(vector).
        %---------------------------------------------------------------
        for index = 1:length(vector)
            sums = sums + vector(index); %Add each element to the variable "sums".
        end %End for loop.
        %---------------------------------------------------------------
        
    else 
        
        %Print simple error statement.
        fprintf("Vector class type cannot be summed");
        
    end %End if statement.
    
end %End function.


