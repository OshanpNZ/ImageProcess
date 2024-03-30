function [fingerprint] = ImageFingerprint(colourimage,hash,nearestbox)
%ImageFingerprint converts a colour image array into a 64-bit image
%fingerprint by first converting it to a greyscale image, resizing and then
%using 1 of 2 hash functions.
%   Inputs:
%       colourimg = a uint8 array of a colour image with unknown dimensions
%       
%       hash = A character vector of either 'AvgHash' or 'DiffHash'
%              indicating which hash function to use
%       
%       nearestbox = A character vector of either 'Nearest' or 'Box'
%                    indicating which resizing function to use
%   Outputs:
%       fingerprint = A 1 by 64 logical row vector representing the input
%                     image fingerprint gained from one of two functions.
% Author: Oshan Premkumar


%Using the GreyscaleLuma function to convert the colour image uint8 array
%to a greyscale uint8 array
greyscaleimg = GreyscaleLuma(colourimage);

%If AvgHash function wanting to be used code under this if statement will
%run
if hash == "AvgHash"
    
    %Dimensions to resize greyscale image array to if AvGHash being used
    resizedim = [8,8];
    
    %if ResizeNearest function wanting to be used code under if statement
    %will run
    if nearestbox == "Nearest"

        %resizing image array to earlier dimensions using ResizeNearest
        %function
        resizedimage = ResizeNearest(greyscaleimg,resizedim);
   
    %Code under else statement will run if ResizeBox function is wanting to
    %be used
    else 
        
        %resizing image array to earlier dimensions using ResizeBox
        %function
        resizedimage = ResizeBox(greyscaleimg,resizedim);

    end

    %creating image fingerprint using AvgHash function
    fingerprint = AvgHash(resizedimage);
       
    
%If DiffHash function wanting to be used, code under else statement will
%run
else 

    %Dimensions to resize greyscale image array to if DiffHash being used
    resized_dim = [8,9];
    
    %Code under if statement will run if ResizeNearest being used 
    if nearestbox == "Nearest"
        
        %resizing image array to earlier dimensions using ResizeNearest
        %function
        resizedimage = ResizeNearest(greyscaleimg,resized_dim);
   
    %Code under else statement will run if ResizeBox function is wanting to
    %be used
    else

        %resizing image array to earlier dimensions using ResizeBox
        %function
        resizedimage = ResizeBox(greyscaleimg,resized_dim);
    end

    %creating the image fingerprint using DiffHash function
    fingerprint = DiffHash(resizedimage);

end


end