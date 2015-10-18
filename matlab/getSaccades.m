function [ res ] = getSaccades( subjects, websites )
    [ maxx, datapath, url_prefix, xoffsets, yoffsets, maxy, ...
    filelist, filelist2,questionlist, ms, deprecated1, ...
    focusThreshold, minDepth, maleWebsites,maleSubjects,femaleWebsites,...
    femaleSubjects,neutralWebsites,allSubjects, allWebsites, eeglist, ...
    eegStartTimes, deprecated2, deprecated3, coordinates_csvs] = hardCodedData( );
    res=[];
    c=1;
    for s=1: length(subjects)
        userNumber=subjects(s);
        saccadeCounter=0;
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
            
            for sac=ini:ini+length(userx)
                str=char(saccade(sac));
                if length(str) > 0 && strcmp(str(1:4),'DIR_')
                    saccadeCounter=saccadeCounter+1;
                end
            end
            
            
        end
        res(c,1)=saccadeCounter;
        res(c,2)=saccadeCounter/length(websites);
        
        c=c+1;
    end
end