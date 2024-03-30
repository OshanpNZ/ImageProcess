function [fingerprints] = FingerprintCollection(images,hash,NearestBox)
%ImageFingerprint converts a colour image array into a 64-bit image
%fingerprint by first converting it to a greyscale image, resizing and then
%using 1 of 2 hash functions.
%   Inputs:
%       images = A string array of unknown length of different image filenames 
%       
%       hash = A character vector of either 'AvgHash' or 'DiffHash'
%              indicating which hash function to use
%       
%       NearestBox = A character vector of either 'Nearest' or 'Box'
%                    indicating which resizing function to use
%   Outputs:
%       fingerprints = A column cell array with each row having the
%                      fingerprint for one image from the input string array
% Author: Oshan Premkumar

%creating the output fingerprints cell array
fingerprints = {};

%finding how many images are stored in the input array
Num_img = length(images);

%for loop to go through each image of the input array
for i = 1:Num_img
    
    %getting the uint8 array from each image of the input string array
    imagearray = imread(images(i));
    
    %getting the fingerprint for each image and assigning it to the correct space in the output cell array
    fingerprints{i,1} = ImageFingerprint(imagearray,hash,NearestBox);
end

end