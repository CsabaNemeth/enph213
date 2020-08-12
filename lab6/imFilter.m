function [imNew] = imFilter(imOrig, kernel)
% Filtered Image Matrix imNew = imFilter(imOrig, kernel)
% Written By: Csaba Nemeth
% Since: 24/02/2019
% imFilter takes a matrix imOrig (m,n) in uint8 format and a matrix kernel with
% dimension (p, q) where p < m and q < n. The function returns a uint8
% matrix imNew of dimensions (m,n), upon which the convolution kernel has
% been applied. This is done by padding the edges of the input image with
% zeros, then looping through rows/columns starting from within the padded
% edge. A sub-matrix is extracted at each iteration that is size (p,q), the
% kernel is applied and the ouput is read into the imNew matrix.

    %Declare new image with size (m, n).
    imNew = zeros(size(imOrig));
    
    %Find kernel dimensions.
    kernel_rows = size(kernel, 1);
    kernel_cols = size(kernel, 2);
    
    %Find the overhang of the kernel when centered on imOrig(1, 1).
    row_overhang = floor(kernel_rows/2);
    col_overhang = floor(kernel_cols/2);
    
    %Specify array defining the size of padding in the rows and columns.
    padArray = [row_overhang, col_overhang];
    
    %Using the matlab function padarray, pad the original image with zeros,
    %with an overhang specified by padArray. 'both' specifies that all
    %sides of the array should be padded.
    imOrig = padarray(imOrig, padArray, 0, 'both');
    
    %Loop through padded array, skipping the padded portion on each side.
    for row = (row_overhang + 1):size(imOrig, 1) - row_overhang
        for col = (col_overhang + 1):size(imOrig,2) - col_overhang
            
            %Extract Kernel Sized Sub Matrix from original image.
            subMat = imOrig(row - row_overhang : row + row_overhang, col - col_overhang : col + col_overhang);
            
            %Apply kernel to subMatrix, need to force subMat (of native
            %type uint8 into type double.
            newVal = sum(sum(double(subMat) .* (kernel)));
            
            %Apply new value to image location.
            imNew(row - row_overhang ,col - col_overhang) = newVal;
            
        end %End column for loop.
        
    end %End row for loop.

    %Force uint8 type for output image.
    imNew = abs(imNew);
    imNew = imNew -min(min(imNew));
    imNew = (imNew/max(max(imNew))).*255;
    imNew = uint8(imNew);
   
end %End function imFilter(...).





