function [P, counters, numberOfFocuses] = getPartitionsNeutralSites( focusThreshold )
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
    websites=neutralWebsites;
    len2=length(websites);
    
    numberOfFocuses=getNumberOfFocuses( websites, focusThreshold );
      
    counters=zeros(10,1);
    maxPartitionSize=ceil(numberOfFocuses/10);

    nFeatures=17;
    P=zeros(maxPartitionSize,10,nFeatures+1);
    
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

                rand10 = randi(10);
                plusOne=counters(rand10)+1;
                if counters(1)<maxPartitionSize-1 || ...
                   counters(2)<maxPartitionSize-1 || ...
                   counters(3)<maxPartitionSize-1 || ...
                   counters(4)<maxPartitionSize-1 || ...
                   counters(5)<maxPartitionSize-1 || ...
                   counters(6)<maxPartitionSize-1 || ...
                   counters(7)<maxPartitionSize-1 || ...
                   counters(8)<maxPartitionSize-1 || ...
                   counters(9)<maxPartitionSize-1 || ...
                   counters(10)<maxPartitionSize-1 
                      

                    while plusOne > maxPartitionSize-1
                        rand10 = randi(10);
                        plusOne=counters(rand10)+1;

                    end
                else
                    while plusOne > maxPartitionSize
                        rand10 = randi(10);
                        plusOne=counters(rand10)+1;
          
                    end
                
                end   
                counters(rand10)=plusOne;

                P(counters(rand10),rand10,1)= std(D2_o1);
                P(counters(rand10),rand10,2)= std(A1_o1);
                P(counters(rand10),rand10,3)= sumsqr(D2_o1);
                P(counters(rand10),rand10,4)= sumsqr(A1_o1);
                P(counters(rand10),rand10,5)= std(A4_o2);
                P(counters(rand10),rand10,6)= std(D2_o2);
                P(counters(rand10),rand10,7)= std(A1_o2);
                P(counters(rand10),rand10,8)= sumsqr(A4_o2);
                P(counters(rand10),rand10,9)= sumsqr(D2_o2);
                P(counters(rand10),rand10,10)= sumsqr(A1_o2);
                P(counters(rand10),rand10,11)= max(pupil_area);
                P(counters(rand10),rand10,12)= min(pupil_area);
                P(counters(rand10),rand10,13)= mean(pupil_area);
                P(counters(rand10),rand10,14)= contraccionMaxima( pupil_area );
                P(counters(rand10),rand10,15)= max(o1);
                P(counters(rand10),rand10,16)= max(o2);
                P(counters(rand10),rand10,17)= std(o2);

                P(counters(rand10),rand10,nFeatures+1)=isHombre(subjectId);
            end
        end
        
    end
    P=P(1:max(counters),:,:);
end

