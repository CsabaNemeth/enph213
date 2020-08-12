function [] = test_setBoxAndPlates()
%[] = test_setBoxAndPlates()
% Written by: David DeVries
% tests the setBoxAndPlates function with the geometry outlined in the lab
% write-up

% Actual
Vact = rand(41,41); %random numbers to make sure only plates are updated
Vexp = Vact;

Vact = setBoxAndPlateVoltages(Vact,...
    10, 25, 20, 10,...
    10, 15, 20, -10);

% Expect
Vexp(1:end,1) = 0;
Vexp(1:end,end) = 0;
Vexp(1,1:end) = 0;
Vexp(end,1:end) = 0;

Vexp(16,11:31) = 10;
Vexp(26,11:31) = -10

% tolerance
tol = 0;

% check
checkEqual(Vact, Vexp, tol, 1);

end

