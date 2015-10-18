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