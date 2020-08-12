function [a_opt, f0_opt, d_a, d_f0] = leastMeanSquareFitWithError(V_fit, t_fit, V_fit_error, a_init, f0_init)
%Optimal Value With Error [a_opt, f0_opt, d_a, d_f0] = leastMeanSquareFitWithError(V_fit, t_fit, V_fit_error, a_init, f0_init)
%Written By: Csaba Nemeth
%Version Since: 2020-03-02
%
% leastMeanSquareFitWithError computes the error d_a and d_f0 in the
% optimal valies a_opt and f0_opt for a damped sinusoidal pulse:
%
%                       V(t) = e^(-at)cos(2pi*f_0*t)
%
% The function takes arguments of sampled data V_fit, t_fit, as well as the
% error in the sampling V_fit_error. The function is also supplied with
% initial guesses for a and f0; a_init and f0_init. The optimal values are
% computed using a leastMeanSquareFit() function. The error is found by
% finding a and f0 values when the V_fit_error is applied to a singular element
% in the data set. This is repeated for all values and the quadrature sum
% of the differences between these a and f0 values and the optimal a and f0
% values is returned. This function is limited to the system described
% above.

%Find optimal values of a and f0 without accounting for error:
[a_opt, f0_opt] = leastMeanSquareFit(V_fit, t_fit, a_init, f0_init);

%Create arrays to hold error for values at each data point.
d_a_arr = zeros(1, length(V_fit));
d_f0_arr = zeros(1, length(V_fit));

for i = 1:length(V_fit)
    
    %Add the error in the fit to the current point.
    curr_V_fit = V_fit;
    curr_V_fit(i) = curr_V_fit(i) + V_fit_error;
    
    %Find the current values using the modifed fitted array.
    [curr_a, curr_f0] = leastMeanSquareFit(curr_V_fit, t_fit, a_init, f0_init);
    
    %Find the difference bewteen the optimal a and the a computed with
    %error in the data points. Read this into an array.
    d_a_arr(i) = abs(a_opt - curr_a);
    d_f0_arr(i) = abs(f0_opt - curr_f0);
    
end

%Add the errors in quadrature to get final values.
d_a = sqrt(sum(d_a_arr.^2));
d_f0 = sqrt(sum(d_f0_arr.^2));

end %End Function leastMeanSquareFitWithError(V_fit, t_fit, V_fit_error, a_init, f0_init)