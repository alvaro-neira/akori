function [ gx, gy, maxy ] = getGaze( ini, fin, navini, navfin, maxx, oldmaxy, gaze_x, ...
    gaze_y, xoffset, yoffset, ts_gaze, ts_nav, scrollTop )
    if ~isvector(gaze_x)
        error('Argument 7 must be a vector')
    end
    if ~isvector(gaze_y)
        error('Argument 8 must be a vector')
    end
    if ~isvector(ts_gaze)
        error('Argument 10 must be a vector')
    end
    if ~isvector(ts_nav)
        error('Argument 11 must be a vector')
    end
    if ~isvector(scrollTop)
        error('Argument 12 must be a vector')
    end
    size=fin+1-ini;
    gx=zeros(size,1);
    gy=zeros(size,1);
    maxscroll=0;
    maxy=oldmaxy;
  
    for i=1:size
        gx(i)=gaze_x(i+ini)+xoffset;
        gy(i)=gaze_y(i+ini)+yoffset;
%         if gx(i) < 1 || gy(i) < 1 || gx(i) > maxx + xoffset || gx(i) > maxy
%             gx(i)=NaN;
%             gy(i)=NaN;
%             continue;
%         end
        
        ts=ts_gaze(i+ini);
        
        for k=navini:navfin
            
            if ts_nav(k)<=ts && (k>=navfin || ts_nav(k+1) >=ts)
                scroll=scrollTop(k);
                if maxscroll<scroll
                    maxscroll=scroll;
                end
            end
        end
        maxy=oldmaxy+scroll;
        gy(i)=gy(i)+scroll;
    end
    maxy=oldmaxy+maxscroll;
end

