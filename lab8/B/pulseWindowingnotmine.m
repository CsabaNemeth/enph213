function [] = pulseWindowing(x, pulse)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

figure(1)
plot(x, pulse(x), 'o', 'MarkerEdgeColor', 'red');
hold on
dataHann = hannWindow(pulse(x));
plot(x, dataHann, 'o', 'MarkerEdgeColor', 'Green')
dataTri = triangularWindow(pulse(x));
plot(x, dataTri, 'o', 'MarkerEdgeColor', 'Blue')

%curve plots

x1 = linspace(min(x),max(x), 100);
plot(x1, pulse(x1), 'MarkerEdgeColor', 'red'); %original points

xx = linspace(min(x),max(x),100); 
yy = interp1(x,dataHann,xx, 'pchip'); 
plot(xx, yy, 'MarkerFaceColor', 'Green')       %hann window

xx2 = linspace(min(x),max(x),100); 
yy2 = interp1(x,dataTri,xx2, 'pchip'); 
plot(xx2, yy2, 'MarkerFaceColor', 'Blue')      %trangular window
legend('Original', 'Hann Window', 'Triangular Window'); %legend
xlabel('x')
ylabel('f(x)')
hold off


figure(3)
cOriginal = abs(discreteCFT(pulse(x)));
plot(x, cOriginal, 'o', 'MarkerEdgeColor', 'Red');

hold on
cHann = abs(discreteCFT(dataHann));
plot(x, cHann,'o', 'MarkerEdgeColor', 'Green')
cTri = abs(discreteCFT(dataTri));
plot(x, cTri, 'o', 'MarkerEdgeColor', 'Blue');

%curve plots

xx3 = linspace(min(x),max(x),100); 
yy3 = interp1(x,cOriginal,xx3, 'pchip'); 
plot(xx3, yy3, 'MarkerEdgeColor', 'Red')  %original points

yy4 = interp1(x,cHann,xx3, 'pchip'); 
plot(xx3, yy4)  %Hann window

yy5 = interp1(x,cHann,xx3, 'pchip'); 
plot(xx3, yy5)  %Triangular window

legend('Original', 'Hann Window', 'Triangular Window'); %legend
xlabel('x')
ylabel('Fourier Coefficients')
hold off
end

