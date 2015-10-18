function [ res ] = getFocuses( subjects, websites, focusThreshold )
    [ maxx, datapath, url_prefix, xoffsets, yoffsets, maxy, ...
    deprecated6, deprecated7,questionlist, ms, deprecated1, ...
    deprecated5, deprecated4, maleWebsites,maleSubjects,femaleWebsites,...
    femaleSubjects,neutralWebsites,allSubjects, allWebsites, eeglist, ...
    eegStartTimes, deprecated2, deprecated3, coordinates_csvs, vision_csvs, ...
    nav_csvs] = hardCodedData( );
    resCounter=1;
   
    res=zeros(length(subjects),3);
    for s=1: length(subjects)
        userNumber=subjects(s);
        userFocuses=zeros(1000,1);
        userFocusesCounter=0;

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
%                 if(depth(i)<minDepth)
%                     continue;
%                 end
                [ focusList]=processObject(object_id(i), userx,usery,x(i),y(i),width(i),height(i),...
                    xoffsets(userNumber),yoffsets(userNumber),ts_gaze,ini,focusThreshold);
                if(length(focusList)>0)
                    
                    for fl=1:length(focusList)
                        userFocuses(userFocusesCounter+fl,1)=focusList(fl);
                    end
                    userFocusesCounter=userFocusesCounter+length(focusList);
                     
                end
            end
            disp(strcat('focusThreshold=',num2str(focusThreshold),',userNumber=',num2str(userNumber),',page=',qid));
        end
        userFocuses=userFocuses(1:userFocusesCounter,:);
%         length(userFocuses)
%         userFocusesCounter
        res(resCounter,1)=length(userFocuses); %totalfocuses
        res(resCounter,2)=length(userFocuses)/length(websites); %average per page
        res(resCounter,3)=mean(userFocuses); %average ms per subject
        resCounter=resCounter+1;
      
    end
   
end

