function plotAirfoil(x,y,M,s)
% VOID FIGURE =  plotAirfoil(x,y,M,s)
% Written by: Csaba Nemeth
%
% plotAirfoil takes in two 1D arrays of x and y values, performs a least
% squares polynomial fit to the integer order M. Plots the interpolation
% against the dataset. The first figure plots an unscaled fit, while the 
% second plot uses the scaling factor s applied to the y values.

%Call least sqaures to find coeffs.
aP = leastSquaresPoly2(x,y,M);

%Create x values and evaluate the polynomial.
xP = linspace(x(1),x(length(x)),length(x)*100);
yP = evaluateSpecialPolynomial(xP, aP);

%Figure 1
figure(1);
%Plot values.
plot(x,y,'bo');
hold on;
plot(xP,yP,'r');
plot(xP,-yP,'r');

%Add labels and title.
title("NACA FIT")
xlabel('x [x units]');
ylabel('y [y units]');
axis('equal');
legend('Sampled Data','NACA Fit');
hold off;

%Scale y values, find scaled coefficiants and evaluate polynomial.
yScaled = s.*y;
aPscaled = leastSquaresPoly2(x,yScaled,M);
yPscaled = evaluateSpecialPolynomial(xP, aPscaled);

%Figure 2
figure(2);
%Plot values.
plot(x,y,'bo');
hold on;
plot(xP,yP,'r');
plot(xP,yPscaled,'r');

%Add labels and title.
title("SCALED NACA FIT");
xlabel('x [x units]');
ylabel('y [y units]');
axis('equal');
legend('Sampled Data','NACA Fit');
hold off;

end %End Function

function yP = evaluateSpecialPolynomial(xP, aP)
% ARRAY yP = evaluateSpecialPolynomial(xPoly, aPoly)
% Written By: Csaba Nemeth
%
%Evaluetes the special polynomial defined by the coefficiants aP at the
%values xP.
yP = aP(1).*xP.^0.5;
for k = 2:length(aP)
    yP = yP + aP(k).*xP.^(k-1);
end

end %End Function.

