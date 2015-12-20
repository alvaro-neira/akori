function [ output_args ] = ins25byWebsiteType( fid,titletext,websites )
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

[ max_pupil_area1,min_pupil_area1,mean_pupil_area1,std_pupil_area1,...
    dMaxima1,cMaxima1,max_eeg_o11,min_eeg_o11,std_eeg_o11,...
    max_eeg_o21,min_eeg_o21,std_eeg_o21,std_A4_o1male,std_D4_o1male,...
std_D3_o1male,std_D2_o1male,std_A1_o1male,energy_A4_o1male,energy_D4_o1male,...
energy_D3_o1male,energy_D2_o1male,energy_A1_o1male,std_A4_o2male,std_D4_o2male,...
std_D3_o2male,std_D2_o2male,std_A1_o2male,energy_A4_o2male,energy_D4_o2male,...
energy_D3_o2male,energy_D2_o2male,energy_A1_o2male] = ...
    getVectoresFijaciones( maleSubjects, websites, 1000 );
[ max_pupil_area2,min_pupil_area2,mean_pupil_area2,std_pupil_area2,...
    dMaxima2,cMaxima2,max_eeg_o12,min_eeg_o12,std_eeg_o12,...
    max_eeg_o22,min_eeg_o22,std_eeg_o22,std_A4_o1female,std_D4_o1female,...
std_D3_o1female,std_D2_o1female,std_A1_o1female,energy_A4_o1female,energy_D4_o1female,...
energy_D3_o1female,energy_D2_o1female,energy_A1_o1female,std_A4_o2female,std_D4_o2female,...
std_D3_o2female,std_D2_o2female,std_A1_o2female,energy_A4_o2female,energy_D4_o2female,...
energy_D3_o2female,energy_D2_o2female,energy_A1_o2female] = ...
    getVectoresFijaciones( femaleSubjects, websites, 1000 );

fprintf(fid,'\n\n std_A4_o1 %s\n',titletext);
fprintf(fid,'-------------------------------------\n');
printStats( std_A4_o1male, std_A4_o1female, fid );

fprintf(fid,'\n\n std_D4_o1 %s\n',titletext);
fprintf(fid,'-------------------------------------\n');
printStats( std_D4_o1male, std_D4_o1female, fid );

fprintf(fid,'\n\n std_D3_o1 %s\n',titletext);
fprintf(fid,'-------------------------------------\n');
printStats( std_D3_o1male, std_D3_o1female, fid );

fprintf(fid,'\n\n std_D2_o1 %s\n',titletext);
fprintf(fid,'-------------------------------------\n');
printStats( std_D2_o1male, std_D2_o1female, fid );

fprintf(fid,'\n\n std_A1_o1 %s\n',titletext);
fprintf(fid,'-------------------------------------\n');
printStats( std_A1_o1male, std_A1_o1female, fid );

fprintf(fid,'\n\n energy_A4_o1 %s\n',titletext);
fprintf(fid,'-------------------------------------\n');
printStats( energy_A4_o1male, energy_A4_o1female, fid );

fprintf(fid,'\n\n energy_D4_o1 %s\n',titletext);
fprintf(fid,'-------------------------------------\n');
printStats( energy_D4_o1male, energy_D4_o1female, fid );
fprintf(fid,'\n\n energy_D3_o1 %s\n',titletext);
fprintf(fid,'-------------------------------------\n');
printStats( energy_D3_o1male, energy_D3_o1female, fid );

fprintf(fid,'\n\n energy_D2_o1 %s\n',titletext);
fprintf(fid,'-------------------------------------\n');
printStats( energy_D2_o1male, energy_D2_o1female, fid );

fprintf(fid,'\n\n energy_A1_o1 %s\n',titletext);
fprintf(fid,'-------------------------------------\n');
printStats( energy_A1_o1male, energy_A1_o1female, fid );

fprintf(fid,'\n\n std_A4_o2 %s\n',titletext);
fprintf(fid,'-------------------------------------\n');
printStats( std_A4_o2male, std_A4_o2female, fid );

fprintf(fid,'\n\n std_D4_o2 %s\n',titletext);
fprintf(fid,'-------------------------------------\n');
printStats( std_D4_o2male, std_D4_o2female, fid );

fprintf(fid,'\n\n std_D3_o2 %s\n',titletext);
fprintf(fid,'-------------------------------------\n');
printStats( std_D3_o2male, std_D3_o2female, fid );

