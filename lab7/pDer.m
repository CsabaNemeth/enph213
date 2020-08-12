function [d1,d2,d3] = pDer(g,x1,h1,x2,h2,x3,h3)
% [d1,d2,d3] = pDer(g,x1,h1,x2,h2,x3,h3)
% Written by: David DeVries
% evaluates the partial derivative of g, in 1, 2, or 3 dimensions,
% depending on the input, at point (x1,x2,x3). h's are given as the
% interval spacing

numDim = nargin(g); % find out how many inputs g accepts

switch numDim
    case 1 %1D
        term1 = (g(x1+h1) - g(x1-h1)) ./ (2*h1);
        term2 = (g(x1+2*h1) - g(x1-2*h1)) ./ (4*h1);
        
        d1 = (1/3) .* (4 .* term1 - term2);
        d2 = [];
        d3 = [];
    case 2 %2D
        d1 = (1/3) .* (4 .* ((g(x1+h1,x2) - g(x1-h1,x2)) ./ (2.*h1)) - ((g(x1+2.*h1,x2) - g(x1-2.*h1,x2)) ./ (4.*h1)));
        d2 = (1/3) .* (4 .* ((g(x1,x2+h2) - g(x1,x2-h2)) ./ (2.*h2)) - ((g(x1,x2+2.*h2) - g(x1,x2-2.*h2)) ./ (4.*h2)));
        d3 = [];
    case 3 %3D
        d1 = (1/3) .* (4 .* ((g(x1+h1,x2,x3) - g(x1-h1,x2,x3)) ./ (2.*h1)) - ((g(x1+2*h1,x2,x3) - g(x1-2*h1,x2,x3)) ./ (4.*h1)));
        d2 = (1/3) .* (4 .* ((g(x1,x2+h2,x3) - g(x1,x2-h2,x3)) ./ (2.*h2)) - ((g(x1,x2+2*h2,x3) - g(x1,x2-2*h2,x3)) ./ (4.*h2)));
        d3 = (1/3) .* (4 .* ((g(x1,x2,x3+h3) - g(x1,x2,x3-h3)) ./ (2.*h3)) - ((g(x1,x2,x3+2*h3) - g(x1,x2,x3-2*h3)) ./ (4.*h3)));

end

