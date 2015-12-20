function [ output_args ] = printStats( maleVector, femaleVector, fid )
    [h1,p1]=lillietest(maleVector);
    fprintf(fid,'    Male Lilliefors ([h,p]=lillietest(maleVector)) h=%d, p=%f\n',h1,p1);
    [h2,p2]=lillietest(femaleVector);
    fprintf(fid,'    Female Lilliefors ([h,p]=lillietest(femaleVector)) h=%d, p=%f\n',h2,p2);
    if h1 ~= h2
        error(strcat(num2str(h1),'=h1 ~= h2=',num2str(h2)));
    end
    if h1 && h2
        
        fprintf(fid,'    Lilliefors not normal distribution\n');
        [p_wilcoxon,h_wilcoxon,stats_wilcoxon] = ranksum(maleVector,femaleVector);
        fprintf(fid,'        Wilcoxon ([p,h,stats]=ranksum(maleVector,femaleVector)) ...p=%f, h=%d\n        stats=\n%s\n',p_wilcoxon,h_wilcoxon);
        if h_wilcoxon
            
            fprintf(fid,'        Wilcoxon not equal medians, male median=%f, female_median=%f\n',...
                mean(maleVector),mean(femaleVector));

        else
            fprintf(fid,'        Wilcoxon equal medians, male median=%f, female_median=%f\n',...
                mean(maleVector),mean(femaleVector));

        end
    else
        fprintf('    Lilliefors normal distribution\n');
        [h_ttest,p_ttest] = ttest2(maleVector,femaleVector);
        fprintf(fid,'        TTest ([h,p]=ttest2(maleVector,femaleVector)) h=%d, p=%f\n',h_ttest,p_ttest);
        if h_ttest
            fprintf(fid,'        ttest not independent\n');

        else
            fprintf(fid,'        ttest independent\n');
        end
    end

end

