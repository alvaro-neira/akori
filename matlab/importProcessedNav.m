function [timestamp,scrollTop,user_url] = importProcessedNav( filename )
    [ts,outerWidth,outerHeight,innerWidth,innerHeight,screenX,...
        screenY,st,scrollLeft,url_id,url] = importNavegacion(filename);
    timestamp=timestamp2double(ts);
    scrollTop=st;
    user_url=url;

end

