function [] = RankSimilarity(fingercompare,filenames,fingerprints,fingerdisp)
%RankSimilarity compares multiple images to a single image to and displays a ranking in order from
%the most simillar image to the most different and is compared through the image fingerprints.  
%   Inputs:
%       fingercompare = A 1-by-64 logical vector of the image fingerprint
%                       that the other image fingerprints will be compared to
%       filenames = A string array of unknown length with a list of names
%                   of different image files that will be compared to fingercompare
%       fingerprints = A cell array of unknown length with the fingerprints
%                      of the images in the filenames array
%       fingerdisp = an integer that tells us how many fingerprints should
%                    be displayed starting from the one most simillar to fingercompare
%   Outputs:
%       No function output however ranking, hamming distance and file name
%       will be displayed. Display is a list from most simillar image to least simillar
%   Author: Oshan Premkumar

%finding how many images we are comparing to the given image
fingernum = length(fingerprints);

%Creating an array for the Hamming number + filename and 
%one just for hamming distance so we are able to match them up later
hammingarray = {};
hammingnum = [];

%for loop to get hamming distance of every image and to store into arrays
for i = 1:fingernum

    %finding Hammng distance for each image using HammingDistance function
    %and storing into a vector
    hammingnum(i) = HammingDistance(fingercompare,fingerprints{i});

    %covnerting Hamming distance to string to concatonate with filename
    hammingnumstr = num2str(hammingnum(i));

    %if statement to add a space before Hamming distance if it is below in order 
    %for it to order for single digits to be cosidered smaller double digits
    if hammingnum(i) < 10 
        hammingnumstr = " "+ hammingnumstr;
    end

    %If statement to store array position with two spaces if array position is one digit 
    %and one space if two digits so it takes position 1-9 as earlier than position 10+
    if i < 10 
        %storing Hamming distance with file name and array position to
        %break ties (two spaces)
        hammingarray{i} = hammingnumstr +"  "+ i +"-"+filenames(i);

    %else statement to do same as line above but add only one space before 
    %array position if it is two digits 
    else
        hammingarray{i} = hammingnumstr +" "+ i +"-"+filenames(i);
    end

    
    %covnerting the string to an array to be able to extract easily later
    hammingarray{i} = char(hammingarray{i});
end

%Sorting both arrays from lowest to highest hamming distance. 
%Ensures images are also sorted in order.
hammingnum = sort(hammingnum);
hammingarrayorder = sort(hammingarray);

%for loop to display the ranking up until the last desired ranking
for k = 1:fingerdisp

    %finding the start of the file name where the - is and the end of it
    %from the HammingArrayOrder array
    filenamestart = strfind(hammingarrayorder{k},'-');
    filenameend = length(hammingarrayorder{k});


    %if statement so if the rankings end at 9th which means the ranking
    %number only aligns in one column 
    if fingerdisp < 10
            
        %displaying the images ranking in order with the Hamming distance 
        %and filename with Hamming Distance being right-justified
        disp(sprintf('%1i. %2i - %s',k,hammingnum(k),hammingarrayorder{k}(filenamestart+1:filenameend)));
       
    %if the rankings go past 9th, the ranking number takes up two spaces
    else
       
        %displaying the images ranking in order with the Hamming distance
        %and filename with both ranking and Hamming Distance being right-justified
        disp(sprintf('%2i. %2i - %s',k,hammingnum(k),hammingarrayorder{k}(filenamestart+1:filenameend)));
   
    end
    
end


end