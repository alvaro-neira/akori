global maxx;
global datapath;
global url_prefix;
global xoffsets;
global yoffsets;
global maxy;
global questionlist;
global ms;
global maleWebsites;
global maleSubjects;
global femaleWebsites;
global femaleSubjects;
global neutralWebsites;
global allSubjects;
global allWebsites;
global eeglist;
global eegStartTimes;
global coordinates_csvs;
global navfilelist;
global visionfilelist;
global subjectWithoutET;
global subjectWithoutEEG;
global rng_settings;

hardCodedData();

%Male Websites
[P, counters, totalSamples]=getPartitions(maleWebsites,1000);
[h, nPartitions, depth]=size(P);
nFeatures=depth-1;
for partitionToSkip=1:nPartitions
    heightToSkip=counters(partitionToSkip);
    height=totalSamples-heightToSkip;

   
    
    Y=[cellstr('none');cellstr('none')];
    X=zeros(height,nFeatures);
    ycounter=0;
    for partitionNumber=1:nPartitions
        if partitionNumber==partitionToSkip
            continue;
        end
        for i=1:counters(partitionNumber)
            if P(i,partitionNumber,depth)
                Y(ycounter+i)=cellstr('hombre');
            else
                Y(ycounter+i)=cellstr('mujer');
            end
            for j=1:nFeatures
                X(ycounter+i,j)=P(i,partitionNumber,j);
            end
        end
        ycounter=ycounter+counters(partitionNumber);
    end
    SVMModel=fitcsvm(X,Y,'KernelFunction','rbf','Standardize',true,'ClassNames',{'mujer','hombre' });

end


% std_pupil_area male
% dMax male
% cMax male
% std_D2_o1 male
% std_A1_o1 male
% energy_D2_o1 male
% energy_A1_o1 male
% std_D2_o2 male
% std_A1_o2 male
% energy_D2_o2 male
% energy_A1_o2 male

% max_pupil_area female
% min_pupil_area female
% mean_pupil_area female
% std_pupil_area female
% dMax female
% cMax female
% max o1 female
% min o1 female
% std o1 female
% max o2 female
% min o2 female
% std o2 female
% max_pupil_area neutral
% min_pupil_area neutral
% mean_pupil_area neutral
% max_o1 neutral
% max_o2 neutral
% std_o2 neutral