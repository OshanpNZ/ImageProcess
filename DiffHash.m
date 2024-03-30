function [hash] = DiffHash(greyscale)
%DiffHash takes a greyscale image and converts it into a hash using the
%Differential Hashing algorithm which compares column values with value in 
%the column to the right. It converts a m-by-(n+1) uint8 greyscale
%image array into a 1 x mn logical row vector.
%   Inputs:
%       greyscale = A uint8 array of a greyscale image with the dimensions
%                   m x (n+1)
%   Outputs:
%       hash = A logical row vector with dimensions 1 x mn that shows
%              wether the bit to the right is greater than or equal to a 
%              chosen bit or not
% Author: Oshan Premkumar

%converting greyscale to a double in order to avoid errors 
%and work with numbers more simply
greyscale = double(greyscale);

%finding the dimensions of the greyscale image array and then subtracting 1
%from the number of columns in order to get the columns that are being used
[m,n1] = size(greyscale);
n = n1 -1;

%creating the hash vector to assign values from the comparisson 
hash = zeros(1,m*n);

%setting up the position where values can be assigned to the hash vector
%after being compared
hash_position = 1;

%for loop to go through each row of the greyscale array
for i = 1:m

    %for loop to go through each column of the greyscale array excluding
    %the last column 
    for j = 1:n

        %if statement that checks if the pixel value to the right is 
        %greater than or equal to the pixel value to the left
        if greyscale(i,j) >=  greyscale(i,j+1)
           
            %if the if statement is true then a value of 1 is assigned to
            %the differential hash vector
            hash(hash_position) = 1;

            %equation moves hash vector position to the next position
            hash_position = hash_position + 1;

        else

            %if the pixel value to the left is lower than the one to the
            %right then value in hash vector remains as 0 and hash vector
            %position moves to the next position
            hash_position = hash_position + 1;

        end
    end
end

%changing the hash vector from a double to a logical vector
hash = logical(hash);

end