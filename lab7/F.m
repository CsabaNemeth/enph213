function [value] = F(a, f_0, V_fit, t_fit)
% Partial Derivative w.r.t a [value] = F(a, f_0, V_fit, t_fit)
% Written By: Csaba Nemeth
% Version Since: 2020-02-29
%
% Function F returns the partial derivative of the sum of the sqaures of
% the differences Z of a general damped sinusoidal pulse of the form:
%
%                       V(t) = e^(-at)cos(2pi*f_0*t)
%
% with respect to the attenuation coefficiant a. The partial derivative is
% calculated by hand, therefore this function is limited to the equation
% described above.
%
% F takes inputs of the attenuation coefficiant a, the fundamental
% frequency f_0, V_fit.

% The function V(t) evaluated at all times t_fit:
V = exp(-a.*t_fit).*cos(2.*pi.*f_0.*t_fit);

% The partial derivative with respect to a, calculated by hand and
% evaluated at all time t_fit:
dV_da = -t_fit.*V;

%Evaluate the partial derivative of the sum of the squares.
value = sum(2.*(V-V_fit).*(dV_da));

end %End Function F(a, f_0, V_fit, t_fit)