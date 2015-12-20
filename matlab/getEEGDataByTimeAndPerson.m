function [ ts,o1_,o2_ ] = getEEGDataByTimeAndPerson( ini,fin, timestamp, o1, o2)
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
    o1_=zeros(estimatedLength,1);
    o2_=zeros(estimatedLength,1);
    
    finalCounter=0;
    for i=1:len
      
        if timestamp(i)>=ini && timestamp(i)<=fin 
            finalCounter=finalCounter+1;
            ts(finalCounter)=timestamp(i);
            o1_(finalCounter)=o1(i);
            o2_(finalCounter)=o2(i);
       
     
        end
        
    end
    if finalCounter>0
        ts=ts(1:finalCounter,:);
        o1_=o1_(1:finalCounter,:);
        o2_=o2_(1:finalCounter,:);
        
    else
        ts=[];
        o1_=[];
        o2_=[];
       
    end
end

