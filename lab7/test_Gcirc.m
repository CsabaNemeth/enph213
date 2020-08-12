function [] = test_Gcirc()
%[] = test_Gcirc()
% Written by: Tristan Fleming
% tests the Gcirc function for edge points from one of the
% sample tablet images

load('tabletImagesSobel');

% Non zero values in edge array are "found" and indexed into x_edge and
% y_edge
[x_edge, y_edge] = find(tabletImgSobelExp1);

x_c = 80;
y_c = 120;
r = 23.5;

% actual value
GcircAct = Gcirc(x_c, y_c, r, x_edge, y_edge);

% expect value
GcircExp = -174.835790374284;

% tolerance
tol = 0.0001;

% check
checkEqual(GcircAct, GcircExp, tol, 1);


end

