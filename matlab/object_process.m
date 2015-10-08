
[ maxx, datapath, url_prefix, xoffsets, yoffsets, maxy, filelist, ...
    filelist2,questionlist, ms, coordinates_path, focusThreshold, minDepth, ...
    maleWebsites, maleSubjects] = hardCodedData( );
for k=1:length(maleWebsites)
    qid=maleWebsites(k);
    
    [page_id,url,picture,coordinates_file] = findByPageId(qid);
    for userNumber=1:length(maleSubjects)
        filename = strcat(datapath,char(filelist(userNumber)));
        filename2 = strcat(datapath,char(filelist2(userNumber)));
        [timestamp2,outerWidth,outerHeight,innerWidth,innerHeight,screenX,...
                screenY,scrollTop,scrollLeft,url_id,user_url] = importNavegacion(filename2);
        [timestamp,frame_number,gaze_x,gaze_y,pupil_axis1,pupil_axis2,pupil_area,saccade,blink]=importVision(filename);
        ts_gaze=timestamp2double(timestamp);
        ts_nav=timestamp2double(timestamp2);
        [node_name,x,y,width,height,depth,has_text,id,k,object_id] = ...
            importCoordinates(char(strcat(coordinates_path,coordinates_file)));

        [userx, useryaux, ini,navini,navend]=userNavIntersection(userNumber,qid,ts_nav,ts_gaze,user_url, url_prefix, gaze_x,gaze_y);
        [usery]=scrollAdjust(useryaux,scrollTop,ts_gaze,ts_nav,ini,navini,navend);


        for i=1:length(object_id)
            if(depth(i)<minDepth)
                continue;
            end
            [nviews, focusList]=processObject(object_id(i), userx,usery,x(i),y(i),width(i),height(i),...
                xoffsets(userNumber),yoffsets(userNumber),ts_gaze,ini);
             if(length(focusList)>0)
            focusList
            length(focusList)
             end
        end
    end
end