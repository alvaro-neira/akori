function [timestamp,scrollTop,url] = importProcessedNavOld(filename)
%IMPORTFILE Import numeric data from a text file as column vectors.
%   [TIMESTAMP,SCROLLTOP,URL] = IMPORTFILE(FILENAME) Reads data from text
%   file FILENAME for the default selection.
%
%   [TIMESTAMP,SCROLLTOP,URL] = IMPORTFILE(FILENAME, STARTROW, ENDROW)
%   Reads data from rows STARTROW through ENDROW of text file FILENAME.
%
% Example:
%   [timestamp,scrollTop,url] = importfile('nav9.csv',2, 944);
%
%    See also TEXTSCAN.

% Auto-generated by MATLAB on 2015/10/18 15:15:15

%% Initialize variables.
delimiter = ',';

    startRow = 2;
    endRow = inf;
    if ~exist(filename, 'file')
        error(strcat('csv navigation file:',filename,',does not exist'));
    end

%% Format string for each line of text:
%   column1: double (%f)
%	column2: double (%f)
%   column3: text (%s)
% For more information, see the TEXTSCAN documentation.
formatSpec = '%s%f%s%[^\n\r]';

%% Open the text file.
fileID = fopen(filename,'r');

%% Read columns of data according to format string.
% This call is based on the structure of the file used to generate this
% code. If an error occurs for a different file, try regenerating the code
% from the Import Tool.
dataArray = textscan(fileID, formatSpec, endRow(1)-startRow(1)+1, 'Delimiter', delimiter, 'HeaderLines', startRow(1)-1, 'ReturnOnError', false);
for block=2:length(startRow)
    frewind(fileID);
    dataArrayBlock = textscan(fileID, formatSpec, endRow(block)-startRow(block)+1, 'Delimiter', delimiter, 'HeaderLines', startRow(block)-1, 'ReturnOnError', false);
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
timestamp = hex2num(dataArray{:, 1});
scrollTop = dataArray{:, 2};
url = dataArray{:, 3};


