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
[P]=getPartitions(maleWebsites,1000);

% std_pupil_area male
% dMax male
% cMax male

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