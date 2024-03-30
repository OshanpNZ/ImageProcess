function [greyscaleimg] = GreyscaleLuma(colourimg)
%GreyscaleLuma converts a given RGB image to a greyscale image by
%finding a weighted sum of each pixel from the RGB image using a given
%weighting equation
%   Inputs:
%       colourimg = a m-by-n-by-3 uint8 array representing an RGB colour
%                   image 
%   Outputs:
%       greyscaleimg = a m-by-n-by-3 uint8 array representing an greyscale
%                      image
%Author: Oshan Premkumar


%converting colourimg to a double to make it easier to work with
colourimg  = double(colourimg); 

%getting size of array of colour image
[m,n] = size(colourimg);

%creating the greyscale image array with correct dimensions
greyscaleimg = zeros(m,n);

%for loop to assign values to greyscaleimg array and to use values from
%colourimg array
for i = 1:m
    for j = 1:n

        %calculating the grey pixel value using r g b values of i, j and
        %1,2 or 3
        greyscaleimg(i,j) = colourimg(i,j,1)*0.2126 + colourimg(i,j,2)*0.7152 + colourimg(i,j,3)*0.0722;

    end

end

%converting greyscaleimg array to a uint8 which will also round any
%decimals
greyscaleimg = uint8(greyscaleimg);
        
end