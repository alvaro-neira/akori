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
global subjectWithoutET;
global subjectWithoutEEG;

hardCodedData();
fid = fopen('male.txt','w');

ins25byWebsiteType( fid,'sitios masculinos',maleWebsites );
fprintf(fid,'DONE\n');
fclose(fid);

fid = fopen('female.txt','w');

ins25byWebsiteType( fid,'sitios femeninos',femaleWebsites );
fprintf(fid,'DONE\n');
fclose(fid);
 
fid = fopen('neutral.txt','w');

ins25byWebsiteType( fid,'sitios neutrales',neutralWebsites );



fprintf(fid,'DONE\n');
fclose(fid);
    
