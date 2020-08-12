function [] = test_F()
% function [] = test_F()
% Written by: David DeVries
% tests the F function that calculates the three force components of two
% magnets separated by height d

d = 0.005; % separation height

% actual
[FxAct, FyAct, FzAct] = F(d);

% expected
FxExp = 0; % pretty much 0
FyExp = 0; % pretty much 0
FzExp = 583.4351;

% tolerances
tolX = 1e-13;
tolY = 1e-13;
tolZ = 0.0001e2;

% checks
checkEqual(FxAct, FxExp, tolX, 1);
checkEqual(FyAct, FyExp, tolY, 2);
checkEqual(FzAct, FzExp, tolZ, 3);

end