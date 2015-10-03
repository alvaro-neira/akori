pupil_area_fixed=pupil_area;
for i=1:length(timestamp)
    s=char(saccade(i));
    if length(s) > 0 && strcmp(s(1:4),'DIR_')
        delta=pupil_area(i+1)-pupil_area(i); 
        pupil_area_fixed(i)=pupil_area(i-2);
        pupil_area_fixed(i-1)=pupil_area(i-2);
        for j=i+1:length(timestamp)-1
            pupil_area_fixed(j)=pupil_area_fixed(j-1)+delta;
            delta=pupil_area(j+1)-pupil_area(j);
        end
        break;
    end
end