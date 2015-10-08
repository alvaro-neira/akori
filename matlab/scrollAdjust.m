function [ y, maxscroll ] = scrollAdjust(  origy, scrollVector, ts_gaze, ts_nav, ini, navini, navfin )
    if ~isvector(scrollVector) ||  ~isvector(ts_gaze)
        error('Argument must be a vector')
    end
   
    y=origy;
    size=length(origy);
    maxscroll=0;
    for i=1:size
        
        ts=ts_gaze(i+ini);
        
        for k=navini:navfin
            
            if ts_nav(k)<=ts && (k>=navfin || ts_nav(k+1) >=ts)
                scroll=scrollVector(k);
                if maxscroll<scroll
                    maxscroll=scroll;
                end
            end
        end
       
        y(i)=y(i)+scroll;
    end
end

