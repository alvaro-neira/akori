
function [ focuses ] = processObject( id, userx, usery, objectx, objecty, width, ...
    height, offsetx, offsety, ts_gaze, ini, focusThreshold )
global maxx;
global datapath;
global url_prefix;
global xoffsets;
global yoffsets;
global maxy;

global questionlist;
global ms;
global maleWebsites;
global maleSubjects;
global femaleWebsites;
global femaleSubjects;
global neutralWebsites;
global allSubjects;
global allWebsites;
global eeglist;
global eegStartTimes;
global coordinates_csvs;
global vision_csvs;
global nav_csvs;

    if ~isvector(userx) || ~isvector(usery) || ~isvector(ts_gaze)
        error('Input must be a vector')
    end
   
    firstts=ts_gaze(ini+length(userx));
    lastts=ts_gaze(ini);
    inFocus=0;
    focuses=[];
    fcounter=1;
    for i=1:length(userx)
         
        if isInside(userx(i),usery(i),objectx, objecty, width, height, offsetx, offsety )
            
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
                    focuses(fcounter,1)=(lastts-firstts)/ms;
                    fcounter=fcounter+1;
                end
            end
            firstts=ts_gaze(ini+length(userx));
            lastts=ts_gaze(ini);
            inFocus=0;
        end
    end
    
end

