function [varargout] = pDer(g, x1, h1, x2, h2, x3, h3)
% GRADIENT [dg_dx1, dg_dx2*, dg_dx3*] = pDer(g, x1, h1, x2*, h2*, x3*, h3*)
% Written By: CSABA NEMETH
%
% (*) indicates an optional field.
% Takes an inline function, and various x arrays and step sizes to compute
% the partial derivatives of the function using Richardson's extrapolation.

%FUNCTION START

       %Use a switch statement run three cases based on the number of input
       %arguments given by nargin.
       switch nargin
           
           %Only single derivative to compute (nargin = 3).
           case 3
               varargout{1} = der(g, x1, h1);
               
           %Compute two partial derivatives (nargin = 5).
           case 5
               [varargout{1}, varargout{2}] = der2(g, x1, h1, x2, h2);
            
           %Compute three partial derivatives (nargin = 7).
           case 7
                [varargout{1}, varargout{2}, varargout{3}] = der3(g, x1, h1, x2, h2, x3, h3);
       end
    
end


%Helper Functions

%These are identical to the der.m function previously constructed in this
%lab, the only difference being the number of input variables. 
%The Richardson's extrapolation is completed 2 or 3 times for der2 and der3
%respectively.

function [df_dx1, df_dx2] = der2(g, x1, h1, x2, h2)

    %Calculate the function value at f(x +/- h) and f(x +/- 2h). This step is
    %somewhat unnescesary but makes the code easier to read.
    g_xph = g(x1+h1, x2);
    g_xmh = g(x1-h1, x2);
    g_xp2h = g(x1+2.*h1, x2);
    g_xm2h = g(x1-2.*h1, x2);
    
    %Calculate the slope up to the O(h^4) using Richardson's approximation.
    df_dx1 = (1/3) .* ( 4.* ((g_xph - g_xmh)./(2.*h1)) - ((g_xp2h - g_xm2h)./(4.*h1)));
    
    %Calculate the function value at f(x +/- h) and f(x +/- 2h). This step is
    %somewhat unnescesary but makes the code easier to read.
    g2_xph = g(x1, x2+h2);
    g2_xmh = g(x1, x2-h2);
    g2_xp2h = g(x1, x2+2.*h2);
    g2_xm2h = g(x1, x2-2.*h2);
    
    %Calculate the slope up to the O(h^4) using Richardson's approximation.
    df_dx2 = (1/3) .* ( 4.* ((g2_xph - g2_xmh)./(2.*h2)) - ((g2_xp2h - g2_xm2h)./(4.*h2)));
   
end

function [df_dx1, df_dx2, df_dx3] = der3(g, x1, h1, x2, h2, x3, h3)

    %Calculate the function value at f(x +/- h) and f(x +/- 2h). This step is
    %somewhat unnescesary but makes the code easier to read.
    g_xph = g(x1+h1, x2, x3);
    g_xmh = g(x1-h1, x2, x3);
    g_xp2h = g(x1+2.*h1, x2, x3);
    g_xm2h = g(x1-2.*h1, x2, x3);
               
    %Calculate the slope up to the O(h^4) using Richardson's approximation.
    df_dx1 = (1/3) .* ( 4.* ((g_xph - g_xmh)./(2.*h1)) - ((g_xp2h - g_xm2h)./(4.*h1)));
               
    %Calculate the function value at f(x +/- h) and f(x +/- 2h). This step is
    %somewhat unnescesary but makes the code easier to read.
    g_xph = g(x1, x2+h2, x3);
    g_xmh = g(x1, x2-h2, x3);
    g_xp2h = g(x1, x2+2.*h2, x3);
    g_xm2h = g(x1, x2-2.*h2, x3);
            
    %Calculate the slope up to the O(h^4) using Richardson's approximation.
    df_dx2 = (1/3) .* ( 4.* ((g_xph - g_xmh)./(2.*h2)) - ((g_xp2h - g_xm2h)./(4.*h2)));
         
    %Calculate the function value at f(x +/- h) and f(x +/- 2h). This step is
    %somewhat unnescesary but makes the code easier to read.
    g_xph = g(x1, x2, x3+h3);
    g_xmh = g(x1, x2, x3-h3);
    g_xp2h = g(x1, x2, x3+2.*h3);
    g_xm2h = g(x1, x2, x3-2.*h3);
    
    %Calculate the slope up to the O(h^4) using Richardson's approximation.
    df_dx3 = (1/3) .* ( 4.* ((g_xph - g_xmh)./(2.*h3)) - ((g_xp2h - g_xm2h)./(4.*h3)));

end



