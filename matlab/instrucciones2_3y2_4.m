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
global navfilelist;
global visionfilelist;

hardCodedData();
websites=maleWebsites;
len1=length(maleSubjects);
len2=length(websites);
focusThreshold=1000;

for persona=1:len1
    [ timestamp_double, pupil_area_filtered, gx, gy, sacc, blk ] = getVisionData( persona );
    for pregunta=1:len2
        userFocuses=getFocuses(persona,websites(pregunta),focusThreshold,timestamp_double,...
            pupil_area_filtered,gx,gy,sacc,blk);
        [len3 wid]=size(userFocuses);
        for fijacion=1:len3
             [ timestamp,pupil_area,gaze_x,gaze_y,saccade,blink ] = getETDataByTimeAndPerson( userFocuses(fijacion,1),...
                 userFocuses(fijacion,2), timestamp_double,pupil_area_filtered,gx,gy,sacc,blk);
        end
       
    end
end