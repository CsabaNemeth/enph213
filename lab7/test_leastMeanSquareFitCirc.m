function [] = test_leastMeanSquareFitCirc()
%[] = test_leastMeanSquareFitCirc()
% Written by: Tristan Fleming
% tests the leastMeanSquareFitCirc function for edge points from the three
% sample tablet images

load('tabletImagesSobel');

% Non zero values in edge array are "found" and indexed into x_edge and
% y_edge
[x_edge1, y_edge1] = find(tabletImgSobelExp1);
[x_edge2, y_edge2] = find(tabletImgSobelExp2);
[x_edge3, y_edge3] = find(tabletImgSobelExp3);

% Set ranges for initial values of x_c, y_c, and r
xc_init = 115:1:125;
yc_init = 75:1:85;
r_init = 15:2:50;

%% First test tablet

% Actual optimal values
[x_cAct1, y_cAct1, rAct1, sumdAct1] = leastMeanSquareFitCirc(x_edge1, y_edge1, xc_init, yc_init, r_init);

% tolerance
tol = 0.01;

x_cExp1 = 80.4749169504190;
y_cExp1 = 120.651733416213;
rExp1 = 23.4340400236684;
sumdExp1 = 139.220374740819;

% check
checkEqual(x_cAct1, x_cExp1, tol, 1);
checkEqual(y_cAct1, y_cExp1, tol, 2);
checkEqual(rAct1, rExp1, tol, 3);
checkEqual(sumdAct1, sumdExp1, tol, 4);

%% Second test tablet

% Actual optimal values
[x_cAct2, y_cAct2, rAct2, sumdAct2] = leastMeanSquareFitCirc(x_edge2, y_edge2, xc_init, yc_init, r_init);

x_cExp2 = 81.2135505596414;
y_cExp2 = 121.306242502978;
rExp2 = 42.5607651782297;
sumdExp2 = 3379.39867220872;

% check
checkEqual(x_cAct2, x_cExp2, tol, 5);
checkEqual(y_cAct2, y_cExp2, tol, 6);
checkEqual(rAct2, rExp2, tol, 7);
checkEqual(sumdAct2, sumdExp2, tol, 8);

%% Third test tablet

% Actual optimal values
[x_cAct3, y_cAct3, rAct3, sumdAct3] = leastMeanSquareFitCirc(x_edge3, y_edge3, xc_init, yc_init, r_init);

x_cExp3 = 80.5079034983587;
y_cExp3 = 120.774482330833;
rExp3 = 22.8248651971485;
sumdExp3 = 925.070695190068;

% check
checkEqual(x_cAct3, x_cExp3, tol, 9);
checkEqual(y_cAct3, y_cExp3, tol, 10);
checkEqual(rAct3, rExp3, tol, 11);
checkEqual(sumdAct3, sumdExp3, tol, 12);

end