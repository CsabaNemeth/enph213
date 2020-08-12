function [] = test_findJacobianCirc()
%[] = test_findJacobianCirc()
% Written by: Tristan Fleming
% tests the findJacobianCirc function for edge points from one of the
% sample tablet images

load('tabletImagesSobel');

% Non zero values in edge array are "found" and indexed into x_edge and
% y_edge
[x_edge, y_edge] = find(tabletImgSobelExp1);

x_c = 80;
y_c = 120;
r = 23.5;

% actual value
jacobianAct = findJacobianCirc(x_c, y_c, r, x_edge, y_edge);

% expect value
jacobianExp = [286.771045395184,0.748721398953952,-6.86375089171539;
    0.748721399261854,274.614761157939,69.9218812595603;
    -6.86375089129498,69.9218812628229,561.999999999543];

% tolerance
tol = 0.0001;

% check
checkEqual(jacobianAct, jacobianExp, tol, 1);


end

