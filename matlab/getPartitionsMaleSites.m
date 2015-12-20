function [P, counters, numberOfFocuses] = getPartitionsMaleSites( focusThreshold, nPartitions )
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
    
    websites=maleWebsites;
    nFeatures=14;
    
    len1=length(allSubjects);
    
    len2=length(websites);
    
    numberOfFocuses=getNumberOfFocuses( websites, focusThreshold );
      
    counters=zeros(nPartitions,1);
    maxPartitionSize=ceil(numberOfFocuses/nPartitions);

    
    P=zeros(maxPartitionSize,nPartitions,nFeatures+1);
    
    rng(rng_settings);
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
            for fijacion=1:len3
                [ timestamp,pupil_area,gaze_x,gaze_y,saccade,blink ] = getETDataByTimeAndPerson( userFocuses(fijacion,1),...
                     userFocuses(fijacion,1)+1000*ms, timestamp_double,pupil_area_filtered,gx,gy,sacc,blk);
                 [ timestamp_eeg,eeg_o1,eeg_o2 ] = getEEGDataByTimeAndPerson( userFocuses(fijacion,1),...
                         userFocuses(fijacion,1)+1000*ms, ts_eeg, o1, o2);
                [ A4_o1, D4_o1, D3_o1, D2_o1, A1_o1 ] = getWaveletCoefficients( eeg_o1 );
                [ A4_o2, D4_o2, D3_o2, D2_o2, A1_o2 ] = getWaveletCoefficients( eeg_o2 );

                randN = randi(nPartitions);
                plusOne=counters(randN)+1;
                if length(find(counters < maxPartitionSize-1)) > 0
                    while plusOne > maxPartitionSize-1
                        randN = randi(nPartitions);
                        plusOne=counters(randN)+1;

                    end
                else
                    while plusOne > maxPartitionSize
                        randN = randi(10);
                        plusOne=counters(randN)+1;
          
                    end
                
                end   
               counters(randN)=plusOne;

                P(counters(randN),randN,1)=std(pupil_area);
                [ddiff, dindex]=dilatacionMaxima( pupil_area );
                P(counters(randN),randN,2)=ddiff;
                [cdiff,cindex]=contraccionMaxima(pupil_area);
                P(counters(randN),randN,3)=cdiff;
                P(counters(randN),randN,4)=min(o1);
                P(counters(randN),randN,5)=std(D2_o1);
                P(counters(randN),randN,6)=std(A1_o1);
                P(counters(randN),randN,7)=sumsqr(D2_o1);
                P(counters(randN),randN,8)=sumsqr(A1_o1);
                P(counters(randN),randN,9)=std(A4_o2);
                P(counters(randN),randN,10)=std(D2_o2);
                P(counters(randN),randN,11)=std(A1_o2);
                P(counters(randN),randN,12)=sumsqr(A4_o2);
                P(counters(randN),randN,13)=sumsqr(D2_o2);
                P(counters(randN),randN,14)=sumsqr(A1_o2);

                P(counters(randN),randN,nFeatures+1)=isHombre(subjectId);
            end
        end
        
    end
    P=P(1:max(counters),:,:);
    
end

