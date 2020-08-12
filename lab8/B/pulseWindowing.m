function [] = pulseWindowing(x,pulse)
%Created by: Alexander Shaw

%Calculate the values for the pulse function across the original x value
%and an x range over 1000 values
y = pulse(x);
X = linspace(min(x), max(x), 1000);
Y = pulse(X);

%Calculates the Hann windowing 
Hann =  hannWindow(y);
Hmax = max(Hann);
Hmin = min(Hann);
HY = hannWindow(Y);

%Calcultes the Triangular windowing 
Tri = triangularWindow(y);
Tmax = max(Tri);
Tmin = min(Tri);
TY = triangularWindow(Y);

%Caculates the error on the different data sets 
dorig = abs(y - y);
dHann = abs(Hann - y);
dTri = abs(Tri - y);
Dorig = abs(Y- Y);
Dhann = abs(HY - Y);
Dtri = abs(TY - Y);

%Calculates the Fourier Coefficients for each data set
c = abs(discreteCFT(pulse(x)));
cHann = abs(discreteCFT(Hann));
cTri = abs(discreteCFT(Tri));

%Plots the original data, the Hann, and Triangular WIndowing 
figure(1);
hold on
plot(x, y, 'ro');
plot(x,Hann, 'bo');
plot(x,Tri, 'go');
plot(X,Y, 'r');
plot(X,HY, 'b');
plot(X,TY, 'g');
legend('Original Data','Hann Window','Triangular Window')
xlabel('x');
ylabel('y');
hold off

%Plots the diviation from the original data set for each data set
figure(2)
plot(x,dorig,'o');
hold on
plot(x,dHann,'o');
plot(x,dTri,'o');
plot(X,Dorig);
plot(X,Dhann);
plot(X,Dtri);
legend('Original Data','Hann Window','Triangular Window')
xlabel('x');
ylabel('Absolute Error');
hold off

%Plots the magnitude of the Fourier coefficients 
figure(3)
plot(x, c, 'o');
hold on
plot(x, cHann,'o');
plot(x, cTri, 'o');
yint = interp1(x,c,X, 'pchip'); 
plot(X, yint)
Hannint = interp1(x,cHann,X, 'pchip'); 
plot(X, Hannint);
TriInt = interp1(x,cHann,X, 'pchip'); 
plot(X, TriInt) 
legend('Original Data', 'Hann Window', 'Triangular Window');
xlabel('x');
ylabel('Fourier Coefficients');
hold off

end 