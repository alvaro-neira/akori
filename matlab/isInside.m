function [ is ] = isInside( userx, usery, objectx, objecty, width, height, offsetx, offsety )
    if userx>=objectx + offsetx && usery>=objecty + offsety && ...
            userx<=objectx + width - offsetx && usery<=objecty + height - offsety
        is=1;
    else
        is=0;
    end
end

