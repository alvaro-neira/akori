% This function doesn't consider scroll
function [ gx, gy, ini2, ini, fin ] = userNavIntersection( userNumber, qid, ts_nav, ts_gaze, ...
    user_url, url_prefix, gaze_x,gaze_y )
    if ~isvector(gaze_x)
        error('Argument must be a vector')
    end
    if ~isvector(gaze_y)
        error('Argument must be a vector')
    end
    [id,url,pic, coordinates_file]=findByPageId(qid);
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
        error('Intersection not found');
    end
    if fin < ini
        error('fin < ini');
    end
    ini2=length(ts_gaze)+1;
    fin2=0;
    
    for i=1:length(ts_gaze)
        if ts_gaze(i) >= ts_nav(ini) && ts_gaze(i) < ts_nav(fin)
            if i<ini2
                ini2=i;
            end
            if i>fin2
                fin2=i;
            end
        end
    end

    size=fin2+1-ini2;
    gx=zeros(size,1);
    gy=zeros(size,1);
  
    for i=1:size
        gx(i)=gaze_x(i+ini2);
        gy(i)=gaze_y(i+ini2);       
    end
    
end

