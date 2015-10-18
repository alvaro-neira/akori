[ maxx, datapath, url_prefix, xoffsets, yoffsets, maxy, ...
    deprecated6, navfilelist,questionlist, ms, deprecated1, ...
    deprecated5, deprecated4, maleWebsites,maleSubjects,femaleWebsites,...
    femaleSubjects,neutralWebsites,allSubjects, allWebsites, eeglist, ...
    eegStartTimes, deprecated2, deprecated3, coordinates_csvs, vision_csvs] = hardCodedData( );

for i=1:length(allSubjects)
    filename = strcat(datapath,char(navfilelist(i)));
    
    [timestamp1,outerWidth,outerHeight,innerWidth,innerHeight,screenX,screenY,...
        scrollTop,scrollLeft,url_id,url] = importNavegacion(filename);
    
    timestamp=timestamp2double(timestamp1);

    fid = fopen(char(strcat('nav',num2str(i),'.csv')),'w');
    fprintf(fid,'timestamp,scrollTop,url\n');
    
    for j=1:length(timestamp)
        fprintf(fid,'%f,%d,%s\n',timestamp(j), scrollTop(j), char(url(j)));
    end
    fclose(fid);

end
