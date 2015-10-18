[ maxx, datapath, url_prefix, xoffsets, yoffsets, maxy, ...
    filelist, filelist2,questionlist, ms, deprecated1, ...
    deprecated5, deprecated4, maleWebsites,maleSubjects,femaleWebsites,...
    femaleSubjects,neutralWebsites,allSubjects, allWebsites, eeglist, ...
    eegStartTimes, deprecated2, deprecated3, coordinates_csvs] = hardCodedData( );

% res=getFocuses(maleSubjects,maleWebsites);
% xlswrite('maleSubjectsmaleWebsites.csv',res);
% res=getFocuses(maleSubjects,femaleWebsites);
% xlswrite('maleSubjectsfemaleWebsites.csv',res);
res=getFocuses(allSubjects,allWebsites,300);
xlswrite('ms300.csv',res);
res=getFocuses(allSubjects,allWebsites,1000);
xlswrite('ms1000.csv',res);

% res=getFocuses(femaleSubjects,maleWebsites);
% xlswrite('femaleSubjectsmaleWebsites.csv',res);
% res=getFocuses(femaleSubjects,femaleWebsites);
% xlswrite('femaleSubjectsfemaleWebsites.csv',res);
% res=getFocuses(femaleSubjects,neutralWebsites);
% xlswrite('femaleSubjectsneutralWebsites.csv',res);