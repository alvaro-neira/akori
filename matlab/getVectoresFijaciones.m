function [ max_pupil_area,min_pupil_area,mean_pupil_area,std_pupil_area,...
    dMaxima,cMaxima,max_eeg_o1,min_eeg_o1,std_eeg_o1,...
    max_eeg_o2,min_eeg_o2,std_eeg_o2,std_A4_o1, std_D4_o1, std_D3_o1, std_D2_o1, std_A1_o1, energy_A4_o1, energy_D4_o1, energy_D3_o1, energy_D2_o1, energy_A1_o1, std_A4_o2, std_D4_o2, std_D3_o2, std_D2_o2, std_A1_o2, energy_A4_o2, energy_D4_o2, energy_D3_o2, energy_D2_o2, energy_A1_o2] = ...
    getVectoresFijaciones( subjects, websites, focusThreshold )
    global QMF;
    global subjectWithoutET;
    global subjectWithoutEEG;
    global ms;
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
    
    std_A4_o1=zeros(expectedFocusesSize,1);
    std_D4_o1=zeros(expectedFocusesSize,1);
    std_D3_o1=zeros(expectedFocusesSize,1);
    std_D2_o1=zeros(expectedFocusesSize,1);
    std_A1_o1=zeros(expectedFocusesSize,1);
    energy_A4_o1=zeros(expectedFocusesSize,1);
    energy_D4_o1=zeros(expectedFocusesSize,1);
    energy_D3_o1=zeros(expectedFocusesSize,1);
    energy_D2_o1=zeros(expectedFocusesSize,1);
    energy_A1_o1=zeros(expectedFocusesSize,1);
    std_A4_o2=zeros(expectedFocusesSize,1);
    std_D4_o2=zeros(expectedFocusesSize,1);
    std_D3_o2=zeros(expectedFocusesSize,1);
    std_D2_o2=zeros(expectedFocusesSize,1);
    std_A1_o2=zeros(expectedFocusesSize,1);
    energy_A4_o2=zeros(expectedFocusesSize,1);
    energy_D4_o2=zeros(expectedFocusesSize,1);
    energy_D3_o2=zeros(expectedFocusesSize,1);
    energy_D2_o2=zeros(expectedFocusesSize,1);
    energy_A1_o2=zeros(expectedFocusesSize,1);

    
                
    for persona=1:len1
        subjectId=subjects(persona);
        if subjectId == subjectWithoutET
            disp(strcat('skipping subjectWithoutET=',num2str(subjectWithoutET)));
            continue;
        end
    
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
                     userFocuses(fijacion,1)+1000*ms, timestamp_double,pupil_area_filtered,gx,gy,sacc,blk);
                nWithET=nWithET+1;
                max_pupil_area(nWithET)=max(pupil_area);
                min_pupil_area(nWithET)=min(pupil_area);
                mean_pupil_area(nWithET)=mean(pupil_area);
                std_pupil_area(nWithET)=std(pupil_area);
                [ddiff, dindex]=dilatacionMaxima( pupil_area );
                dMaxima(nWithET)=ddiff;
                [cdiff,cindex]=contraccionMaxima(pupil_area);
                cMaxima(nWithET)=cdiff;
                if subjectId == subjectWithoutEEG
                    continue;
                end
                nWithEEG=nWithEEG+1;
                [ timestamp_eeg,eeg_o1,eeg_o2 ] = getEEGDataByTimeAndPerson( userFocuses(fijacion,1),...
                    userFocuses(fijacion,1)+1000*ms, ts_eeg, o1, o2);
               
                max_eeg_o1(nWithEEG)=max(eeg_o1);
                min_eeg_o1(nWithEEG)=min(eeg_o1);
                std_eeg_o1(nWithEEG)=std(eeg_o1);
                max_eeg_o2(nWithEEG)=max(eeg_o2);
                min_eeg_o2(nWithEEG)=min(eeg_o2);
                std_eeg_o2(nWithEEG)=std(eeg_o2);
                [ A4_o1, D4_o1, D3_o1, D2_o1, A1_o1 ] = getWaveletCoefficients( eeg_o1 );
                [ A4_o2, D4_o2, D3_o2, D2_o2, A1_o2 ] = getWaveletCoefficients( eeg_o2 );

                std_A4_o1(nWithEEG)=std(A4_o1);
                std_D4_o1(nWithEEG)=std(D4_o1);
                std_D3_o1(nWithEEG)=std(D3_o1);
                std_D2_o1(nWithEEG)=std(D2_o1);
                std_A1_o1(nWithEEG)=std(A1_o1);
                energy_A4_o1(nWithEEG)=sumsqr(A4_o1);
                energy_D4_o1(nWithEEG)=sumsqr(D4_o1);
                energy_D3_o1(nWithEEG)=sumsqr(D3_o1);
                energy_D2_o1(nWithEEG)=sumsqr(D2_o1);
                energy_A1_o1(nWithEEG)=sumsqr(A1_o1);
                std_A4_o2(nWithEEG)=std(A4_o2);
                std_D4_o2(nWithEEG)=std(D4_o2);
                std_D3_o2(nWithEEG)=std(D3_o2);
                std_D2_o2(nWithEEG)=std(D2_o2);
                std_A1_o2(nWithEEG)=std(A1_o2);
                energy_A4_o2(nWithEEG)=sumsqr(A4_o2);
                energy_D4_o2(nWithEEG)=sumsqr(D4_o2);
                energy_D3_o2(nWithEEG)=sumsqr(D3_o2);
                energy_D2_o2(nWithEEG)=sumsqr(D2_o2);
                energy_A1_o2(nWithEEG)=sumsqr(A1_o2);
               
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
    
    std_A4_o1 = std_A4_o1 (1:nWithEEG,:);
    std_D4_o1 = std_D4_o1 (1:nWithEEG,:);
    std_D3_o1 = std_D3_o1 (1:nWithEEG,:);
    std_D2_o1 = std_D2_o1 (1:nWithEEG,:);
    std_A1_o1 = std_A1_o1 (1:nWithEEG,:);
    energy_A4_o1 = energy_A4_o1 (1:nWithEEG,:);
    energy_D4_o1 = energy_D4_o1 (1:nWithEEG,:);
    energy_D3_o1 = energy_D3_o1 (1:nWithEEG,:);
    energy_D2_o1 = energy_D2_o1 (1:nWithEEG,:);
    energy_A1_o1 = energy_A1_o1 (1:nWithEEG,:);
    std_A4_o2 = std_A4_o2 (1:nWithEEG,:);
    std_D4_o2 = std_D4_o2 (1:nWithEEG,:);
    std_D3_o2 = std_D3_o2 (1:nWithEEG,:);
    std_D2_o2 = std_D2_o2 (1:nWithEEG,:);
    std_A1_o2 = std_A1_o2 (1:nWithEEG,:);
    energy_A4_o2 = energy_A4_o2 (1:nWithEEG,:);
    energy_D4_o2 = energy_D4_o2 (1:nWithEEG,:);
    energy_D3_o2 = energy_D3_o2 (1:nWithEEG,:);
    energy_D2_o2 = energy_D2_o2 (1:nWithEEG,:);
    energy_A1_o2 = energy_A1_o2 (1:nWithEEG,:);

    if nWithET>expectedFocusesSize
        disp('nWithET=',nWithET,'>expectedFocusesSize=',expectedFocusesSize);
    end
    if nWithEEG>expectedFocusesSize
        disp('nWithEEG=',nWithEEG,'>expectedFocusesSize=',expectedFocusesSize);
    end

    
end

