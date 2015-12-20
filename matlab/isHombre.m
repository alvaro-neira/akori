function [ res ] = isHombre( n )
    global maleSubjects;
    res=0;
    len=length(maleSubjects);
    for i=1:len
        if n == maleSubjects(i)
            res=1;
            return;
        end
    end
end

