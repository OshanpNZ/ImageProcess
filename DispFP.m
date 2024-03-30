function [] = DispFP(fingerprint)
%DispFP displays a logical row vector in an organised format split into
%groups of 8
%   Inputs: 
%       fingerprint = A 1-by-n logical row vector from an image fingerprint
%
%   No function outputs but fingerprint is displayed
%
% Author: Oshan Premkumar

%converting a logical row vector into a double and then a string to get
%numbers in the vector and then removing any blank spaces in the vector
fingerprint = double(fingerprint);
fingerprint = num2str(fingerprint);
fingerprint = erase(fingerprint," ");

%finding the length of the fingerprint and how many numbers it is above a
%group of 8
fingerprint_length = length(fingerprint);
remainder = mod(fingerprint_length,8);

%changing the length of the fingerprint to a multiple of 8 in order for any
%lengthed fingerprint to be able to work in upcoming for loop
fingerprint(fingerprint_length+1:fingerprint_length-remainder+8) = " ";

%finding new length of the fingerprint that should be a multiple of 8
fingerprint_length = length(fingerprint);

%creating character vector to be displayed and assigning variable for how many 
%groups of 8 have been added to the displayed vector
output = '';
groupsof8 = 0;

%for loop that adds values to the character vector in groups of 8 and adds
%a space at the end of every group of 8
for i = 1:8:fingerprint_length
    
    %assigning values to the new character vector from fingerprint in groups 
    %of 8 and adding a blank space to the end of each group of 8
    output(i+groupsof8:i+7+groupsof8) = fingerprint(i:i+7);
    output(i+8+groupsof8) = ' ';
   
    %adding 1 the variable as another group of 8 values are added to the
    %displayed string
    groupsof8 = groupsof8 + 1;
end

%removing the blank space at the end of the character vector that has come from
%changing the size of the orginal string
output = strip(output);

%displaying fingerprint in form of organised character vector
disp(output);

end