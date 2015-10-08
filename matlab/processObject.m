
function [ nviews, focuses ] = processObject( id, userx, usery, objectx, objecty, width, ...
    height, offsetx, offsety, ts_gaze, ini )
[ maxx, datapath, url_prefix, xoffsets, yoffsets, maxy, filelist, ...
    filelist2,questionlist, ms, coordinates_path, focusThreshold ] = hardCodedData( );

    if ~isvector(userx) || ~isvector(usery) || ~isvector(ts_gaze)
        error('Input must be a vector')
    end
    nviews=0;
    firstts=ts_gaze(ini+length(userx));
    lastts=ts_gaze(ini);
    inFocus=0;
    focuses=[];
    fcounter=1;
    for i=1:length(userx)
         
        if isInside(userx(i),usery(i),objectx, objecty, width, height, offsetx, offsety )
            nviews=nviews+1;
            inFocus=1;
            if firstts>ts_gaze(ini+i)
                firstts=ts_gaze(ini+i);
            end
            if lastts<ts_gaze(ini+i)
                lastts=ts_gaze(ini+i);
            end
             
        else
            if inFocus
                if (lastts-firstts)>=(focusThreshold*ms)
                    focuses(fcounter)=lastts-firstts;
                    fcounter=fcounter+1;
                end
            end
            firstts=ts_gaze(ini+length(userx));
            lastts=ts_gaze(ini);
            inFocus=0;
        end
    end
    
end

