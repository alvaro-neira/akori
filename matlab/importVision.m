function [timestamp,frame_number,gaze_x,gaze_y,pupil_axis1,pupil_axis2,pupil_area,saccade,blink] = importVision(filename)
%IMPORTFILE Import numeric data from a text file as column vectors.
%   [TIMESTAMP,FRAME_NUMBER,GAZE_X,GAZE_Y,PUPIL_AXIS1,PUPIL_AXIS2,PUPIL_AREA,SACCADE,BLINK]
%   = IMPORTFILE(FILENAME) Reads data from text file FILENAME for the
%   default selection.
%
%   [TIMESTAMP,FRAME_NUMBER,GAZE_X,GAZE_Y,PUPIL_AXIS1,PUPIL_AXIS2,PUPIL_AREA,SACCADE,BLINK]
%   = IMPORTFILE(FILENAME, STARTROW, ENDROW) Reads data from rows STARTROW
%   through ENDROW of text file FILENAME.
%
% Example:
%   [timestamp,frame_number,gaze_x,gaze_y,pupil_axis1,pupil_axis2,pupil_area,saccade,blink] = importfile('vision.csv',2, 16626);
%
%    See also TEXTSCAN.

% Auto-generated by MATLAB on 2015/10/04 23:59:04
    if ~exist(filename, 'file')
        error('csv file does not exist');
    end
%% Initialize variables.
delimiter = ',';
startRow = 2;
endRow = inf;

%% Format string for each line of text:
%   column1: text (%s)
%	column2: double (%f)
%   column3: double (%f)
%	column4: double (%f)
%   column5: double (%f)
%	column6: double (%f)
%   column7: double (%f)
%	column8: text (%s)
%   column9: text (%s)
% For more information, see the TEXTSCAN documentation.
formatSpec = '%s%f%f%f%f%f%f%s%s%[^\n\r]';

%% Open the text file.
fileID = fopen(filename,'r');

%% Read columns of data according to format string.
% This call is based on the structure of the file used to generate this
% code. If an error occurs for a different file, try regenerating the code
% from the Import Tool.
dataArray = textscan(fileID, formatSpec, endRow(1)-startRow(1)+1, 'Delimiter', delimiter, 'EmptyValue' ,NaN,'HeaderLines', startRow(1)-1, 'ReturnOnError', false);
for block=2:length(startRow)
    frewind(fileID);
    dataArrayBlock = textscan(fileID, formatSpec, endRow(block)-startRow(block)+1, 'Delimiter', delimiter, 'EmptyValue' ,NaN,'HeaderLines', startRow(block)-1, 'ReturnOnError', false);
    for col=1:length(dataArray)
        dataArray{col} = [dataArray{col};dataArrayBlock{col}];
    end
end

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


