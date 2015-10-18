function [ nfocuses ] = getNFocuses( subjects, websites, focusThreshold )
    global maxx;
global datapath;
global url_prefix;
global xoffsets;
global yoffsets;
global maxy;

global questionlist;
global ms;
global maleWebsites;
global maleSubjects;
global femaleWebsites;
global femaleSubjects;
global neutralWebsites;
global allSubjects;
global allWebsites;
global eeglist;
global eegStartTimes;
global coordinates_csvs;
global vision_csvs;
global nav_csvs;
    nfocuses=0;
    for s=1: length(subjects)
        userNumber=subjects(s);
        for k=1:length(websites)
            qid=websites(k);
            [page_id,url,picture,coordinates_file] = findByPageId(qid);
            filename = strcat(vision_csvs,'vision',num2str(userNumber),'.csv');
            filename2 = strcat(nav_csvs,'nav',num2str(userNumber),'.csv');
            [ts_nav,scrollTop,user_url] = importProcessedNav(filename2);
            [ts_gaze,pupil_area,gaze_x,gaze_y,saccade] = importProcessedVision(filename);
         
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

