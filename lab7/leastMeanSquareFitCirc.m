function [xc_opt, yc_opt, r_opt, sumd] = leastMeanSquareFitCirc(x_edge, y_edge, xc_init, yc_init, r_init)
% LEASTMEANSQUAREFITCIRC Takes in the data to fit (x_edge, y_edge),
% starting values for x_c, y_c, and r, and finds the optimal values for
% x_c, y_c, and r.
% Written by: Csaba Nemeth
% Version Since: 2020-03-07

% Declare array of optimal values for the different inital values.
XC_OPT = zeros(length(xc_init), length(yc_init), length(r_init));
YC_OPT = zeros(length(xc_init), length(yc_init), length(r_init));
R_OPT = zeros(length(xc_init), length(yc_init), length(r_init));

% Iterate over different initial values.
for i = 1:length(xc_init)
    for j = 1:length(yc_init)
        for k = 1:length(r_init)
            % Find the optimal value at each iteration and store into 3D
            % arrays.
            [XC_OPT(i, j, k), YC_OPT(i, j, k), R_OPT(i, j, k)] = findOptimal(x_edge, y_edge, xc_init(i), yc_init(j), r_init(k));
        end
    end
end

% flatten array of optimal values
XC_OPT = reshape(XC_OPT, 1, []);
YC_OPT = reshape(YC_OPT, 1, []);
R_OPT = reshape(R_OPT, 1, []);

% find mode of optimal values
xc_opt = mode(XC_OPT);
yc_opt = mode(YC_OPT);
r_opt = mode(R_OPT);

% find net absolute difference in distance between edge points and circle
% and the radius of the circle, this tells us the "goodness" of fit
sumd = sum(abs(sqrt((xc_opt - x_edge).^2 + (yc_opt - y_edge).^2) - r_opt));

end

% Helper Function To Find the optimal 
function [xc_opt, yc_opt, r_opt] = findOptimal(x_edge, y_edge, xc_init, yc_init, r_init)

%Set max-iterations and the threshold.
max_iterations = 15;
threshold = 1e-4;

%Find partial derivatives.
F = Fcirc(xc_init, yc_init, r_init, x_edge, y_edge);
G = Gcirc(xc_init, yc_init, r_init, x_edge, y_edge);
H = Hcirc(xc_init, yc_init, r_init, x_edge, y_edge);

%Declare optimal return values to initial.
xc_opt = xc_init;
yc_opt = yc_init;
r_opt = r_init;

%Iterate for the number of max iterations.
for i = 1:max_iterations
    
    %Break if threshold value is reached.
    if abs(F) < threshold && abs(G) < threshold && abs(H) < threshold
        break;
    end
    
    %If least mean square approach reaches outside of the defined image
    %boundary, return NaN values and break.
    if xc_opt < 0 || xc_opt > 240 || yc_opt < 0 || yc_opt > 160 || r_opt < 0 || r_opt > 80
        xc_opt = NaN;
        yc_opt = NaN;
        r_opt = NaN;
        break;
    end
    
    %Solve for the iteration step.
    B = [-F; -G; -H];
    step_h = findJacobianCirc(xc_opt, yc_opt, r_opt, x_edge, y_edge)\B;
    
    %Apply iteration step.
    xc_opt = xc_opt + step_h(1);
    yc_opt = yc_opt + step_h(2);
    r_opt = r_opt + step_h(3);
    
    %Solve for F, G, H functions of Z.
    F = Fcirc(xc_opt, yc_opt, r_opt, x_edge, y_edge);
    G = Gcirc(xc_opt, yc_opt, r_opt, x_edge, y_edge);
    H = Hcirc(xc_opt, yc_opt, r_opt, x_edge, y_edge);
    
end % End For Loop

end %End Helper Function

