function [ max_pupil_area,min_pupil_area,mean_pupil_area,std_pupil_area,...
    dMaxima,cMaxima,max_eeg_o1,min_eeg_o1,std_eeg_o1,...
    max_eeg_o2,min_eeg_o2,std_eeg_o2] = ...
    getVectoresFijaciones( subjects, websites, focusThreshold )
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

    hardCodedData();

    len1=length(subjects);
    len2=length(websites);
   
    nWithET=0;
    nWithEEG=0;
    expectedFocusesSize=1100;
    max_pupil_area=zeros(expectedFocusesSize,1);
    min_pupil_area=zeros(expectedFocusesSize,1);
    mean_pupil_area=zeros(expectedFocusesSize,1);
    std_pupil_area=zeros(expectedFocusesSize,1);
    dMaxima=zeros(expectedFocusesSize,1);
    cMaxima=zeros(expectedFocusesSize,1);
    max_eeg_o1=zeros(expectedFocusesSize,1);
    min_eeg_o1=zeros(expectedFocusesSize,1);
    std_eeg_o1=zeros(expectedFocusesSize,1);
    max_eeg_o2=zeros(expectedFocusesSize,1);
    min_eeg_o2=zeros(expectedFocusesSize,1);
    std_eeg_o2=zeros(expectedFocusesSize,1);
    
                
    for persona=1:len1
        subjectId=subjects(persona);
        if subjectId == subjectWithoutET
            disp(strcat('skipping subjectWithoutET=',num2str(subjectWithoutET)));
            continue;
        end
        subjectId;
        [ timestamp_double, pupil_area_filtered, gx, gy, sacc, blk ] = getVisionData( subjectId );
        if subjectId ~= subjectWithoutEEG
            [ ts_eeg, o1, o2 ] = getEeg( subjectId );
        end
       
        for pregunta=1:len2
            userFocuses=getFocuses(subjectId,websites(pregunta),focusThreshold,timestamp_double,...
                pupil_area_filtered,gx,gy,sacc,blk);
            [len3 wid]=size(userFocuses);
            for fijacion=1:len3
                if subjectId == subjectWithoutET
                    error('Handle subjectWithoutET');
                end
                 [ timestamp,pupil_area,gaze_x,gaze_y,saccade,blink ] = getETDataByTimeAndPerson( userFocuses(fijacion,1),...
                     userFocuses(fijacion,2), timestamp_double,pupil_area_filtered,gx,gy,sacc,blk);
                 nWithET=nWithET+1;
                max_pupil_area(nWithET)=max(pupil_area);
                min_pupil_area(nWithET)=min(pupil_area);
                mean_pupil_area(nWithET)=mean(pupil_area);
                std_pupil_area(nWithET)=std(pupil_area);
                [ddiff, dindex]=dilatacionMaxima( pupil_area );
                dMaxima(nWithET)=ddiff;
                [cdiff,cindex]=contraccionMaxima(pupil_area);
                cMaxima(nWithET)=cdiff;
                 if subjectId ~= subjectWithoutEEG
                     nWithEEG=nWithEEG+1;
                    [ timestamp_eeg,eeg_o1,eeg_o2 ] = getEEGDataByTimeAndPerson( userFocuses(fijacion,1),...
                        userFocuses(fijacion,2), ts_eeg, o1, o2);
                
                    max_eeg_o1(nWithEEG)=max(eeg_o1);
                    min_eeg_o1(nWithEEG)=min(eeg_o1);
                    std_eeg_o1(nWithEEG)=std(eeg_o1);
                    max_eeg_o2(nWithEEG)=max(eeg_o2);
                    min_eeg_o2(nWithEEG)=min(eeg_o2);
                    std_eeg_o2(nWithEEG)=std(eeg_o2);
                 end


            end
        end
        
    end
    
    max_pupil_area=max_pupil_area(1:nWithET,:);
    min_pupil_area=min_pupil_area(1:nWithET,:);
    mean_pupil_area=mean_pupil_area(1:nWithET,:);
    std_pupil_area=std_pupil_area(1:nWithET,:);
    dMaxima=dMaxima(1:nWithET,:);
    cMaxima=cMaxima(1:nWithET,:);
    max_eeg_o1=max_eeg_o1(1:nWithEEG,1);
    min_eeg_o1=min_eeg_o1(1:nWithEEG,1);
    std_eeg_o1=std_eeg_o1(1:nWithEEG,1);
    max_eeg_o2=max_eeg_o2(1:nWithEEG,1);
    min_eeg_o2=min_eeg_o2(1:nWithEEG,1);
    std_eeg_o2=std_eeg_o2(1:nWithEEG,1);
    if nWithET>expectedFocusesSize
        disp('nWithET=',nWithET,'>expectedFocusesSize=',expectedFocusesSize);
    end
    if nWithEEG>expectedFocusesSize
        disp('nWithEEG=',nWithEEG,'>expectedFocusesSize=',expectedFocusesSize);
    end

    
end

