function [value] = Gcirc(x_c, y_c, r, x_edge, y_edge)
%Partial Derivative w.r.t y_c = [value] = Fcirc(x_c, y_c, r, x_edge, y_edge)
%Written By: Csaba Nemeth
%Version Since: 2020-03-02
%
% Finds the partial derivative of the Z function with respect to the
% circle's center y-coordinate. This function is to be used in conjuction
% with a least mean sqaure approach to circle fitting and detection in
% image processsing.
%
% The function takes array x_c, y_c defining the circle center, the radius
% r and the coordinates of the edges. Returns the partial derivative with
% respect to y_c, evaluated at the passed points.

%Find difference between inner point and edge.
dx = x_c - x_edge;
dy = y_c - y_edge;

%Evaluate partial derivative of Z with respect to y_c.
value = sum(2.*(dy).*(sqrt(dx.^2 + dy.^2) - r)./...
            sqrt(dx.^2 + dy.^2));

end %End Function Gcirc(x_c, y_c, r, x_edge, y_edge)
