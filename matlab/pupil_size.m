

for filecounter=1:length(filelist)
    filename = strcat(datapath,char(filelist(filecounter)));
 
    [timestamp,frame_number,gaze_x,gaze_y,pupil_axis1,pupil_axis2,...
        pupil_area,saccade,blink] = importVision(filename);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Done Data Importing
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    % pupil_area is a header of the csv file that must be provided
    % eps is a MATLAB value (see http://www.mathworks.com/help/matlab/ref/eps.html)
    original_pupil_area = pupil_area;
    pupil_area_interpolated=pupil_area;
    nrows=length(timestamp);

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

   
    %timestamp_fixed=timestamp;
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

    % limit=100;
    % for i=1:limit
    %     y1(i)=original_pupil_area(i);
    %     
    %     y3(i)=pupil_area_interpolated(i);
    % end
    % plot(1:limit,y1,'r',1:limit,y3,'g');
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

%      plot(1:nrows,pupil_area_interpolated,'r',1:nrows,pupil_area_fixed,'b')
    timestamp_double=timestamp2double(timestamp);
    [b,a] = butter(1,0.447978365956620);
    pupil_area_filtered  = filtfilt(b,a,pupil_area_fixed);
    
%     plot(timestamp_double,original_pupil_area,'g',timestamp_double,pupil_area_interpolated,'c',...
%         timestamp_double,pupil_area_fixed,'r',timestamp_double,pupil_area_filtered,'b');
%     h = zoom;
%     set(h,'Motion','horizontal','Enable','on');
    res=zeros(nrows,5);
    for r=1:nrows
        res(r,1)=timestamp_double(r);
        res(r,2)=original_pupil_area(r);
        res(r,3)=pupil_area_interpolated(r);
        res(r,4)=pupil_area_fixed(r);
        res(r,5)=pupil_area_filtered(r);
    end
    index = filecounter;
    if index>17
        index=index+1;
    end
    xlswrite(strcat(strcat('suj',int2str(index)),'.csv'),res);

end
