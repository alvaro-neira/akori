[ maxx, datapath, url_prefix, xoffsets, yoffsets, maxy, filelist, ...
    filelist2,questionlist, ms, deprecated1, focusThreshold, minDepth, ...
    maleWebsites, maleSubjects, femaleWebsites,femaleSubjects,neutralWebsites] = hardCodedData( );

res=getSaccades(maleSubjects,maleWebsites);
xlswrite('maleSubjectsmaleWebsites.csv',res);
res=getSaccades(maleSubjects,femaleWebsites);
xlswrite('maleSubjectsfemaleWebsites.csv',res);
res=getSaccades(maleSubjects,neutralWebsites);
xlswrite('maleSubjectsneutralWebsites.csv',res);
res=getSaccades(femaleSubjects,maleWebsites);
xlswrite('femaleSubjectsmaleWebsites.csv',res);
res=getSaccades(femaleSubjects,femaleWebsites);
xlswrite('femaleSubjectsfemaleWebsites.csv',res);
res=getSaccades(femaleSubjects,neutralWebsites);
xlswrite('femaleSubjectsneutralWebsites.csv',res);