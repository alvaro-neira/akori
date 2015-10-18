function [ nfocuses ] = getNFocuses( subjects, websites, focusThreshold )
 [ maxx, datapath, url_prefix, xoffsets, yoffsets, maxy, ...
    filelist, filelist2,questionlist, ms, deprecated1, ...
    deprecated5, deprecated4, maleWebsites,maleSubjects,femaleWebsites,...
    femaleSubjects,neutralWebsites,allSubjects, allWebsites, eeglist, ...
    eegStartTimes, deprecated2, deprecated3, coordinates_csvs] = hardCodedData( );
    nfocuses=0;
    for s=1: length(subjects)
        userNumber=subjects(s);
        for k=1:length(websites)
            qid=websites(k);
            [page_id,url,picture,coordinates_file] = findByPageId(qid);
            filename = strcat(datapath,char(filelist(userNumber)));
            filename2 = strcat(datapath,char(filelist2(userNumber)));
            [timestamp2,outerWidth,outerHeight,innerWidth,innerHeight,...
                screenX,screenY,scrollTop,scrollLeft,url_id,user_url] = ...
                   importNavegacion(filename2);
            [timestamp,frame_number,gaze_x,gaze_y,pupil_axis1,pupil_axis2,...
                pupil_area,saccade,blink]=importVision(filename);
            ts_gaze=timestamp2double(timestamp);
            ts_nav=timestamp2double(timestamp2);
            [node_name,x,y,width,height,depth,has_text,id,k,object_id] = ...
                importCoordinates(char(strcat(coordinates_csvs,coordinates_file)));

            [userx, useryaux, ini,navini,navend]=userNavIntersection(userNumber,qid,ts_nav,ts_gaze,user_url, url_prefix, gaze_x,gaze_y);
            [usery]=scrollAdjust(useryaux,scrollTop,ts_gaze,ts_nav,ini,navini,navend);

            for i=1:length(object_id)

                [ focusList]=processObject(object_id(i), userx,usery,x(i),y(i),width(i),height(i),...
                    xoffsets(userNumber),yoffsets(userNumber),ts_gaze,ini,focusThreshold);
                nfocuses=nfocuses+length(focusList);
            end
            disp(strcat('focusThreshold=',num2str(focusThreshold),',userNumber=',num2str(userNumber),',page=',qid));
        end
    end
end

