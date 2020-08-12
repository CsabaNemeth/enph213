x = [1:14].*pi/8;
f_x = sin(2*x);
% x = 2:18;
% f_x = ones(1,length(x));

close all
f_xHann = hannWindow(f_x);
f_xTri = triangularWindow(f_x);
%plot(x,f_x,x,f_xHann,x,f_xTri)
plot(x,f_x, 'o')
hold on
plot(x,f_xHann, 'o')
plot(x,f_xTri, 'o');
legend('a','b');
hold off