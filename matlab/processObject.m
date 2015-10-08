function [ nviews ] = processObject( userx, usery, objectx, objecty, width, height, offsetx, offsety )
    if ~isvector(userx) || ~isvector(usery)
        error('Input must be a vector')
    end
    nviews=0;
    for i=1:length(userx)
        if isInside(userx(i),usery(i),objectx, objecty, width, height, offsetx, offsety )
            nviews=nviews+1;
        end
    end
    
end

