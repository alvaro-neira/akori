function [ dur ] = getDuracionTotal( userNumber, websites )
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

    dur=0.0;

    for k=1:length(websites)

        qid=websites(k);

        [page_id,url,picture,coordinates_file] = findByPageId(qid);
        navfile = strcat(datapath,char(navfilelist(userNumber)));
        [ts_nav,scrollTop,user_url] = importProcessedNav(navfile);
        [ ts_gaze, pupil_area_filtered, gaze_x, gaze_y, sacc, blk ] = getVisionData( userNumber );

        [userx, usery, ini,navini,navend]=userNavIntersection(userNumber,qid,ts_nav,ts_gaze,user_url, url_prefix, gaze_x,gaze_y);
        dur=dur+ts_gaze(ini+length(userx))-ts_gaze(ini);

    end
   
end

