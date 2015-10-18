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

hardCodedData( );


focusThreshold=100;
rescounter=1;
res=[];
while focusThreshold<=500
    nfocuses=getNFocuses(allSubjects,allWebsites,focusThreshold);
    res(rescounter,1)=focusThreshold;
    res(rescounter,2)=nfocuses;
    focusThreshold=focusThreshold+100;
    
    rescounter=rescounter+1;
    res
end

xlswrite('ms.csv',res);
