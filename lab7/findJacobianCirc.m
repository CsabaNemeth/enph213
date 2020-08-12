function [jacobianCirc] = findJacobianCirc(x_c, y_c, r, x_edge, y_edge)
%Jacobian Matrix [jacobianCirc] = findJacobianCirc(x_c, y_c, r, x_edge, y_edge)
%Written By: Csaba Nemeth
%Version Since: 2020-03-02
%
%Finds the jacobian matrix using the function F, G, H, the partial
%derivative of the Z function evaluated at circle's x-center coordinate,
%y-center coordinate and the radius r. The function only works with this
%special case, therfore cannot be used to find the jacobian of a general
%system.
%
%The function takes inputs x_c, y_c, defining the circle center point, the
%radius r and arrays x_edge and y_edge defining the edges of the image. 

%Set step size h
h = 1e-4;

%Partial derivative with respect to x.
Fcirc = @(x, y, r) sum(2.*(x).*(sqrt(x.^2 + y.^2) - r)./...
            sqrt(x.^2 + y.^2));
        
%Partial derivative with respect to y.      
Gcirc = @(x, y, r) sum(2.*(y).*(sqrt(x.^2 + y.^2) - r)./...
            sqrt(x.^2 + y.^2));   

%Partial derivative with respect to r;
Hcirc = @(x, y, r) sum(-2.*(sqrt(x.^2 + y.^2) - r));

%Compute differences:
dx = x_c - x_edge;
dy = y_c - y_edge;

%Compute partial derivatives.
[dFcirc_dx, dFcirc_dy, dFcirc_dr] = pDer(Fcirc, dx, h, dy, h, r, h);
[dGcirc_dx, dGcirc_dy, dGcirc_dr] = pDer(Gcirc, dx, h, dy, h, r, h);
[dHcirc_dx, dHcirc_dy, dHcirc_dr] = pDer(Hcirc, dx, h, dy, h, r, h);

%Construct jacobian matrix.
jacobianCirc = [dFcirc_dx, dFcirc_dy, dFcirc_dr;...
                dGcirc_dx, dGcirc_dy, dGcirc_dr;...
                dHcirc_dx, dHcirc_dy, dHcirc_dr];
                

end %End Function findJacobianCirc(x_c, y_c, r, x_edge, y_edge)
