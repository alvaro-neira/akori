function [ ts,pa,gx,gy,sacc,blk ] = getETDataByTimeAndPerson( ini,fin,timestamp,...
               pupil_area,gaze_x,gaze_y,saccade,blink)
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
    len=length(timestamp);
    estimatedLength=floor(len/4);
    ts=zeros(estimatedLength,1);
    pa=zeros(estimatedLength,1);
    gx=zeros(estimatedLength,1);
    gy=zeros(estimatedLength,1);
    sacc=[cellstr('dumpstr1')];
    blk=[cellstr('dumpstr1')];
    finalCounter=0;
    for i=1:len
      
        if timestamp(i)>=ini && timestamp(i)<=fin 
            finalCounter=finalCounter+1;
            ts(finalCounter)=timestamp(i);
            pa(finalCounter)=pupil_area(i);
            gx(finalCounter)=gaze_x(i);
            gy(finalCounter)=gaze_y(i);
  
            sacc(finalCounter,1)=cellstr(saccade(i));

            blk(finalCounter,1)=cellstr(blink(i));
     
        end
        
    end
    if finalCounter>0
        ts=ts(1:finalCounter,:);
        pa=pa(1:finalCounter,:);
        gx=gx(1:finalCounter,:);
        gy=gy(1:finalCounter,:);
    else
        ts=[];
        pa=[];
        gx=[];
        gy=[];
        sacc=[];
        blk=[];
    end
end

