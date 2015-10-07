function [ output_args ] = gazeBySubject( filecounter )
    [ maxx, datapath, url_prefix, xoffsets, yoffsets, maxy, filelist, filelist2 ] = hardCodedData();
    filename = strcat(datapath,char(filelist(filecounter)));
    filename2 = strcat(datapath,char(filelist2(filecounter)));
    [timestamp,frame_number,gaze_x,gaze_y,pupil_axis1,pupil_axis2,pupil_area,saccade,blink]=importVision(filename);
    nrows=length(timestamp);
    [timestamp2,outerWidth,outerHeight,innerWidth,innerHeight,screenX,...
        screenY,scrollTop,scrollLeft,url_id,user_url] = importNavegacion(filename2);
    ts_nav=timestamp2double(timestamp2);
    ts_gaze=timestamp2double(timestamp);
    gazeByQuestion('ds_london', ts_nav, ts_gaze, user_url, url_prefix, ...
        maxx, maxy, gaze_x, gaze_y, xoffsets(filecounter), yoffsets(filecounter), ...
        scrollTop, datapath );
    

end

