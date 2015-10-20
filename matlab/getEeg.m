function [ newts, o1, o2 ] = getEeg( subjectId )
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
    filename=strcat(datapath,char( eeglist(subjectId)));
    [ts,oldO1,oldO2]=importEdf(filename);
    newts=zeros(length(ts),1);
    for i=1:length(ts)
        newts(i)=eegStartTimes(subjectId)+ms*ts(i);
    end
    
    %Filter
    lowFreq=0.5;
    hiFreq=63;
    order=1;
    fs=128;
    [b,a] = butter(order, [lowFreq hiFreq]/(fs/2), 'bandpass');
    filtered1 = filter(b,a,oldO1);
    filtered2 = filter(b,a,oldO2);
    
    %Remove average
    o1=filtered1-mean(filtered1);
    o2=filtered2-mean(filtered2);
    
    clearvars -except newts o1 o2
   
end

