function [] = test_Fcirc()
%[] = test_Fcirc()
% Written by: Tristan Fleming
% tests the Fcirc function for edge points from one of the
% sample tablet images

load('tabletImagesSobel');

% Non zero values in edge array are "found" and indexed into x_edge and
% y_edge
[x_edge, y_edge] = find(tabletImgSobelExp1);

x_c = 80;
y_c = 120;
r = 23.5;

% actual value
FcircAct = Fcirc(x_c, y_c, r, x_edge, y_edge);

% expect value
FcircExp = -137.298145956725;

% tolerance
tol = 0.0001;

% check
checkEqual(FcircAct, FcircExp, tol, 1);


end

