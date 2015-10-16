[ maxx, datapath, url_prefix, xoffsets, yoffsets, maxy, ...
    filelist, filelist2,questionlist, ms, coordinates_path, ...
    focusThreshold, minDepth, maleWebsites,maleSubjects,femaleWebsites,...
    femaleSubjects,neutralWebsites,allSubjects, allWebsites, eeglist, ...
    eegStartTimes] = hardCodedData( );



for i=20:20%length(eeglist)
    if strcmp(eeglist(i),'NONE')
        continue;
    end
    [ts, o1, o2]=getEeg(i);

    if ~strcmp(filelist(i),'NONE')
        [ tsPupil, pupilArea ] = getPupilSize( i ); 
     
        plot(ts,o2,'k',ts,o1,'b',tsPupil,pupilArea,'r');
    else
        plot(ts,o1,'r',ts,o2,'b');
    end
    

end