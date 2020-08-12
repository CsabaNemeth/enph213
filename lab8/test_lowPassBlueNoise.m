close all
data = load('taskB3_sampleDataNoisy.mat');

f_x = data.f_x;
N = length(f_x);
x = [0:N-1];
freq_c = 1.5;
plot(x./pi,f_x);

f_xFiltered = lowPassBlueNoise(x,f_x,freq_c);

hold on
plot(x./pi,f_xFiltered)