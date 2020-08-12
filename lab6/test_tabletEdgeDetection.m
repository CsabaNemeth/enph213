function [] = test_tabletEdgeDetection()
%[] = test_tabletEdgeDetection()
% Written by: Tristan Fleming
% Tests the function test_tabletEdgeDetection

% Import test image and expected filtered images
load('tabletImagesSobel.mat');

% Test tablet filenames
tabletImgFilename1 = 'tablet1.jpg';
tabletImgFilename2 = 'tablet2.jpg';
tabletImgFilename3 = 'tablet3.jpg';

% Check tolerance
tol = 0.1;

tabletImgSobelAct1 = tabletEdgeDetection(tabletImgFilename1);
tabletImgSobelAct2 = tabletEdgeDetection(tabletImgFilename2);
tabletImgSobelAct3 = tabletEdgeDetection(tabletImgFilename3);

checkEqual(double(tabletImgSobelAct1), double(tabletImgSobelExp1), tol, 1);
checkEqual(double(tabletImgSobelAct2), double(tabletImgSobelExp2), tol, 2);
checkEqual(double(tabletImgSobelAct3), double(tabletImgSobelExp3), tol, 3);
     
end