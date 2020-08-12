function df_dx = der(f, x, h)
%SLOPE df_dx = der(f, x, h)
%Written by: CSABA NEMETH
% Takes inputs of an inline function f, x-values (array) and step size h
% and returns a Richardson's approxmation for the slope of the function.

%FUNCTION START

%Calculate the function value at f(x +/- h) and f(x +/- 2h). This step is
%somewhat unnescesary but makes the code easier to read.
f_xph = f(x+h);
f_xmh = f(x-h);

f_xp2h = f(x+2.*h);
f_xm2h = f(x-2.*h);

%Calculate the slope up to the O(h^4) using Richardson's approximation.
df_dx = (1/3) .* ( 4.* ((f_xph - f_xmh)./(2.*h)) - ((f_xp2h - f_xm2h)./(4.*h)));

end
