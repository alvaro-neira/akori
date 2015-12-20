function intervals = web2intervals(subjectList,subjectPath,timeThresh)

    intervals = cell(length(subjectList),1);
    
    if strcmp(subjectPath(end),'/') == 1
       slash = '';
    else
        slash = '/';
    end
    
    for i = 1:length(subjectList)
       
        %load mosaicTags
        load([subjectPath slash subjectList{i} '.mat'],'time','webTagL','webTagR','pageTag');
        myLength = length(webTagL);
        myIntervals = cell(myLength,4);
        
        count = 1;
        startIndex = 1;
        endIndex = 1;
        currentPage = 1;
        currentScroll = 1;
        currentObject = 0;
        for j = 1:myLength
            
            if webTagL(j) == webTagR(j) && pageTag(j,1) == currentPage && pageTag(j,2) == currentScroll && webTagL(j) ~= 0 && webTagL(j) == currentObject
               
                endIndex = endIndex + 1;
                
            else
                
                if time(endIndex)-time(startIndex) >= timeThresh
                   myIntervals{count,1} = currentPage;
                   myIntervals{count,2} = currentScroll;
                   myIntervals{count,3} = currentObject;
                   myIntervals{count,4} = startIndex;
                   myIntervals{count,5} = endIndex;
                   count = count + 1;
                    
                end
                
                endIndex = endIndex + 1;
                startIndex = endIndex;
                currentPage = pageTag(j,1);
                currentScroll = pageTag(j,2);
                currentObject = webTagL(j);
                
            end
            
        end
        
        intervals{i} = cell2mat(myIntervals);
        
    end

end