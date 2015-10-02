function intervals = pupils2intervals(subjectList,subjectPath,timeThresh)

    intervals = cell(length(subjectList),1);
    
    if strcmp(subjectPath(end),'/') == 1
       slash = '';
    else
        slash = '/';
    end
    
    for i = 1:length(subjectList)
       
        %load mosaicTags
        load([subjectPath slash subjectList{i}],'time','mosaicTagl','mosaicTagr');
        myLength = min(length(mosaicTagl),length(mosaicTagr));
        myIntervals = cell(myLength,4);
        
        count = 1;
        startIndex = 1;
        endIndex = 1;
        currentPicture = 0;
        currentGrid = 0;
        for j = 1:myLength
            
            if mosaicTagl(j,1) == mosaicTagr(j,1) && mosaicTagl(j,1) == currentPicture && mosaicTagr(j,2) == currentGrid && currentPicture ~= 0 && currentGrid ~= 0
               
                endIndex = endIndex + 1;
                
            else
                
                if time(endIndex)-time(startIndex) >= timeThresh
                   myIntervals{count,1} =  currentPicture;
                   myIntervals{count,2} = currentGrid;
                   myIntervals{count,3} = startIndex;
                   myIntervals{count,4} = endIndex;
                   count = count + 1;
                    
                end
                
                endIndex = endIndex + 1;
                startIndex = endIndex;
                currentPicture = mosaicTagl(j,1);
                currentGrid = mosaicTagl(j,2);
                
            end
            
        end
        
        intervals{i} = cell2mat(myIntervals);
        
    end

end