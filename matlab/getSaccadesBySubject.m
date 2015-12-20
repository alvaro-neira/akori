function [ saccadeCounter ] = getSaccadesBySubject( userNumber, websites )
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
    global navfilelist;
    global visionfilelist;
  
    saccadeCounter=0;
    for k=1:length(websites)

        qid=websites(k);

        [page_id,url,picture,coordinates_file] = findByPageId(qid);
        navfile = strcat(datapath,char(navfilelist(userNumber)));
        [ts_nav,scrollTop,user_url] = importProcessedNav(navfile);
        [ ts_gaze, pupil_area_filtered, gaze_x, gaze_y, saccade, blk ] = getVisionData( userNumber );
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
    
end