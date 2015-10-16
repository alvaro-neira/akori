function [ newts, o1, o2 ] = getEeg( subjectId )
    [ maxx, datapath, url_prefix, xoffsets, yoffsets, maxy, ...
    filelist, filelist2,questionlist, ms, coordinates_path, ...
    focusThreshold, minDepth, maleWebsites,maleSubjects,femaleWebsites,...
    femaleSubjects,neutralWebsites,allSubjects, allWebsites, eeglist, ...
    eegStartTimes] = hardCodedData( );
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

