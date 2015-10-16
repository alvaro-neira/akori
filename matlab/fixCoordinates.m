[ maxx, datapath, url_prefix, xoffsets, yoffsets, maxy, ...
    filelist, filelist2,questionlist, ms, coordinates_path, ...
    focusThreshold, minDepth, maleWebsites,maleSubjects,femaleWebsites,...
    femaleSubjects,neutralWebsites,allSubjects, allWebsites, eeglist, ...
    eegStartTimes, csvs, new_objects_path,coordinates_csvs] = hardCodedData( );

for i=length(questionlist):length(questionlist)
    name=char(strcat(new_objects_path,questionlist(i),'.csv'));
    
    [node_name,x,y,width,height,depth,has_text,id,k,object_id] = ...
        importCoordinates(name);
    othername=char(strcat(coordinates_path,csvs(i),'.csv'));
    
    [node_name2,x2,y2,width2,height2,depth2,has_text2,id2,k2,object_id2] = ...
        importCoordinates(othername);
    newx=x;
    newy=y;
    newwidth=width;
    newheight=height;
    newnodename=node_name;
    for j=1:length(object_id)
        if isnan(x(j)) && isnan(y(j)) && isnan(width(j)) && isnan(height(j))
            f=find(object_id2 == object_id(j));
            
            newx(j)=x2(f(1));
            newy(j)=y2(f(1));
            newwidth(j)=width2(f(1));
            newheight(j)=height2(f(1));
        else
            newx(j)=x(j);
            newy(j)=y(j);
            newwidth(j)=width(j);
            newheight(j)=height(j);
        end
        newnodename(j)=cellstr('manual');
    end
    fid = fopen(char(strcat(coordinates_csvs,csvs(i),'.csv')),'w');
    fprintf(fid,'node_name,x,y,width,height,depth,has_text,id,k,object_id\n');

    for k=1:length(object_id)
        fprintf(fid,'manual,%d,%d,%d,%d,10,0,1,1,%d\n',newx(k),newy(k),...
            newwidth(k),newheight(k),object_id(k));

    end
%     res(:,1)=newnodename;
%         res(:,2)=num2cell(newx);
%         res(:,3)=num2cell(newy);
%         res(:,4)=num2cell(object_id);
% 
% %     res=cell([ newnodename newx newy object_id]);
%     
%     %fprintf(fid,'%s, %s, %s\n',c{1,:})
    
    fclose(fid);
end