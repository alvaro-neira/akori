qid='columbia_about';
userNumber=1;
[page_id,url,picture,coordinates_file] = findByPageId(qid);
[ maxx, datapath, url_prefix, xoffsets, yoffsets, maxy, filelist, ...
    filelist2,questionlist, ms, coordinates_path ] = hardCodedData( );

filename = strcat(datapath,char(filelist(userNumber)));
filename2 = strcat(datapath,char(filelist2(userNumber)));
[timestamp2,outerWidth,outerHeight,innerWidth,innerHeight,screenX,...
        screenY,scrollTop,scrollLeft,url_id,user_url] = importNavegacion(filename2);
[timestamp,frame_number,gaze_x,gaze_y,pupil_axis1,pupil_axis2,pupil_area,saccade,blink]=importVision(filename);
ts_gaze=timestamp2double(timestamp);
ts_nav=timestamp2double(timestamp2);
[node_name,x,y,width,height,depth,has_text,id,k,object_id] = ...
    importCoordinates(char(strcat(coordinates_path,coordinates_file)));
[userx, usery]=userNavIntersection(userNumber,qid,ts_nav,ts_gaze,user_url, url_prefix, gaze_x,gaze_y);
for i=1:length(object_id)
    [nviews]=processObject(userx,usery,x(i),y(i),width(i),height(i),xoffsets(userNumber),yoffsets(userNumber));
    if nviews>1
        object_id(i)
%         nviews
    end
 
end