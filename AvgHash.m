function [average_hash] = AvgHash(greyscale)
%AvgHash converts a greyscale image into a logical row vector representing
%a hash and it does this by using the Average Hashing Algorithm
%   Inputs: 
%       greyscale = A m-by-n uint8 array representing a greyscale image
%   Outputs:
%       average_hash = A 1-by-mn logical row vector representing the
%                      average hash of the greyscale image
% Author: Oshan Premkumar

%changing greyscale array from uint8 to double to use mean function
greyscale = double(greyscale);

%finding average pixel value of the greyscale image
average_pixel = mean(greyscale,"all");

%rounding the average pixel value to the nearest integer
average_pixel = round(average_pixel);

%finding size of image array
[m,n] = size(greyscale);

%creating the output array 
average_hash = zeros(1,m*n);

%setting up position of where logic values are going to be entered in output vector
average_hash_pos = 1;

%for loop to go through each row of image array
for i = 1:m

    %for loop to go through each column of image array
    for j = 1:n
        
        %if statement to see if each pixel is greater or equal than the average
        if greyscale(i,j) >= average_pixel

            %assigning a logical 1 to output array if it is greater than average
            average_hash(average_hash_pos) = true;

            %adding one to output vector poistion
            average_hash_pos = average_hash_pos + 1;

        %if pixel is lower than average pixel value 
        else
            %leave 0 in output array and move to next position of output vector
            average_hash_pos = average_hash_pos + 1;

        end
    end
end

%changing output array to a logical vector
average_hash = logical(average_hash);


end