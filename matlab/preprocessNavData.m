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
    filename = strcat(datapath,char(navfilelist(i)));
    
    [timestamp1,outerWidth,outerHeight,innerWidth,innerHeight,screenX,screenY,...
        scrollTop,scrollLeft,url_id,url] = importNavegacion(filename);
    
    timestamp=timestamp2double(timestamp1);

    fid = fopen(char(strcat('nav',num2str(i),'.csv')),'w');
    fprintf(fid,'timestamp,scrollTop,url\n');
    
    for j=1:length(timestamp)
        fprintf(fid,'%s,%d,%s\n',num2hex(timestamp(j)), scrollTop(j), char(url(j)));
    end
    fclose(fid);

end
