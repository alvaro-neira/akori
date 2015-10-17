[ maxx, datapath, url_prefix, xoffsets, yoffsets, maxy, ...
    filelist, filelist2,questionlist, ms, deprecated1, ...
    focusThreshold, minDepth, maleWebsites,maleSubjects,femaleWebsites,...
    femaleSubjects,neutralWebsites,allSubjects, allWebsites, eeglist, ...
    eegStartTimes, deprecated2, new_objects_path, coordinates_csvs] = hardCodedData( );

totalFocusesCounter=1;
totalFocuses=0;
avgFocusesCounter=1;

avgFocusesDurationCounter=1;

for s=1: length(allSubjects)
    userNumber=allSubjects(s);
    userFocuses=[];
    userFocusesCounter=1;
    
   for k=1:length(allWebsites)
        
        qid=allWebsites(k);

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

        [userx, useryaux, ini,navini,navend]=userNavIntersection(userNumber,qid,ts_nav,ts_gaze,user_url, url_prefix, gaze_x,gaze_y);
        [usery]=scrollAdjust(useryaux,scrollTop,ts_gaze,ts_nav,ini,navini,navend);


        for i=1:length(object_id)
            if(depth(i)<minDepth)
                continue;
            end
            [nviews, focusList]=processObject(object_id(i), userx,usery,x(i),y(i),width(i),height(i),...
                xoffsets(userNumber),yoffsets(userNumber),ts_gaze,ini);
            if(length(focusList)>0)
                for fl=1:length(focusList)
                    userFocuses(userFocusesCounter+fl,1)=focusList(fl);
                    userFocusesCounter=userFocusesCounter+1;
                end
            end
        end
        
    end
    totalFocuses=totalFocuses+length(userFocuses) 
     
end
focusThreshold
totalFocuses
res=[200 114927;
    300 91417;
    350 81838;
    400 74108;
    450 67367;
    500 61428;
    550 56404;
600 52023;
700 45085;
800 39171;
900 34607;
1000 30739;
1100 27466;
1500 18999;
2000 13006;
3000 7303;
]
%xlswrite('tuhermana.csv',res);