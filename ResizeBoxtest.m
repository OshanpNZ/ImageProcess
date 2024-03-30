function [resized_img] = ResizeBox(orig_image,resize_dimension)
%ResizeBox resizes either a greyscale or RGB image to a smaller image of
%specified dimensions using the Box Sampling Algorithm
%   Inputs:
%       orig_image = A uint8 array of unknown dimensions of either a RGB
%                   colour image or a greyscale image to be resized
%       resize_dimension = 1-by-2 double array which holds the dimensions [i,j] that
%                   origimage should be resized to
%   Outputs:
%       resizedimg = uint8 array with dimensions i-by-j of the resized RGB
%                    colour image or greyscale image
% Author: Oshan Premkumar

%changing the original image array to a double to work with it easier
orig_image = double(orig_image);

%finding dimensions of the original image to be used later 
[rows,columns,layers] = size(orig_image);

%creating the final image array to insert values into
resized_img = zeros(resize_dimension(1),resize_dimension(2),layers);

%finding height of each section of original image
height_sections = rows/resize_dimension(1);

%finding width of each section of original image
width_sections = columns/resize_dimension(2);

%starting counts for the row and column edges of sections of the original image
unrounded_row_edge = 0;
unrounded_column_edge = 0;

%creating arrays for the row and column edges of sections of the original image
row_edge_array = [];
column_edge_array = [];

%starting the count of the position of where to insert each edge value into the edge arrays 
array_pos = 1;

%While loop finding row edges of sections in orginal image that equal 1 pixel in the resized image
while unrounded_row_edge <= rows + 0.01

    %if statement to round and store values in an array that do not end in .5
    if contains(num2str(unrounded_row_edge),".5000") == 0 

        %rounding unrounded values and storing them in an array
        row_edge = round(unrounded_row_edge);
        row_edge_array(array_pos) = row_edge;

    %storing values in an array for column edge if they end in .5     
    else
        row_edge_array(array_pos) = unrounded_row_edge;
    end

    %adding one to the position that it is stored in the array 
    array_pos = array_pos + 1;
    
    %adding to the unrounded edge pixel number to be used in next loop
    unrounded_row_edge = unrounded_row_edge + height_sections;
end

%resetting the position a value is being stored in an array 
array_pos = 1;

%While loop finding column edges of sections in orginal image that equal 1 pixel in the resized image
while unrounded_column_edge <= columns + 0.01

    %if statement to round and store values in an array that do not end in .5
    if contains(num2str(unrounded_column_edge),".5000") == 0
        
        %rounding unrounded values and storing them in an array
        column_edge = round(unrounded_column_edge);
        column_edge_array(array_pos) = column_edge;

    %storing values in an array for column edge if they end in .5
    else
        column_edge_array(array_pos) = unrounded_column_edge;
    end

    %adding one to the position that it is stored in the array
    array_pos = array_pos + 1;

    %adding to the unrounded edge pixel number to be used in next loop
    unrounded_column_edge = unrounded_column_edge + width_sections;
end

%for loop to go through each row of the original and resized image
for i = 1:resize_dimension(1)
    
    %for loop to go through each column of the original and resized image
    for j = 1:resize_dimension(2)

        %for loop to go through each layer of the original and resized image
        for k = 1:layers
    
            %finding the start row if the section starts with in half a pixel
            if mod(row_edge_array(i),1) ~= 0
                row_start = row_edge_array(i) + 0.5;
            
            %finding start row of a section
            else
                row_start = row_edge_array(i) + 1;

            end
            
            %finding the last row if the section ends with half a pixel
            if mod(row_edge_array(i+1),1) ~= 0
                row_end = row_edge_array(i+1) + 0.5;

            %finding end row of a section
            else
                row_end = row_edge_array(i+1);

            end

            %finding the start column if the section starts with half a pixel
            if mod(column_edge_array(j),1) ~= 0
                column_start = column_edge_array(j) + 0.5;

            %finding start column of a section
            else
                column_start = column_edge_array(j) + 1;

            end

            %finding the last column if the section ends with half a pixel
            if mod(column_edge_array(j+1),1) ~= 0
                column_end = column_edge_array(j+1) + 0.5;

            %finding end column of a section
            else
                column_end = column_edge_array(j+1);

            end
            
            %finding section of original image that corresponds to one new pixel
            sections = orig_image(row_start:row_end,column_start:column_end,k);

            %averaging the pixel value section and rounding it to an integer
            sectionavg = mean(sections,"all");
            sectionavg = round(sectionavg);
            
            %assigning the averaged pixel value to the resized image array
            resized_img(i,j,k) = sectionavg;

        end
    end
end

%converting the resized image double array into uint8 (an image array)
resized_img = uint8(resized_img);

end

            

            
                