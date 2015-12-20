function fixMatrix = generateFixationMatrixes(fix,mosaicEvent,pictureSize)

    fixMatrix = zeros(pictureSize(1),pictureSize(2),length(mosaicEvent.startTimes));
    minLength = min(length(fix.startTimes),length(fix.endTimes));
    sfixAux = fix.startTimes(1:minLength);
    
    for pictureNumber = 1:length(mosaicEvent.startTimes)
        
        firsts = find(sfixAux >= mosaicEvent.startTimes(pictureNumber));
        firstFix = firsts(1);
        lasts = find(sfixAux < mosaicEvent.endTimes(pictureNumber));
        lastFix = lasts(end);
        
        for i = firstFix:lastFix
       
            value = fix.endTimes(i)-fix.startTimes(i);
            x = floor(fix.meanY(i))*(fix.meanY(i)>=1)+1; 
            y = floor(fix.meanX(i))*(fix.meanX(i)>=1)+1;
            
            if y > pictureSize(2)
                y = pictureSize(2);
            end
            if x > pictureSize(1)
                x = pictureSize(1);
                
            end
            
            fixMatrix(x,y,pictureNumber) = fixMatrix(x,y,pictureNumber) + value;
       
        end
    
        %Normalize fixation map
        fixMatrix(:,:,pictureNumber) = fixMatrix(:,:,pictureNumber)./max(max(fixMatrix(:,:,pictureNumber)));
    end
end