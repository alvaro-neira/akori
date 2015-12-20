function [ index min] = indexOfMin( vec )
    index=1;
    min=vec(index);
    len=length(vec);
    for i=2:len
        if vec(i)<min
            index=i;
            min=vec(i);
        end
    end

end

