function plotDiscreteFT(x, f_x)
%FIGURE plotDiscreteFT(x, f_x)
%Written By: Csaba Nemeth
%Version Since: 2020-03-09
%
%Calculates and plots the discrete fourier transform from the array of
%sampled points f_x against the sampled values f_x at x. Array x and f_x
%must be of the same length.

    %Find number of points N
    N = length(f_x);

    %Find fourier transfrom of f_x.
    [a, b] = discreteFT(f_x);

    %Construct fourier function
    fourier = zeros(1, N*100);
    
    %Construct x value to plot fourier transform with.
    x_f = linspace(x(1), x(N), N*100);

    %Construct k values from 0 to N-1.
    k = linspace(0, N-1, N*100);

    %Evaluate fourier function at all x valiues;
    for i = 1:N*100
        %Add first element of a/2 outside of sum.
        fourier(i) = a(1)/2;
        
            %Loop through r values and compute fourier sum.
            for r = 2:length(a)
                   fourier(i) = fourier(i)...
                                + a(r)*cos(2*pi*(r-1)*k(i)/(N))...
                                + b(r)*sin(2*pi*(r-1)*k(i)/(N));
            end %End Fourier Sum Loop.
    end %End evalute fourier sum.
    
    %Plot Figure
    figure (1)
    hold on
    plot(x, f_x, 'o');
    plot(x_f, fourier);
    
    %Add labels
    legend("Sampled Data", "Fourier Expansion");
    xlabel("x [x units]");
    ylabel("y [y units]");
    
    hold off
    
end %End function.
