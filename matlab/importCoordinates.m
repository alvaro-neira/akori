function [node_name,x,y,width,height,depth,has_text,id,k,object_id] = importCoordinates(filename)

%IMPORTFILE Import numeric data from a text file as column vectors.
%   [NODE_NAME,X,Y,WIDTH,HEIGHT,DEPTH,HAS_TEXT,ID,K,OBJECT_ID] =
%   IMPORTFILE(FILENAME) Reads data from text file FILENAME for the default
%   selection.
%
%   [NODE_NAME,X,Y,WIDTH,HEIGHT,DEPTH,HAS_TEXT,ID,K,OBJECT_ID] =
%   IMPORTFILE(FILENAME, STARTROW, ENDROW) Reads data from rows STARTROW
%   through ENDROW of text file FILENAME.
%
% Example:
%   [node_name,x,y,width,height,depth,has_text,id,k,object_id] = importfile('ds_eggsdesignspongecom201504in-the-kitchen-with-marnie-andrea-and-jens-deviled-eggshtml.csv',2, 338);
%
%    See also TEXTSCAN.

% Auto-generated by MATLAB on 2015/10/07 17:07:09

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
%	column10: double (%f)
% For more information, see the TEXTSCAN documentation.
formatSpec = '%s%f%f%f%f%f%f%f%f%f%[^\n\r]';

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
node_name = dataArray{:, 1};
x = dataArray{:, 2};
y = dataArray{:, 3};
width = dataArray{:, 4};
height = dataArray{:, 5};
depth = dataArray{:, 6};
has_text = dataArray{:, 7};
id = dataArray{:, 8};
k = dataArray{:, 9};
object_id = dataArray{:, 10};


