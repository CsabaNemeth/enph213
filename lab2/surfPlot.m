function [ ] = surfPlot( f, x, y )
% SURFPLOT [] = surfPlot( f, x, y )
%   Written by: Tristan Fleming
%   inputs an inline function f and a range of x and y values and plots the
%   function f over the surface defined by those values

col=0; % initialize column loop counter
for i = 1:length(x)% loop over all the columns
    col=col+1;
    row=0; % initialize row loop counter
    for j = 1:length(y) % loop over all the rows
        row=row+1;
        XX(row,col)=x(i);   % array storing the x-coord at each grid point
        YY(row,col)=y(j);   % array storing the Y-coord at each grid point
        ZZ(row,col)=f(x(i),y(j)); % array storing the value of the function
    end
end

figure(1);
surf(XX,YY,ZZ); 
xlabel('x');
ylabel('y');
zlabel('z');
axis equal;

end


