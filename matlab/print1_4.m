function [  ] = print1_4( fid, vecMale, vecFemale )
    fprintf(fid,'aplicando [h,p]=lillietest(vecMale);\n');
    [h1,p1]=lillietest(vecMale);
    fprintf(fid,'h=%d\n',h1);
    fprintf(fid,'p=%f\n',p1);
    fprintf(fid,'aplicando [h,p]=lillietest(vecFemale);\n');
    [h2,p2]=lillietest(vecFemale);
    if h2
        error('h2');
    end
    fprintf(fid,'h=%d\n',h2);
    fprintf(fid,'p=%f\n',p2);

    if h1 || h2
        error('h1 || h2');
    end
    fprintf(fid,'aplicando [h,p] = ttest2(vecMale,vecFemale);\n');

    [h3,p3] = ttest2(vecMale,vecFemale);
    if h3 
        error('h3');
    end
    fprintf(fid,'h=%d\n',h3);
    fprintf(fid,'p=%f\n',p3);


end

