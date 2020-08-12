
function dy = errProp(f, a, da, b, db, c, dc)
%ERROR dy = errProp(f, a, da, b, db, c, dc)
%WRITTEN BY: Csaba Nemeth
%
%Takes an input of a function, input variables as arrays and the errors in
%variable. Returns the propogated error of the function.

    %Use a switch statement run three cases based on the number of input
    %arguments given by nargin.    
    switch nargin
        
        %Function is dependent on one variable one.
        case 3
            dy = pDer(f, a, da).*da;
        
        %Function is dependent on 2 variables. Call pDer with the two
        %variables and propogate them into dy.
        case 5
            [df_da, df_db] = pDer(f, a, da, b, db);  
            dy = sqrt(((df_da.*da).^2)+((df_db.*db).^2));
            
        %Function is dependent on 3 variables. Call pDer with the two
        %variables and propogate them into dy.
        case 7
            [df_da, df_db, df_dc] = pDer(f, a, da, b, db, c, dc);
            dy = sqrt(((df_da.*da).^2)+((df_db.*db).^2)+((df_dc.*dc).^2));
            
    end
    
end


