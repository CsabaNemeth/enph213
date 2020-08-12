function V = solveLaplace(boxWidth, boxHeight, topPlateX, topPlateY, topPlateL, topPlateV,botPlateX, botPlateY, botPlateL, botPlateV)
%VOLTAGES V = solveLaplace(boxWidth, boxHeight, topPlateX, topPlateY, topPlateL, topPlateV,botPlateX, botPlateY, botPlateL, botPlateV)
%Written By: Csaba Nemeth
%
%Solves Laplace's equation for the given geometry of parrallel plates
%inside grounded box. Returns a grid containing voltages V.

%Initialize grid with dimensions. Assume each point begins at zero
%potential.
V = zeros(boxHeight,boxWidth);

%Set up boundary conditions.
V = setBoxAndPlateVoltages(V, topPlateX, topPlateY, topPlateL, topPlateV,botPlateX, botPlateY, botPlateL, botPlateV);

%Tested through multiple runs and 700 iterations proved succesfful to pass.
%Solve the grid 600 times, using the contribution of the surrounding points
%to solve each corresponding point.
for k = 1:600
    %Solve each point in the grid, after each iteration reset boundary
    %conditions.
    for row = 2:boxHeight-1
        for col = 2:boxWidth-1
            V(row, col) = 1/4*(V(row-1,col)+V(row+1,col)+V(row,col-1)+V(row, col+1));
            V = setBoxAndPlateVoltages(V, topPlateX, topPlateY, topPlateL, topPlateV,botPlateX, botPlateY, botPlateL, botPlateV);
        end
    end   
end

end %End function solveLaplace(...)


