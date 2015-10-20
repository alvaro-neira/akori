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
subjects=maleSubjects;
websites=maleWebsites;
len1=length(subjects);
len2=length(websites);
focusThreshold=1000;
nfocuses=0;
expectedFocusesSize=1000;
allFocuses=zeros(expectedFocusesSize,2);
for persona=1:len1
    subjectId=subjects(persona);
    if subjectId == 8 %%TODO: handle this person without EEG
        continue;
    end
    [ timestamp_double, pupil_area_filtered, gx, gy, sacc, blk ] = getVisionData( subjectId );
    [ ts_eeg, o1, o2 ] = getEeg( subjectId );
    for pregunta=1:len2
        userFocuses=getFocuses(subjectId,websites(pregunta),focusThreshold,timestamp_double,...
            pupil_area_filtered,gx,gy,sacc,blk);
        [len3 wid]=size(userFocuses);
        for fijacion=1:len3
             [ timestamp,pupil_area,gaze_x,gaze_y,saccade,blink ] = getETDataByTimeAndPerson( userFocuses(fijacion,1),...
                 userFocuses(fijacion,2), timestamp_double,pupil_area_filtered,gx,gy,sacc,blk);
             [ timestamp_eeg,eeg_o1,eeg_o2 ] = getEEGDataByTimeAndPerson( userFocuses(fijacion,1),...
                 userFocuses(fijacion,2), ts_eeg, o1, o2);
            max(pupil_area);
            min(pupil_area);
            mean(pupil_area);
            std(pupil_area);
            dilatacionMaxima( pupil_area );
            contraccionMaxima(pupil_area);
            max(eeg_o1);
            min(eeg_o1);
            std(eeg_o1);
            max(eeg_o2);
            min(eeg_o2);
            std(eeg_o2);
            'maleSubject';
            'maleWebsite';
            nfocuses=nfocuses+1;
        end
       
    end
end
nfocuses