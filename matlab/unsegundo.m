[ maxx, datapath, url_prefix, xoffsets, yoffsets, maxy, filelist, ...
    filelist2,questionlist, ms, coordinates_path, focusThreshold, minDepth, ...
    maleWebsites, maleSubjects, femaleWebsites,femaleSubjects,neutralWebsites] = hardCodedData( );

[timestamp,frame_number,gaze_x,gaze_y,pupil_axis1,pupil_axis2,pupil_area,saccade,blink] ...
    = importVision(strcat(datapath,char(filelist(9))));

ini=5000;
tsplot=[];
vsplot=[];
tsini=timestamp2double(timestamp(ini));
for i=1:size(timestamp)
    tsplot(i,1)=timestamp2double(timestamp(i+ini));
    vsplot(i,1)=pupil_area(i+ini);
    if timestamp2double(timestamp(i+ini))-tsini>1000*ms
        break;
    end
end

plot(tsplot,vsplot);
ylim([300 400]);