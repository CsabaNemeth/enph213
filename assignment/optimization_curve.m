
% mass_data = zeros(1, length(1:0.01:10));
% area_data = zeros(1, length(1:0.01:10));
% distance_data = zeros(1, length(1:0.01:10));
% 
% index = 1;
% for mass = 1:0.1:10
%     
%     density = 11342; %lead
%     volume = mass/density
%     radius = (3*volume / (4*pi)) ^ (1/3);
%     mass
%     area = pi*radius*radius
%     A = (1/2)*1.225*0.05*area/mass;
%     g = 9.81 - 1.225*9.81*volume;
%     v = sqrt(10000/mass);
%     
%     [X, Y, Z, s_time, c_time] = modelTrajectory([0, 0, 0], [v/2, 0, v/2], 0, 10, 0.01, A, g, [0, 0, 0]);
%     
%     distance_data(index) = sqrt(X(length(X))^2 + Z(length(Z))^2);
%     mass_data(index) = mass;
%     area_data(index) = area;
%     
%     index = index + 1;
%     
%     
% end
% 
% figure(1)
% hold on
% title("Absolute Distance as a Function of Mass (5000 [J] Launch)");
% xlabel("Mass [kg]");
% ylabel("Distance Reached in 10 Seconds [m]");
% %grid on
% plot(mass_data, distance_data, '*');
% %plot(area_data, distance_data, '*');
% 
% 
% plot(5*ones(1, length(100:450)), (100:450), 'k--'); 
% legend("Absolute Distance", "Optimal Mass", 'location', 'west');
% 
% figure(2)
% hold on
% title("Absolute Distance as a Function of Cross Sectional Area");
% xlabel("Cross Sectional Area [m^2]");
% ylabel("Distance [m]");
% %grid on
% plot(area_data, distance_data, '*');
% plot(0.006*ones(1, length(100:450)), (100:450), 'k--'); 
% legend("Absolute Distance", "Optimal Cross Sectional Area", 'location', 'west');


