function [a_opt, f0_opt, converged] = leastMeanSquareFit(V_fit, t_fit, a_init, f0_init)
%Optimal Values [a_opt, f0_opt, converged] = leastMeanSquareFit(V_fit,
%t_fit, a_init, f0_init)
%Written By: Csaba Nemeth
%Version Since: 2020-02-29
%
% leastMeanSquareFit returns the optimal values of a, the attenutation
% coefficiant and f_0 the fundamental frequency that minimize the distance
% between a fitted curve and a dataset. This program is limited to a system
% described by a general damped sinusoidal pulse of the form:
%
%                       V(t) = e^(-at)cos(2pi*f_0*t)
%
% The function takes array inputs of the voltage fit and time fit, as well
% as inital guesses on what a and f0 might be. The optimal value is
% computed by iteratively updating 


%Set maximum iterations for non-convergence and convergence boolean.
max_iterations = 10000;
converged = false;

%Set a_opt and f0_opt to inital values;
a_opt = a_init;
f0_opt = f0_init;

%Set threshold accuracy.
threshold = 1e-10;

%Find inital solution matrix.
solution = [-F(a_opt, f0_opt, V_fit, t_fit); -G(a_opt, f0_opt, V_fit, t_fit)];

%Find initial jacobian.
jacobian = findJacobian(a_opt, f0_opt, V_fit, t_fit);

%Find shifts for next iteration.
shift = jacobian\solution;

%Initialize iteration to find threshold value:
for i = 1:max_iterations

    %If solutions are under the threshold value, set convergence to true
    %and break from loop.
    if (abs(solution(1)) < threshold && abs(solution(2)) < threshold)
        converged = true;
        break;
    else %If not under threshold:
        %Find next a and f0 by adding the calculated shift.
        a_opt = a_opt + shift(1);
        f0_opt = f0_opt + shift(2);
  
        %Solve the system again by calling F, G, findJacobian and finding
        %the shift using the updated values for a and f0.
        solution = [-F(a_opt, f0_opt, V_fit, t_fit); -G(a_opt, f0_opt, V_fit, t_fit)];
        jacobian = findJacobian(a_opt, f0_opt, V_fit, t_fit);
        shift = jacobian\solution;
    end
end

end %End Function leastMeansSquareFit