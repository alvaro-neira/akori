
[ maxx, datapath, url_prefix, xoffsets, yoffsets, maxy, filelist, ...
    filelist2,questionlist, ms, coordinates_path, focusThreshold, minDepth, ...
    maleWebsites, maleSubjects, femaleWebsites,femaleSubjects,neutralWebsites] = hardCodedData( );


res=getDurations(maleSubjects,femaleWebsites);
xlswrite('tuhermana.csv',res);