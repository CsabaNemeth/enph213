function tabletImgSobel = tabletEdgeDetection(tabletImgFilename)
% Edge Defined Image tabletImgSobel = tabletEdgeDetection(tabletImgFilename)
% Written By: Csaba Nemeth
% Since: 24/02/2019
% tabletImgSobel takes a string tabletImgFilename specifying a .jpg image
% in the current directory. Returns a filtered image specifying the edges
% of the tablet. This done through a sobel convolution kernel applied to
% the image to detect large changes in pixel values. This is done in
% both the x and y dimensions, then added in quadrature. The image is resized
% to 160x240 resolution. 

    %Read image into black and white tablet.
    tablet = imread(tabletImgFilename);
    bw_tablet = rgb2gray(tablet);
    
    %Resize to 160x240 resolution.
    bw_tablet = imresize(bw_tablet, [160, 240]);
    
    %Subtract background pixel value for black and white image. Convert
    %back to uint8 after subtraction is complete.
    bw_tablet = double(bw_tablet);
    bw_tablet = abs(bw_tablet - bw_tablet(1, 1));
    bw_tablet = bw_tablet - min(min(bw_tablet));
    bw_tablet = (bw_tablet/max(max(bw_tablet))).*255;
    bw_tablet = uint8(bw_tablet);
    
    %Specify gaussian kernel to perform gaussian blurring.
    gauss_kernel = (1/256).*[1 4 6 4 1; 4 16 24 16 4; 6 24 36 24 6; 4 16 24 16 4; 1 4 6 4 1];
   
    %Specify sobel convolution kernels:
    sobel_kernel_x = [-1, 0, 1; -2, 0, 2; -1, 0, 1];
    sobel_kernel_y = [-1, -2, -1; 0, 0, 0; 1, 2, 1];
    
    %Perform 5x5 gaussian blurring using imFilter.
    gaussian_tablet = imFilter(bw_tablet, gauss_kernel);
    
    %Perform sobel edge convolutions for edge detection. This needs to be
    %done in both the x and y directions.
    sx_tablet = imFilter(gaussian_tablet, sobel_kernel_x);
    sy_tablet = imFilter(gaussian_tablet, sobel_kernel_y);
    
    %Cast filtered matrices to double from uint8.
    sx_tablet = double(sx_tablet);
    sy_tablet = double(sy_tablet);
    
    %Add sobel convolutions in quadrature.
    tabletImgSobel = sqrt(sx_tablet.^2 + sy_tablet.^2);
    
    %Subtract background pixel value for image, and convert back to uint8.
    tabletImgSobel = abs(tabletImgSobel);
    tabletImgSobel = tabletImgSobel - min(min(tabletImgSobel));
    tabletImgSobel = (tabletImgSobel/max(max(tabletImgSobel))).*255;
    tabletImgSobel = uint8(tabletImgSobel);
    
    %Binarize final image with threshold value of 0.65. Removes "blurring"
    %from the edges.
    tabletImgSobel = imbinarize(tabletImgSobel, 0.65);
    
end %End Function tabletEdgeDetection(...).
