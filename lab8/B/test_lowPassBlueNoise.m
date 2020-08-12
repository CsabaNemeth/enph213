close all
data = load('taskB3_sampleDataNoisy.mat');

f_x = data.f_x;
N = length(f_x);
x = [0:N-1];
freq_c = 1.5;
plot(x,f_x);

f_xFiltered = lowPassBlueNoisenotmine(x,f_x,freq_c);

hold on
plot(x,f_xFiltered)