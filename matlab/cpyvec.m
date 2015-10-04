function v2 = cpyvec(v1)
    if ~isvector(v1)
        error('Input must be a vector')
    end
    len=length(v1);
    v2=zeros(len,1);
    for i=1:len
	    v2(i)=v1(i);
    end
end
