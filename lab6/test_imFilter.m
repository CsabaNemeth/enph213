function [] = test_imFilter()
%[] = test_imFilter()
% Written by: Tristan Fleming
% Tests the function imFilter

% Import test image and expected filtered images
load('testTabletImage_PB.mat');

% Test convolution kernels
kernel1 = [0 0 0; 0 1 0; 0 0 0];
kernel2 = [4 0 0; 0 0 0; 0 0 -4];
kernel3 = (1/16).*[1 2 1; 2 4 2; 1 2 1];
kernel4 = (1/256).*[1 4 6 4 1; 4 16 24 16 4; 6 24 36 24 6; 4 16 24 16 4; 1 4 6 4 1];
kernel5 = [1; 0; -1];
kernel6 = [1 0 -1];

% Check tolerance
tol = 0.1;

imNew1Act = imFilter(tabletImgBW, kernel1);
imNew2Act = imFilter(tabletImgBW, kernel2);
imNew3Act = imFilter(tabletImgBW, kernel3);
imNew4Act = imFilter(tabletImgBW, kernel4);
imNew5Act = imFilter(tabletImgBW, kernel5);
imNew6Act = imFilter(tabletImgBW, kernel6);

checkEqual(imNew1Act, imNew1Exp, tol, 1);
checkEqual(imNew2Act, imNew2Exp, tol, 2);
checkEqual(imNew3Act, imNew3Exp, tol, 3);
checkEqual(imNew4Act, imNew4Exp, tol, 4);
checkEqual(imNew5Act, imNew5Exp, tol, 5);
checkEqual(imNew6Act, imNew6Exp, tol, 6);
     
end