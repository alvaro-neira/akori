%GENERATEMOSAICTAG Generates image number and grid number for each data
%
%   For example:
%
%   mosaicTag = generateMosaicTag(times,xp,yp,mosaicEvent,[3 3],[1600 900],[200 0])
%
%   Will generate a matrix where first column is image where data belongs
%   and second column is grid where data belongs inside that image, in case
%   shown above we asume a 3x3 grid with horizontal margins of 200 pixels
%   in a 1600x900 image (this case corresponds to akori mosaic image).
%
%   In case some data is not inside an image or grid a value 0 is returned.
%
%   For more information about inputs 
%   SEE ALSO getData getEventData
%
function mosaicTag = generateMosaicTag(index,xp,yp,mosaicEvent,picGrid,picDimensions,margins,pictureList)

    addpath internal
    
    mosaicTag = NaN(length(index),2);
  
    currentPicture = 1;
    
    xFactor = (picDimensions(1)-2*margins(1))/picGrid(1);
    yFactor = (picDimensions(2)-2*margins(2))/picGrid(2);
    
    for i = 1:length(index)
        
        if index(i) > mosaicEvent.endTimes(currentPicture)
            currentPicture = currentPicture + 1;
        end
        
        realNumber = str2numVector(pictureList{currentPicture});
        realNumber = realNumber(1);
        
        if currentPicture<length(mosaicEvent.startTimes)&&index(i) >= mosaicEvent.startTimes(currentPicture) && index(i) <= mosaicEvent.endTimes(currentPicture)
        
            if xp(i)>picDimensions(1)-margins(1) || xp(i) < 0
                nx = -1;
            else
                nx = round(((xp(i)-margins(1))/xFactor)+0.5);
            end
            
            if yp(i)>picDimensions(2)-margins(2) || yp(i) < 0
                ny = -1;
            else
                ny = round(((yp(i)-margins(2))/yFactor)+0.5);
            end
        
            if ny > 0 && nx > 0
                currentMosaic = nx + (ny - 1)*picGrid(2);
                mosaicTag(i,1) = realNumber;
                mosaicTag(i,2) = currentMosaic;
            else
                mosaicTag(i,1) = 0;
                mosaicTag(i,2) = 0;
            end
            
        else
            mosaicTag(i,1) = 0;
            mosaicTag(i,2) = 0;
        end
    end

end