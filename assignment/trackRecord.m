

load record;


%hold on
%[X, Y, Z, T] = modelTrajectory(20, 40, 0, 30, 0.01, 20, 0.001, 5, 0.5, 0.47, 0.1, 1.225, 9.81);
%[X, Y, Z, T] = modelTrajectory(20, 40, 0, 30, 0.01, 20, 0.01, 5, 0.5, 0.47, 0.1, 1.225, 9.81);
%[X, Y, Z, T] = modelTrajectory(20, 40, 0, 30, 0.01, 20, 0.05, 5, 0.5, 0.47, 0.1, 1.225, 9.81);
%[X, Y, Z, T] = modelTrajectory(20, 40, 0, 30, 0.01, 20, 0.1, 5, 0.5, 0.47, 0.1, 1.225, 9.81);
%[X, Y, Z, T] = modelTrajectory(20, 40, 0, 30, 0.01, 20, 0.3, 5, 0.5, 0.47, 0.1, 1.225, 9.81);

%legend("dt = 0.001", "Polynomial Fit dt = 0.001",...
    %"dt = 0.01","Polynomial Fit dt = 0.01",...
    %"dt = 0.05","Polynomial Fit dt = 0.05",...
    %"dt = 0.1","Polynomial Fit dt = 0.1",...
    %"dt = 0.3","Polynomial Fit dt = 0.3", 'location', 'best');
%xlabel("Time [s]");
%ylabel("Height (z-axis) [m]");
%title("Analysis of Trajectories: Low drag with varying timestep.");
%hold off

%NOTES: Any dt improvement after 0.01 seems to make a marginal difference
%in how the path is fitted.
record(1).az
record(1).el
[X, Y, Z] = findCartesian(record(1).az, record(1).el, record(1).pos_observ, record(1).pos_launcher);
coords1 = [X, Y, Z];
[X, Y, Z] = findCartesian(record(2).az, record(2).el, record(1).pos_observ, record(1).pos_launcher);
coords2 = [X, Y, Z];
[X, Y, Z] = findCartesian(record(3).az, record(3).el, record(1).pos_observ, record(1).pos_launcher);
coords3 = [X, Y, Z];

coords = cat(3, coords1, coords2, coords3);
[PATHS, FUNCTIONS] = findTrajectories(coords, 0.01, 2, 26);

%Test accuracy
[X1, Y1, Z1] = findCartesian(record(1).az, record(1).el, record(1).pos_observ, record(1).pos_launcher);
[X2, Y2, Z2] = findCartesian(record(2).az, record(2).el, record(1).pos_observ, record(1).pos_launcher);
[X3, Y3, Z3] = findCartesian(record(3).az, record(3).el, record(1).pos_observ, record(1).pos_launcher);
[X26, Y26, Z26] = findCartesian(record(26).az, record(26).el, record(1).pos_observ, record(1).pos_launcher);

figure(1)
hold on
grid on
num = 80;
plot3(X1(1:num), Y1(1:num), Z1(1:num), 'g*');
plot3(X26(1:num), Y26(1:num), Z26(1:num), 'r*');
plot3(X2(1:num), Y2(1:num), Z2(1:num), 'yo');
plot3(X3(1:num), Y3(1:num), Z3(1:num), 'yo');

%Construct Paths
for index = 1:80
    x26 = PATHS(1, :, index);
    y26 = PATHS(2, :, index);
    z26 = PATHS(3, :, index);
    
    xf26 = FUNCTIONS{1, 1, index};
    yf26 = FUNCTIONS{2, 1, index};
    zf26 = FUNCTIONS{3, 1, index};
    
    plot3(x26, y26, z26, 'k');
    
    xlabel("x [m]");
    ylabel("y [m]");
    zlabel("z [m]");
    
    legend("Projectile Start", "Projectile End", "Sampled Point", "Sampled Point", "Projected Path");
    
    %fplot3(xf26, yf26, zf26, [2, 26],'r-'); 
end


%%OPTIMAL TIME STEP ~0.005(s)
% dt_array = 0.01:-0.001:0.002;
% 
% abs_diff_paths = zeros(1, length(dt_array));
% abs_diff_paths_x = zeros(1, length(dt_array));
% abs_diff_paths_y = zeros(1, length(dt_array));
% abs_diff_paths_z = zeros(1, length(dt_array));
% abs_diff_funcs = zeros(1, length(dt_array));
% 
% for i = 1:length(dt_array)
%     
%     [PATHS, FUNCTIONS] = findTrajectories(coords, dt_array(i), 2, 26);
%     
%     all_paths = zeros(1, length(X26));
%     all_paths_x = zeros(1, length(X26));
%     all_paths_y = zeros(1, length(X26));
%     all_paths_z = zeros(1, length(X26));
%     all_funcs = zeros(1, length(X26));
%     
%     for k = 1:length(X26)
%         
%         %Actual Locations
%         real_x = X26(k);
%         real_y = Y26(k);
%         real_z = Z26(k);
%         
%         %Location from Path
%         path_x = PATHS(1, end, k);
%         path_y = PATHS(2, end, k);
%         path_z = PATHS(3, end, k);
%         
%         %Location from Functions
%         func_x = FUNCTIONS{1, 1, k}(26);
%         func_y = FUNCTIONS{2, 1, k}(26);
%         func_z = FUNCTIONS{3, 1, k}(26);
%         
%         all_paths(k) = sqrt((real_x - path_x)^2 + (real_y - path_y)^2 + (real_z - path_z)^2);
%         all_paths_x(k) = (real_x - path_x);
%         all_paths_y(k) = (real_y - path_y);
%         all_paths_z(k) = (real_z - path_z);
%         
%         %all_funcs(k) = sqrt((real_x - func_x)^2 + (real_y - func_y)^2 + (real_z - func_z)^2);
%         
%     end
%     
%     %Average all distances
%     abs_diff_paths(i) = sum(all_paths)/length(X26)
% %     abs_diff_paths_x(i) = sum(all_paths_x)/length(X26);
% %     abs_diff_paths_y(i) = sum(all_paths_y)/length(X26);
% %     abs_diff_paths_z(i) = sum(all_paths_z)/length(X26);
%     %abs_diff_funcs(i) = sum(all_funcs)/length(X26);
%         
% end
% 
% figure(2)
% hold on
% 
% set(gca,'xscale','log')
% plot(dt_array, abs_diff_paths);
% % plot(dt_array, abs_diff_paths_x);
% % plot(dt_array, abs_diff_paths_y);
% % plot(dt_array, abs_diff_paths_z);
% % plot(dt_array, abs_diff_funcs);
% title("Absolute Average Distance from Final Position: Two Methods");
% legend("All", "x", "y", "z");
% %legend("Solving For Points Directly", "Polynomial Interpolation", 'location', 'northwest');
% xlabel("Time-step dt [s]");
% ylabel("Absolute Distance [m]");


