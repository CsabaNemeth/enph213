function [jacobian] = findJacobian(a, f_0, V_fit, t_fit)
% Jacobian Matrix [jacobian] = findJacobian(a, f_0, V_fit, t_fit)
% Written By: Csaba Nemeth
% Version Since: 2020-02-29
%
% findJacobian returns the Jacobian matrix of F and G with respect to a and
% f_0. This program is limited to a system described by a general damped
% sinusoidal pulse of the form:
%
%                       V(t) = e^(-at)cos(2pi*f_0*t)
%
% The function takes an input of the attenuation coefficiant a and the
% fundamental frequency f_0, as well as arrays containing data for the
% voltage fit and time fit. The jacobian is computed by calling the partial
% derivatives of inline functions describing F and G.

%Compute step-size h for partial derivatives:
h_a = a/10000;
h_f0 = f_0/10000;

%Create inline functions for F and G:
F = @(a, f_0) sum(2.*(exp(-a.*t_fit).*cos(2.*pi.*f_0.*t_fit) - V_fit)...
    .*-t_fit.*(exp(-a.*t_fit).*cos(2.*pi.*f_0.*t_fit)));
G = @(a, f_0) sum(2.*(exp(-a.*t_fit).*cos(2.*pi.*f_0.*t_fit) - V_fit)...
    .*-exp(-a.*t_fit).*sin(2.*pi.*f_0.*t_fit).*(2.*pi.*t_fit));

%Find the partial derivatves of F and G with respect to a and f_0 and read
%directly into jacobian matrix:
[dF_da, dF_df] = pDer(F, a, h_a, f_0, h_f0);
[dG_da, dG_df] = pDer(G, a, h_a, f_0, h_f0);

%Construct Jacobian:
jacobian = [dF_da, dF_df; dG_da, dG_df];

end %End Function findJacobian(a, f_0, V_fit, t_fit)
