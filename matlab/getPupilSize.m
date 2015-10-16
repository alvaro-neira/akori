function [ timestamp_double, pupil_area_filtered ] = getPupilSize( subjectId )
    [ maxx, datapath, url_prefix, xoffsets, yoffsets, maxy, ...
    filelist, filelist2,questionlist, ms, coordinates_path, ...
    focusThreshold, minDepth, maleWebsites,maleSubjects,femaleWebsites,...
    femaleSubjects,neutralWebsites,allSubjects, allWebsites, eeglist, ...
    eegStartTimes] = hardCodedData( );

    filename = strcat(datapath,char(filelist(subjectId)));

    [timestamp,frame_number,gaze_x,gaze_y,pupil_axis1,pupil_axis2,...
        pupil_area,saccade,blink] = importVision(filename);
   
    original_pupil_area = pupil_area;
    pupil_area_interpolated=pupil_area;
    nrows=length(timestamp);

    %%%%%%%%%%%%%%%%%%%%%%%%%%
    %% Interpolate NaN/zeros
    %%%%%%%%%%%%%%%%%%%%%%%%%%
    tpupil_area = (abs(pupil_area) >= eps);

    % Next, find the starting indices, ending indices, and duration of each string of zeroes
    % using the function DIFF and FIND:
    dpupil_area = diff([1; tpupil_area; 1]);
    startIndex = find(dpupil_area < 0);
    endIndex = find(dpupil_area > 0)-1;
    duration = endIndex-startIndex+1;

    %Then, find the strings of zeroes with a duration greater than or equal to some value (such as 3, from your example):
    stringIndex = (duration >= 1);
    startIndex = startIndex(stringIndex);
    endIndex = endIndex(stringIndex);
    
    %Finally, use the method from my answer to the linked question to generate your final set of indices:
    indices = zeros(1,max(endIndex)+1);
    indices(startIndex) = 1;
    indices(endIndex+1) = indices(endIndex+1)-1;
    indices = find(cumsum(indices));

    % generateInterpolation(firstNumber,secondNumber,Npoints)
    for i=1:length(startIndex)
        if endIndex(i)<nrows
            interpolation = generateInterpolation(pupil_area(startIndex(i)-1),pupil_area(endIndex(i)+1),duration(i)+2);
            pupil_area_interpolated(startIndex(i):endIndex(i)) = interpolation(2:end-1);
        end
    end

    %%%%%%%%%%%%%%%%%%%%%%%%%
    %% Fix saccades
    %%%%%%%%%%%%%%%%%%%%%%%%%
    saccades_list=zeros(nrows,1);
    for i=1:nrows
        s=char(saccade(i));
        if length(s) > 0 && strcmp(s(1:4),'DIR_')
            saccades_list(i)=1;
        end
    end
    saccades_indexes=find(saccades_list);
    pupil_area_fixed=pupil_area_interpolated;

    for i=1:nrows-1
        delta(i)=pupil_area_interpolated(i+1)-pupil_area_interpolated(i);
    end  

    for k=1:length(saccades_indexes)-1
        i=saccades_indexes(k);
        if i>1
            pupil_area_fixed(i)=pupil_area_interpolated(i-1);
            pupil_area_fixed(i+1)=pupil_area_interpolated(i-1);
            for j=i:saccades_indexes(k+1)-3
                pupil_area_fixed(j+2)=pupil_area_fixed(j+1)+delta(j+1);
            end
        end
    end

    %%%%%%%%%%%%%%%%%%%%%
    %% Filter
    %%%%%%%%%%%%%%%%%%%%%
    [b,a] = butter(1,0.447978365956620);
    pupil_area_filtered  = filtfilt(b,a,pupil_area_fixed);
    
    %%%%%%%%%%%%%%%%%%%%%
    %% Finally convert timestamps to MATLAB format
    %%%%%%%%%%%%%%%%%%%%%
    timestamp_double=timestamp2double(timestamp);
    
    if length(find(isnan(pupil_area_filtered)))>0
        error('Resulting vector has one or more NaNs in it');
    end
    clearvars -except timestamp_double pupil_area_filtered

end

