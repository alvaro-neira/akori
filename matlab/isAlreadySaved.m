function [ is ] = isAlreadySaved( rect, rectangleCounter, userx, usery )
    is=0;
    for bf=1:rectangleCounter-1
        if rect(bf,1) > 0 && rect(bf,2)>0 && rect(bf,4)>0 && ...
           rect(bf,4)>0 && ...
           isInside(userx,usery,rect(bf,1),rect(bf,2),rect(bf,3),rect(bf,4))
           is=1;
           break;
        end
    end

end

