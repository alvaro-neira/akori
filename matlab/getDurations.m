function [ res ] = getDurations( subjects, websites, focusThreshold )
   [ maxx, datapath, url_prefix, xoffsets, yoffsets, maxy, ...
        filelist, filelist2,questionlist, ms, deprecated1, ...
        deprecated5, deprecated4, maleWebsites,maleSubjects,femaleWebsites,...
        femaleSubjects,neutralWebsites,allSubjects, allWebsites, eeglist, ...
        eegStartTimes, deprecated2, deprecated3, coordinates_csvs] = hardCodedData( );

    res=[];
    c=1;
    for s=1: length(subjects)
        userNumber=subjects(s);
        durations=[];
        d=1;
        for k=1:length(websites)

            qid=websites(k);

            [page_id,url,picture,coordinates_file] = findByPageId(qid);
            filename = strcat(datapath,char(filelist(userNumber)));
            filename2 = strcat(datapath,char(filelist2(userNumber)));
            [timestamp2,outerWidth,outerHeight,innerWidth,innerHeight,screenX,...
                    screenY,scrollTop,scrollLeft,url_id,user_url] = importNavegacion(filename2);
            [timestamp,frame_number,gaze_x,gaze_y,pupil_axis1,pupil_axis2,pupil_area,saccade,blink]=importVision(filename);
            ts_gaze=timestamp2double(timestamp);

            ts_nav=timestamp2double(timestamp2);
            [node_name,x,y,width,height,depth,has_text,id,k,object_id] = ...
                importCoordinates(char(strcat(coordinates_csvs,coordinates_file)));

            [userx, usery, ini,navini,navend]=userNavIntersection(userNumber,qid,ts_nav,ts_gaze,user_url, url_prefix, gaze_x,gaze_y);
            durations(d,1)=((ts_gaze(ini+length(userx))-ts_gaze(ini))/ms)/1000;
            
            d=d+1;
        end
        res(c,1)=sum(durations)/length(websites)
        c=c+1;
    end
end

