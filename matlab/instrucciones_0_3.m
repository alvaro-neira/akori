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
global subjectWithoutEEG;

global subjectWithoutET;


global navfilelist;
global visionfilelist;
global rng_settings;

global QMF;

global HOMBRE;
global MUJER;
hardCodedData();
savein='/Users/aneira/data/vision_csvs/';


for i=1:length(allSubjects)
    subjectId=allSubjects(i);
    if subjectId == subjectWithoutET
        disp(strcat('Skipping subject ',num2str(subjectId)));
        continue;
    end
    fid = fopen(strcat(savein,'suj',num2str(subjectId),'.csv'),'w');


    [ timestamp_double, pupil_area_filtered, gx, gy, sacc, blink, ...
        original_pupil_area,pupil_area_interpolated,pupil_area_fixed ] = getVisionData( subjectId );
    len=length(timestamp_double);
    % plot(timestamp_double,original_pupil_area,'k',timestamp_double,pupil_area_interpolated,'r',...
    %     timestamp_double,pupil_area_fixed,'b',timestamp_double,pupil_area_filtered,'c');
    fprintf(fid,'timestamp(numeracion MATLAB),Original,Luego de interpolacion,Luego de correccion de sacadas,Filtrada\n');
    for j=1:len
        fprintf(fid,'%f,%f,%f,%f,%f\n',timestamp_double(j),original_pupil_area(j),...
            pupil_area_interpolated(j),pupil_area_fixed(j),pupil_area_filtered(j));
    end
    fclose(fid);
end
    

