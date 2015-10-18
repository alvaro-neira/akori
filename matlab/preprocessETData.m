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
global navfilelist;
hardCodedData( );

for i=1:length(allSubjects)
    [ timestamp_double, pupil_area_filtered, gaze_x, gaze_y, saccade ] = getVisionData( i );
    fid = fopen(char(strcat('vision',num2str(i),'.csv')),'w');
    fprintf(fid,'timestamp,pupil_area,gaze_x,gaze_y,saccade\n');
    
    for j=1:length(timestamp_double)
        fprintf(fid,'%s,%f,%d,%d,%s\n',num2hex(timestamp_double(j)),pupil_area_filtered(j), ...
            gaze_x(j), gaze_y(j), char(saccade(j)));
    end
    fclose(fid);

end
