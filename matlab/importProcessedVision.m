function [timestamp,pupil_area,gaze_x,gaze_y,saccade,blink] = importProcessedVision(filename)
    [ts,frame_number,gx,gy,pupil_axis1,pupil_axis2,pa,...
        sacc,blink182] = importVision(filename);
    timestamp=timestamp2double(ts);
    pupil_area=pa;
    gaze_x=gx;
    gaze_y=gy;
    saccade=sacc;
    blink=blink182;
end