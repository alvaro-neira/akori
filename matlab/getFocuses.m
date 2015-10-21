function [ res ] = getFocuses( persona, pregunta, focusThreshold,ts_gaze,...
    pupil_area,gaze_x,gaze_y,saccade,blink )
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
    global subjectWithoutET;
    global subjectWithoutEEG;


    resCounter=1;
    estimatedLength=500;   
    res=zeros(estimatedLength,2);

    
    userFocusesCounter=0;

 
    [page_id,url,picture,coordinates_file] = findByPageId(pregunta);

    navfile = strcat(datapath,char(navfilelist(persona)));
    
    [ts_nav,scrollTop,user_url] = importProcessedNav(navfile);
            
     
            
          
    [node_name,x,y,width,height,depth,has_text,id,k,object_id] = ...
                importCoordinates(char(strcat(coordinates_csvs,coordinates_file)));

    [userx, useryaux, ini,navini,navend]=userNavIntersection(persona,pregunta,ts_nav,ts_gaze,user_url, url_prefix, gaze_x,gaze_y);
    [usery]=scrollAdjust(useryaux,scrollTop,ts_gaze,ts_nav,ini,navini,navend);

    for i=1:length(object_id);
        if(depth(i) ~= 10)
            error('depth(i) ~= 10');
        end
        [ focusList]=processObject(object_id(i), userx,usery,x(i),y(i),width(i),height(i),...
                    xoffsets(persona),yoffsets(persona),ts_gaze,ini,focusThreshold);
        
        [len1,n]=size(focusList);
        if(len1>0)

            for fl=1:len1
                res(userFocusesCounter+fl,1)=focusList(fl,1);
                res(userFocusesCounter+fl,2)=focusList(fl,2);
            end
            userFocusesCounter=userFocusesCounter+len1;

        end
    end
%             disp(strcat('focusThreshold=',num2str(focusThreshold),',persona=',num2str(persona),',page=',pregunta));
    if userFocusesCounter>0
        res=res(1:userFocusesCounter,:);
    else
        res=[];
    end
     if userFocusesCounter>estimatedLength
         disp('userFocusesCounter=',userFocusesCounter,'>estimatedLength=',estimatedLength);
     end
% %         length(userFocuses)
% %         userFocusesCounter
%         res(resCounter,1)=length(userFocuses); %totalfocuses
%         res(resCounter,2)=length(userFocuses)/length(websites); %average per page
%         res(resCounter,3)=mean(userFocuses); %average ms per subject
%         resCounter=resCounter+1;
 
end