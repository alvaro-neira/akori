function [numberOfFocuses] = getNumberOfFocuses( websites, focusThreshold )
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
    global subjectWithoutET;
    global subjectWithoutEEG;
    global rng_settings;

    len1=length(allSubjects);
    len2=length(websites);
    numberOfFocuses=0;
  
    for persona=1:len1
        subjectId=allSubjects(persona);
        if subjectId == subjectWithoutET || subjectId == subjectWithoutEEG
            disp(strcat('skipping subject:',num2str(subjectId)));
            continue;
        end
      
        [ timestamp_double, pupil_area_filtered, gx, gy, sacc, blk ] = getVisionData( subjectId );
        [ ts_eeg, o1, o2 ] = getEeg( subjectId );
      
        for pregunta=1:len2
            userFocuses=getFocuses(subjectId,websites(pregunta),focusThreshold,timestamp_double,...
                pupil_area_filtered,gx,gy,sacc,blk);
            [len3 wid]=size(userFocuses);
            numberOfFocuses=numberOfFocuses+len3;
        end
    end
end

