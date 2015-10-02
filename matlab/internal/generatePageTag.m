function pageTag = generatePageTag(time,asc)

    addpath internal
    
    %first column = page; second column = scroll number
    pageTag = NaN(length(time),2);
    
    %find every display line
    pattern = 'display(\s)(\d+)[_](\d+)';
    [displayTimes lineIndexes] = getTimesOf(pattern,asc);
    
    currentPage = [0 0];
    currentPageIndex = 0;
    
    for i = 1:length(pageTag)
        
        if  time(i) > displayTimes(currentPageIndex+(currentPageIndex<length(displayTimes)))
            currentPageIndex = currentPageIndex + (currentPageIndex<length(displayTimes));
            newNumbers = str2numVector(asc{lineIndexes(currentPageIndex)});
            currentPage(1) = newNumbers(end-1);
            currentPage(2) = newNumbers(end);
        end
        
        pageTag(i,:) = [currentPage(1) currentPage(2)];
       
    end
    

end