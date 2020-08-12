% TEST_EGRAD test_eGrad
%   Written by: Tristan Fleming
%   Tests the function eGrad with multiple test cases

%% Test 1: Point charge at the origin

V =@(x,y,z) 1./sqrt(x.^2 + y.^2 + z.^2);

x = sqrt(2);
y = 3;
z = -1;

ExExp = x./((x.^2 + y.^2 + z.^2).^(3/2));
EyExp = y./((x.^2 + y.^2 + z.^2).^(3/2));
EzExp = z./((x.^2 + y.^2 + z.^2).^(3/2));

[ExAct, EyAct, EzAct] = eGrad(V, x, y, z);

tol = 1e-4;

checkEqual(ExAct, ExExp, tol, 1);
checkEqual(EyAct, EyExp, tol, 2);
checkEqual(EzAct, EzExp, tol, 3);

x = -2:1:2;
y = -2:1:2;
z = -2:1:2;

[XX, YY, ZZ] = meshgrid(x, y, z);

ExExp = XX./((XX.^2 + YY.^2 + ZZ.^2).^(3/2));
EyExp = YY./((XX.^2 + YY.^2 + ZZ.^2).^(3/2));
EzExp = ZZ./((XX.^2 + YY.^2 + ZZ.^2).^(3/2));

[ExAct, EyAct, EzAct] = eGrad(V, x, y, z);

checkEqual(ExAct, ExExp, tol, 4);
checkEqual(EyAct, EyExp, tol, 5);
checkEqual(EzAct, EzExp, tol, 6);