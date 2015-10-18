[ maxx, datapath, url_prefix, xoffsets, yoffsets, maxy, ...
    deprecated6, filelist2,questionlist, ms, deprecated1, ...
    deprecated5, deprecated4, maleWebsites,maleSubjects,femaleWebsites,...
    femaleSubjects,neutralWebsites,allSubjects, allWebsites, eeglist, ...
    eegStartTimes, deprecated2, deprecated3, coordinates_csvs, vision_csvs] = hardCodedData( );

res=getFocuses(maleSubjects,maleWebsites,300);
xlswrite('maleSubjectsmaleWebsites.csv',res);
res=getFocuses(maleSubjects,femaleWebsites,300);
xlswrite('maleSubjectsfemaleWebsites.csv',res);
res=getFocuses(maleSubjects,neutralWebsites,300);
xlswrite('maleSubjectsneutralWebsites.csv',res);

res=getFocuses(femaleSubjects,maleWebsites,300);
xlswrite('femaleSubjectsmaleWebsites.csv',res);
res=getFocuses(femaleSubjects,femaleWebsites,300);
xlswrite('femaleSubjectsfemaleWebsites.csv',res);
res=getFocuses(femaleSubjects,neutralWebsites,300);
xlswrite('femaleSubjectsneutralWebsites.csv',res);