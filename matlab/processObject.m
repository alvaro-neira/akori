
function [ res ] = processObject( id, userx, usery, objectx, objecty, width, ...
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
    estimatedLength=33;
    res=zeros(estimatedLength,2);
    fcounter=0;
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
                    fcounter=fcounter+1;
                    res(fcounter,1)=firstts;
                    res(fcounter,2)=lastts;
                    
                end
            end
            firstts=ts_gaze(ini+length(userx));
            lastts=ts_gaze(ini);
            inFocus=0;
        end
    end
    if fcounter>0
        res=res(1:fcounter,:);
    else
        res=[];
    end
    if fcounter>estimatedLength
        disp(strcat('fcounter=',num2str(fcounter),'>estimatedLength=',num2str(estimatedLength)));
    end
end

