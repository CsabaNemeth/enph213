function [] = test_Hcirc()
%[] = test_Hcirc()
% Written by: Tristan Fleming
% tests the Hcirc function for edge points from one of the
% sample tablet images

load('tabletImagesSobel');

% Non zero values in edge array are "found" and indexed into x_edge and
% y_edge
[x_edge, y_edge] = find(tabletImgSobelExp1);

x_c = 80;
y_c = 120;
r = 23.5;

% actual value
HcircAct = Hcirc(x_c, y_c, r, x_edge, y_edge);

% expect value
HcircExp = -1.32802877707461;

% tolerance
tol = 0.0001;

% check
checkEqual(HcircAct, HcircExp, tol, 1);


end

