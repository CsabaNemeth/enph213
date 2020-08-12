function V = setBoxAndPlateVoltages(V, topPlateX, topPlateY, topPlateL, topPlateV,botPlateX, botPlateY, botPlateL, botPlateV)
%Voltages V = setBoxAndPlates(V, topPlateX, topPlateY, topPlateL, topPlateV,botPlateX, botPlateY, botPlateL, botPlateV)
%Written By: Csaba Nemeth
%
%Takes an grid input of V defining voltages at points. Returns the same
%grid with voltages defined at boundary conditions. Boundary conditions are
%0 on grid egdes, and elsewhere are defined by the input plate positions
%and voltages.

%Find x, and y dimensions of grid
Vdim_x = size(V, 1);

%Set edges to 0 voltage.
V(1:end,1) = 0;
V(1:end,end) = 0;
V(1,1:end) = 0;
V(end,1:end) = 0;

%Set Voltages
%For a point at y, location is at row = (V_dim[0] - y) + 1
%For a point at x, location is at col =  x + 1
topColStart = topPlateX + 1;
botColStart = botPlateX + 1;
V(Vdim_x - topPlateY, topColStart:(topColStart + topPlateL)) = topPlateV;
V(Vdim_x - botPlateY, botColStart:(botColStart + botPlateL)) = botPlateV;

end %End function setBoxAndPlateVoltages(...)

    