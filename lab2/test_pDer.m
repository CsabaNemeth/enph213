% TEST_PDER test_pDer
%   Written by: Tristan Fleming
%   Tests the function pDer

%% Test 1: The hyperbolic paraboloid

g =@(x, y) (x.^3 + y.^5).^(1/2);

x = 1:6;

y = 0;

h1 = 0.25;
h2 = 0.25;

[dg_dx1Act, dg_dx2Act] = pDer(g, x, h1, y, h2);

dg_dx1Exp = [1.50020784943274,2.12133701814159,2.59808017849285,3.00000144107499,3.35410262443460,3.67423496138178];
dg_dx2Exp = [-0.00781377179889871,-0.00276214288681675,-0.00150351666161619,-0.000976562538795633,-0.000698771250248124,-0.000531573296732664];
tol = 1e-12;

checkEqual(dg_dx1Act, dg_dx1Exp, tol, 1);
checkEqual(dg_dx2Act, dg_dx2Exp, tol, 2);

%% Test 2 Potential for an electric dipole with unit charges at x = 1, y = 1 and x = -1

V =@(x, y, z) (1./sqrt(((x-1).^2 + (y-1).^2 + z.^2))) - (1./sqrt(((x+1).^2 + y.^2 + z.^2)));

x = 0;

y = 0;

z = -3:3;

h1 = 0.1;
h2 = 0.5;
h3 = 0.2;

[dV_dx1Act, dV_dx2Act, dV_dx3Act] = pDer(V, x, h1, y, h2, z, h3);

dV_dx1Exp = [0.0590326593645070,0.157482987461123,0.546023443363648,1.35315113143603,0.546023443363648,0.157482987461123,0.0590326593645070];
dV_dx2Exp = [0.0273498967331663,0.0677467617960706,0.192317473671554,0.360838258949575,0.192317473671554,0.0677467617960706,0.0273498967331663];
dV_dx3Exp = [-0.0126355796375332,-0.0427959962821276,-0.161373951030706,0,0.161373951030706,0.0427959962821276,0.0126355796375332];

tol = 1e-12;

checkEqual(dV_dx1Act, dV_dx1Exp, tol, 3);
checkEqual(dV_dx2Act, dV_dx2Exp, tol, 4);
checkEqual(dV_dx2Act, dV_dx2Exp, tol, 5);



