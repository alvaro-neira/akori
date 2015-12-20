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

hardCodedData();
format long;
fid = fopen('instrucciones1_4.txt','w');
fprintf(fid,'Numero sacadas sitios neutro\n');
fprintf(fid,'---------------------------------\n');
vecMale=getVectorNumeroSacadas(maleSubjects,neutralWebsites);
vecMale
vecFemale=getVectorNumeroSacadas(femaleSubjects,neutralWebsites);
vecFemale
print1_4(fid,vecMale,vecFemale);
fprintf(fid,'\n\nNumero sacadas sitios masculinos\n');
fprintf(fid,'---------------------------------\n');
vecMale=getVectorNumeroSacadas(maleSubjects,maleWebsites);
vecMale
vecFemale=getVectorNumeroSacadas(femaleSubjects,maleWebsites);
vecFemale
print1_4(fid,vecMale,vecFemale);
fprintf(fid,'\n\nNumero sacadas sitios femeninos\n');
fprintf(fid,'---------------------------------\n');
vecMale=getVectorNumeroSacadas(maleSubjects,femaleWebsites);
vecMale
vecFemale=getVectorNumeroSacadas(femaleSubjects,femaleWebsites);
vecFemale
print1_4(fid,vecMale,vecFemale);
fprintf(fid,'\n\nNumero fijaciones sitios neutro\n');
fprintf(fid,'---------------------------------\n');
vecMale=getVectorNumeroFijaciones(maleSubjects,neutralWebsites);
vecMale
vecFemale=getVectorNumeroFijaciones(femaleSubjects,neutralWebsites);
vecFemale
print1_4(fid,vecMale,vecFemale);
fprintf(fid,'\n\nNumero fijaciones sitios masculinos\n');
fprintf(fid,'---------------------------------\n');
vecMale=getVectorNumeroFijaciones(maleSubjects,maleWebsites);
vecMale
vecFemale=getVectorNumeroFijaciones(femaleSubjects,maleWebsites);
vecFemale
print1_4(fid,vecMale,vecFemale);
fprintf(fid,'\n\nNumero fijaciones sitios femeninos\n');
fprintf(fid,'---------------------------------\n');
vecMale=getVectorNumeroFijaciones(maleSubjects,femaleWebsites);
vecMale
vecFemale=getVectorNumeroFijaciones(femaleSubjects,femaleWebsites);
vecFemale
print1_4(fid,vecMale,vecFemale);
fprintf(fid,'\n\nDuracion fijaciones sitios neutro\n');
fprintf(fid,'---------------------------------\n');
vecMale=getVectorDuracionFijaciones(maleSubjects,neutralWebsites);
vecMale
vecFemale=getVectorDuracionFijaciones(femaleSubjects,neutralWebsites);
vecFemale
print1_4(fid,vecMale,vecFemale);
fprintf(fid,'\n\nDuracion fijaciones sitios masculinos\n');
fprintf(fid,'---------------------------------\n');
vecMale=getVectorDuracionFijaciones(maleSubjects,maleWebsites);
vecMale
vecFemale=getVectorDuracionFijaciones(femaleSubjects,maleWebsites);
vecFemale
print1_4(fid,vecMale,vecFemale);
fprintf(fid,'\n\nDuracion fijaciones sitios femeninos\n');
fprintf(fid,'---------------------------------\n');
vecMale=getVectorDuracionFijaciones(maleSubjects,femaleWebsites);
vecMale
vecFemale=getVectorDuracionFijaciones(femaleSubjects,femaleWebsites);
vecFemale
print1_4(fid,vecMale,vecFemale);
fclose(fid);