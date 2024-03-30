function [DifferingBits] = HammingDistance(f1,f2)
%HammingDistance compares two image fingerprints that are in the form of
%logical row vectors and finds how many values differ from each other in
%each position which determines how simillar the images are.
%   Inputs:
%       f1 = A 1-by-n logical row vector that represents the first
%            fingerprint where n is unknown
%       f2 = A 1-by-n logical row vector, where n is unknown, that represents 
%            the second fingerprint that will be compared with f1 
%   Outputs:
%       DifferingBits = An integer representing how many bits are different
%                       between the two fingerprints
% Author: Oshan Premkumar

%finding the length (n) of the logical vectors
fingerprint_length = length(f1);

%Creating the count for the number of differing bits in both fingerprints
DifferingBits = 0;

%for loop to compare each value of the logical vector
for i = 1:fingerprint_length
    
    %if statement that adds one to the count of it finds that two
    %corresponding values are different
    if f1(i) ~= f2(i)
        DifferingBits = DifferingBits + 1;
    end


end