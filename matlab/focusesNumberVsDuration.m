[ maxx, datapath, url_prefix, xoffsets, yoffsets, maxy, ...
    filelist, filelist2,questionlist, ms, deprecated1, ...
    deprecated5, deprecated4, maleWebsites,maleSubjects,femaleWebsites,...
    femaleSubjects,neutralWebsites,allSubjects, allWebsites, eeglist, ...
    eegStartTimes, deprecated2, deprecated3, coordinates_csvs] = hardCodedData( );


focusThreshold=100;
rescounter=1;
res=[];
while focusThreshold<=4000
    nfocuses=getNFocuses(allSubjects,allWebsites,focusThreshold);
    res(rescounter,1)=focusThreshold;
    res(rescounter,2)=nfocuses;
    focusThreshold=focusThreshold+100;
    
    rescounter=rescounter+1;
    res
end

xlswrite('ms.csv',res);
