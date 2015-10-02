myvector=zeros(length(saccade),1);
for i=1:length(saccade)
    s=char(saccade(i));
    if length(s) > 0 && strcmp(s(1:4),'DIR_')
        myvector(i)=1;
    end
end