fprintf(fid,'\n\n std_D2_o2 %s\n',titletext);
fprintf(fid,'-------------------------------------\n');
printStats( std_D2_o2male, std_D2_o2female, fid );

fprintf(fid,'\n\n std_A1_o2 %s\n',titletext);
fprintf(fid,'-------------------------------------\n');
printStats( std_A1_o2male, std_A1_o2female, fid );

fprintf(fid,'\n\n energy_A4_o2 %s\n',titletext);
fprintf(fid,'-------------------------------------\n');
printStats( energy_A4_o2male, energy_A4_o2female, fid );

fprintf(fid,'\n\n energy_D4_o2 %s\n',titletext);
fprintf(fid,'-------------------------------------\n');
printStats( energy_D4_o2male, energy_D4_o2female, fid );
fprintf(fid,'\n\n energy_D3_o2 %s\n',titletext);
fprintf(fid,'-------------------------------------\n');
printStats( energy_D3_o2male, energy_D3_o2female, fid );

fprintf(fid,'\n\n energy_D2_o2 %s\n',titletext);
fprintf(fid,'-------------------------------------\n');
printStats( energy_D2_o2male, energy_D2_o2female, fid );

fprintf(fid,'\n\n energy_A1_o2 %s\n',titletext);
fprintf(fid,'-------------------------------------\n');
printStats( energy_A1_o2male, energy_A1_o2female, fid );




fprintf(fid,'\n\n max_pupil_area %s\n',titletext);
fprintf(fid,'-------------------------------------\n');
printStats( max_pupil_area1, max_pupil_area2, fid );
fprintf(fid,'\n\n min_pupil_area %s\n\n',titletext);
fprintf(fid,'-------------------------------------\n');
printStats( min_pupil_area1, min_pupil_area2, fid );
fprintf(fid,'\n\n mean_pupil_area %s\n\n',titletext);
fprintf(fid,'-------------------------------------\n');
printStats( mean_pupil_area1, mean_pupil_area2, fid );
fprintf(fid,'\n\n std_pupil_area %s\n\n',titletext);
fprintf(fid,'-------------------------------------\n');
printStats( std_pupil_area1, std_pupil_area2, fid );
fprintf(fid,'\n\n Dilatacion Maxima %s\n\n',titletext);
fprintf(fid,'-------------------------------------\n');
printStats( dMaxima1, dMaxima2, fid );
fprintf(fid,'\n\n Contraccion Maxima %s\n\n',titletext);
fprintf(fid,'-------------------------------------\n');
printStats( cMaxima1, cMaxima2, fid );

fprintf(fid,'\n\n Max o1 %s\n\n',titletext);
fprintf(fid,'-------------------------------------\n');
printStats( max_eeg_o11, max_eeg_o12, fid );
fprintf(fid,'\n\n Min o1 %s\n\n',titletext);
fprintf(fid,'-------------------------------------\n');
printStats( min_eeg_o11, min_eeg_o12, fid );
fprintf(fid,'\n\n Desviacion Estandar o1 %s\n\n',titletext);
fprintf(fid,'-------------------------------------\n');
printStats( std_eeg_o11, std_eeg_o12, fid );

fprintf(fid,'\n\n Max o2 %s\n\n',titletext);
fprintf(fid,'-------------------------------------\n');
printStats( max_eeg_o21, max_eeg_o22, fid );

fprintf(fid,'\n\n Min o2 %s\n\n',titletext);
fprintf(fid,'-------------------------------------\n');
printStats( min_eeg_o21, min_eeg_o22, fid );

fprintf(fid,'\n\n Desviacion Estandar o2 %s\n\n',titletext);
fprintf(fid,'-------------------------------------\n');
printStats( std_eeg_o21, std_eeg_o22, fid );

% clearvars max_pupil_area1,min_pupil_area1,mean_pupil_area1,std_pupil_area1,...
%     dMaxima1,cMaxima1,max_eeg_o11,min_eeg_o11,std_eeg_o11,...
%     max_eeg_o21,min_eeg_o21,std_eeg_o21, ...
%     max_pupil_area2,min_pupil_area2,mean_pupil_area2,std_pupil_area2,...
%     dMaxima2,cMaxima2,max_eeg_o12,min_eeg_o12,std_eeg_o12,...
%     max_eeg_o22,min_eeg_o22,std_eeg_o22;
end

