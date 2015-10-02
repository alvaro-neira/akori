function webObjectsTag = generateWebTag(time,xp,yp,pageTag)
    
    %web page info should contain:
    % yDeltas per page
    % objectsXY per page
    % objectsWH per page
    % objectsID per page
    load('../resources/webPageInfo.mat');
    webObjectsTag = NaN(1,length(time));
    
    for i = 1:length(time)
        currentPage = pageTag(i,:);
        webObjectsTag(i) = 0;
        
        if currentPage(1)~=0 && currentPage(2)~= 0
           
            myY = yDeltas{currentPage(1)};
            currentY = myY(currentPage(2));
            
            myObjectsXY = objectsXY{currentPage(1)};
            myObjectsWH = objectsWH{currentPage(1)};
            myObjectsID = objectsID{currentPage(1)};
            
            for j = 1:length(myObjectsXY)
                if xp(i) > myObjectsXY(j,1) && xp(i) < myObjectsXY(j,1)+myObjectsWH(j,1) && yp(i) > myObjectsXY(j,2)+currentY && yp(i) < myObjectsXY(j,2)+currentY+myObjectsWH(j,2)
                   webObjectsTag(i) = myObjectsID(j); 
                end
            end
            
        end
        
    end

end