function [timestamp,outerWidth,outerHeight,innerWidth,innerHeight,screenX,screenY,scrollTop,scrollLeft,url_id,url] = importNavegacion(filename)
%IMPORTFILE Import numeric data from a text file as column vectors.
%   [TIMESTAMP,OUTERWIDTH,OUTERHEIGHT,INNERWIDTH,INNERHEIGHT,SCREENX,SCREENY,SCROLLTOP,SCROLLLEFT,URL_ID,URL]
%   = IMPORTFILE(FILENAME) Reads data from text file FILENAME for the
%   default selection.
%
%   [TIMESTAMP,OUTERWIDTH,OUTERHEIGHT,INNERWIDTH,INNERHEIGHT,SCREENX,SCREENY,SCROLLTOP,SCROLLLEFT,URL_ID,URL]
%   = IMPORTFILE(FILENAME, STARTROW, ENDROW) Reads data from rows STARTROW
%   through ENDROW of text file FILENAME.
%
% Example:
%   [timestamp,outerWidth,outerHeight,innerWidth,innerHeight,screenX,screenY,scrollTop,scrollLeft,url_id,url] = importfile('navegacion.csv',2, 944);
%
%    See also TEXTSCAN.

% Auto-generated by MATLAB on 2015/10/05 00:43:45

    if ~exist(filename, 'file')
        error(strcat('csv navigation file:',filename,',does not exist'));
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
%	column8: double (%f)
%   column9: double (%f)
%	column10: text (%s)
%   column11: text (%s)
% For more information, see the TEXTSCAN documentation.
formatSpec = '%s%f%f%f%f%f%f%f%f%s%s%[^\n\r]';

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
timestamp = dataArray{:, 1};
outerWidth = dataArray{:, 2};
outerHeight = dataArray{:, 3};
innerWidth = dataArray{:, 4};
innerHeight = dataArray{:, 5};
screenX = dataArray{:, 6};
screenY = dataArray{:, 7};
scrollTop = dataArray{:, 8};
scrollLeft = dataArray{:, 9};
url_id = dataArray{:, 10};
url = dataArray{:, 11};


