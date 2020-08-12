function plotLeastMeanSquareFitCirc(tabletImgFilename)
% Figure = plotLeastMeanSquareFitCirc(tabletImgFilename)
% Written by: Csaba Nemeth, 20101877
% Version Since: 2020-03-0
% 
% Given a file name as a string input, plotLeastMeanSquareFitCirc
% uses tabletEdgeDetection to generate a binary filtered image matrix. 
% The function extracts the edge coordinates of the image matrix using 
% MATLAB find() and uses leastMeanSquareFitCirc to calculate
% the centre coordinates and radius of a fitted circle. 
% Plots the image and the circle fit.

%Close all current images.
close all;

%Initialize figure.
figure(1);

%Find the edges of the image.
tabletImgSobel = tabletEdgeDetection(tabletImgFilename);

%Extracte edges of the image using find().
[x_edge, y_edge] = find(tabletImgSobel);

%Create array defining the inital values for a least mean square fit.
xc_init = 115:1:125;
yc_init = 75:1:85;
r_init = 15:2:50;

%Find optimal values starting at the intial guesses. 
[xc_opt, yc_opt, r_opt, ~] = leastMeanSquareFitCirc(x_edge, y_edge, xc_init, yc_init, r_init);

%Show the resized image.
imshow(imresize(imread(tabletImgFilename), [160 240]));
hold on;

%Parameterize x and y to be a function of theta.
theta = 0:0.1:4*pi;
x = xc_opt + r_opt*cos(theta);
y = yc_opt + r_opt*sin(theta);

%Plot the paramterized circle on the image.
plot(y, x, 'r');

%Add labels and axis.
axis on
xlabel('x [pixels]');
ylabel('y [pixels]');


end %End Function.