function [ maxDiff,index ] = dilatacionMaxima( vec )
    lenMinusOne=length(vec)-1;
    maxDiff=0.0;
    index=1;
    for i=1:lenMinusOne
        diff=vec(i+1)-vec(i);
        if diff>maxDiff
            maxDiff=diff;
            index=i;
        end
    end
end

