[ maxx, datapath, url_prefix, xoffsets, yoffsets, maxy, ...
    filelist, filelist2,questionlist, ms, deprecated1, ...
    deprecated5, deprecated4, maleWebsites,maleSubjects,femaleWebsites,...
    femaleSubjects,neutralWebsites,allSubjects, allWebsites, eeglist, ...
    eegStartTimes, deprecated2, deprecated3, coordinates_csvs] = hardCodedData( );

for i=1:length(allSubjects)
    [ timestamp_double, pupil_area_filtered, gaze_x, gaze_y ] = getVisionData( i );
    fid = fopen(char(strcat('vision',num2str(i),'.csv')),'w');
    fprintf(fid,'timestamp,pupil_area,gaze_x,gaze_y\n');
    
    for j=1:length(timestamp_double)
        fprintf(fid,'%f,%f,%d,%d\n',timestamp_double(j),pupil_area_filtered(j), gaze_x(j), gaze_y(j));
    end
    fclose(fid);

end
