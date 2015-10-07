[page_id,url,picture,coordinates_file] = findByPageId('ds_eggs');
[ maxx, datapath, url_prefix, xoffsets, yoffsets, maxy, filelist, ...
    filelist2,questionlist, ms, coordinates_path ] = hardCodedData( );
[node_name,x,y,width,height,depth,has_text,id,k,object_id] = ...
    importCoordinates(char(strcat(coordinates_path,coordinates_file)));
for i=1:length(object_id)
    x(i)
    y(i)
    width(i)
    height(i)
end