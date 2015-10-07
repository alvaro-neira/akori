
function [ output_args ] = gazeByQuestion( qid, ts_nav, ts_gaze, user_url, ...
    url_prefix, maxx, maxy, gaze_x, gaze_y, xoffset, yoffset, scrollTop, datapath )
    [id,url,pic]=findByPageId(qid);
    if strcmp(pic,'')
        error('Picture not found');
    end
    ini=length(ts_nav)+1;
    fin=0;
    found=0;
    for i=1:length(ts_nav)
        if strcmp(user_url(i),strcat(url_prefix,url))
            found=1;
            
            if i<ini
                ini=i;
            end
            if i >= length(ts_nav)
                fin=i;
            end
        elseif found 
            fin=i;
            break;
        
        end    
    end
    if ~found
        error('ts_gaze not found');
    end
    if fin < ini
        error('fin < ini');
    end
    ini2=length(ts_gaze)+1;
    fin2=0;
    
%     length(ts_gaze)
%     ts_nav(ini)
%     length(ts_nav)
%     ini 
%     fin
    for i=1:length(ts_gaze)
%         ts_gaze(i)
%         ts_nav(ini)
%         ts_nav(fin)
        if ts_gaze(i) >= ts_nav(ini) && ts_gaze(i) < ts_nav(fin)
            if i<ini2
                ini2=i;
            end
            if i>fin2
                fin2=i;
            end
        end
    end
    [gx, gy, newmaxy]=getGaze(ini2, fin2, ini, fin, maxx, maxy, gaze_x, gaze_y, ...
        xoffset, yoffset, ts_gaze, ts_nav, scrollTop);
    
    plotimg(char(strcat(datapath,'pngs/')),maxx,newmaxy,pic,yoffset,gx,gy);   


end

