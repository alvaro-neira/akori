addpath internal;

%% Import data from text file.
% Script for importing data from the following text file:
%
%    /Users/aneira/lalo/data/suj9/sofey_20150630.151708.864330/vision.csv
%
% To extend the code to different selected data or a different text file,
% generate a function instead of a script.

% Auto-generated by MATLAB on 2015/09/28 20:50:30

%% Initialize variables.
filename = '/Users/aneira/lalo/data/suj9/sofey_20150630.151708.864330/vision.csv';
delimiter = ',';
startRow = 2;

%% Format string for each line of text:
%   column1: text (%s)
%column2: double (%f)
%   column3: double (%f)
%column4: double (%f)
%   column5: double (%f)
%column6: double (%f)
%   column7: double (%f)
%column8: text (%s)
%   column9: text (%s)
% For more information, see the TEXTSCAN documentation.
formatSpec = '%s%f%f%f%f%f%f%s%s%[^\n\r]';

%% Open the text file.
fileID = fopen(filename,'r');

%% Read columns of data according to format string.
% This call is based on the structure of the file used to generate this
% code. If an error occurs for a different file, try regenerating the code
% from the Import Tool.
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter, 'EmptyValue' ,NaN,'HeaderLines' ,startRow-1, 'ReturnOnError', true);

%% Close the text file.
fclose(fileID);

%% Post processing for unimportable data.
% No unimportable data rules were applied during the import, so no post
% processing code is included. To generate code which works for
% unimportable data, select unimportable cells in a file and regenerate the
% script.

%% Allocate imported array to column variable names
timestamp = dataArray{:, 1};
frame_number = dataArray{:, 2};
gaze_x = dataArray{:, 3};
gaze_y = dataArray{:, 4};
pupil_axis1 = dataArray{:, 5};
pupil_axis2 = dataArray{:, 6};
pupil_area = dataArray{:, 7};
saccade = dataArray{:, 8};
blink = dataArray{:, 9};


%% Clear temporary variables
clearvars filename delimiter startRow formatSpec fileID dataArray ans;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Done Data Importing
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% pupil_area is a header of the csv file that must be provided
% eps is a MATLAB value (see http://www.mathworks.com/help/matlab/ref/eps.html)
original_pupil_area = cpyvec(pupil_area);
pupil_area_interpolated=cpyvec(pupil_area);

tpupil_area = (abs(pupil_area) >= eps);

% Next, find the starting indices, ending indices, and duration of each string of zeroes
% using the function DIFF and FIND:
dpupil_area = diff([1; tpupil_area; 1]);
startIndex = find(dpupil_area < 0);
endIndex = find(dpupil_area > 0)-1;
duration = endIndex-startIndex+1;

%Then, find the strings of zeroes with a duration greater than or equal to some value (such as 3, from your example):

stringIndex = (duration >= 1);
startIndex = startIndex(stringIndex);
endIndex = endIndex(stringIndex);
%Finally, use the method from my answer to the linked question to generate your final set of indices:

indices = zeros(1,max(endIndex)+1);
indices(startIndex) = 1;
indices(endIndex+1) = indices(endIndex+1)-1;
indices = find(cumsum(indices));


% generateInterpolation(firstNumber,secondNumber,Npoints)
for i=1:length(startIndex)
    interpolation = generateInterpolation(pupil_area(startIndex(i)-1),pupil_area(endIndex(i)+1),duration(i)+2);

    pupil_area_interpolated(startIndex(i):endIndex(i)) = interpolation(2:end-1);

end

nrows=length(timestamp);

%timestamp_fixed=timestamp;
saccades_list=zeros(nrows,1);

for i=1:nrows
    s=char(saccade(i));
    if length(s) > 0 && strcmp(s(1:4),'DIR_')
        saccades_list(i)=1;
    end
end

saccades_indexes=find(saccades_list);
pupil_area_fixed=cpyvec(pupil_area_interpolated);
plot(1:nrows,pupil_area_interpolated,'r',1:nrows,pupil_area_fixed,'b')
 
for i=1:nrows-1
    delta(i)=pupil_area_interpolated(i+1)-pupil_area_interpolated(i);
end  

% limit=100;
% for i=1:limit
%     y1(i)=original_pupil_area(i);
%     
%     y3(i)=pupil_area_interpolated(i);
% end
% plot(1:limit,y1,'r',1:limit,y3,'g');
for k=1:length(saccades_indexes)-1
    i=saccades_indexes(k);
    pupil_area_fixed(i)=pupil_area_interpolated(i-1);
    pupil_area_fixed(i+1)=pupil_area_interpolated(i-1);
    for j=i:saccades_indexes(k+1)-3
        pupil_area_fixed(j+2)=pupil_area_fixed(j+1)+delta(j+1);
    end
end



pupil_area_fixed(1:100)
plot(1:nrows,pupil_area_interpolated,'r',1:nrows,pupil_area_fixed,'b')

% [b,a] = butter(1,0.01);
   %pupil_area_interpolated  = filtfilt(b,a,pupil_area);

% plot(1:length(original_pupil_area),original_pupil_area,'r',1:length(pupil_area_interpolated),pupil_area_interpolated,'b')

%timestamp_fixed=timestamp;
%for i=1:length(timestamp)
    %s=char(timestamp(i));
    %if strcmp(s(1:4),'----')
        %timestamp_fixed(i)=cellstr(s(39:60));
    %end
%end

%timestamp_double=datenum(timestamp_fixed,'yyyymmdd.HHMMSS.FFF');
%
%plot(timestamp_double,original_pupil_area,'r',timestamp_double,pupil_area_interpolated,'b')
% plot(1:nrows,pupil_area_interpolated,'b',1:nrows,original_pupil_area,'r')
