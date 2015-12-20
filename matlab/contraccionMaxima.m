function [ minDiff,index ] = contraccionMaxima( vec )
    lenMinusOne=length(vec)-1;
    minDiff=0.0;
    index=1;
    for i=1:lenMinusOne
        diff=vec(i+1)-vec(i);
        if diff<minDiff
            minDiff=diff;
            index=i;
        end
    end
end

