function [Ex, Ey, Ez] = eGrad(V, x, y, z)
%ELECTRIC FIELD {Ex, Ey, Ey] = eGrad(V, x, y, z)
%Written By: CSABA NEMETH
%
%Takes an input of x, y, z data points and an inline function defining the
%potential. Returns the electric field componenets in the x, y and z
%direction.

%Step size h used to compute the partial derivatives.
h = 0.01;

%Create a 3-D matrix with grid coordinates defined by the vectors x, y, z.
[X, Y, Z] = meshgrid(x, y, z);

%Compute partial derivatives with step-size h.
[dv_dx, dv_dy, dv_dz] = pDer(V, X, h, Y, h, Z, h);

%Electric field is negative the partial of the potential, so we invert the
%sign to return.
Ex = -dv_dx;
Ey = -dv_dy;
Ez = -dv_dz;

end %End function.



