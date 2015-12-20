function [ gx, gy ] = getGaze( ini, fin, navini, navfin, gaze_x, ...
    gaze_y, xoffset, yoffset, ts_gaze, ts_nav )
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
   
    size=fin+1-ini;
    gx=zeros(size,1);
    gy=zeros(size,1);
   
  
    for i=1:size
        gx(i)=gaze_x(i+ini)+xoffset;
        gy(i)=gaze_y(i+ini)+yoffset;

    end
    
end

