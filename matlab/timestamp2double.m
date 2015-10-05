function ts3=timestamp2double(ts1)
    if ~isvector(ts1)
        error('Input must be a vector')
    end
    
    ts2=ts1;
    
    for i=1:length(ts1)
        s=char(ts1(i));
        if strcmp(s(1:4),'----')
            ts2(i)=cellstr(s(39:60));
        end
    end

    ts3=datenum(ts2,'yyyymmdd.HHMMSS.FFF');
end