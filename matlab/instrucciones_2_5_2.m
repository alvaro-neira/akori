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
global HOMBRE;
global MUJER;
hardCodedData();

   [P, counters, numberOfFocuses]=getPartitionsMaleSites(1000,5);
    SVMsTests( P, counters, numberOfFocuses );
%   [P, counters, numberOfFocuses] = getPartitionsFemaleSites( 1000,5 );
%   SVMsTests( P, counters, numberOfFocuses );
%   [P, counters, numberOfFocuses] = getPartitionsNeutralSites( 1000,5 );
%   SVMsTests( P, counters, numberOfFocuses );

% male
% male
% 
% Min o1
% std_D2_o1
% std_A1_o1
% energy_D2_o1
% energy_A1_o1
% std_A4_o2
% std_D2_o2
% std_A1_o2
% energy_A4_o2
% energy_D2_o2
% energy_A1_o2
% std_pupil_area
% Dilatacion Maxima
% Contraccion Maxima

%female
% max o1
% min o1
% std o1
% std_A4_o1
% std_D2_o1
% std_A1_o1
% energy_A4_o1
% energy_D2_o1
% energy_A1_o1
% max o2
% min o2
% std o2
% std_D4_o2
% std_D2_o2
% std_A1_o2
% energy_D4_o2
% energy_D2_o2
% energy_A1_o2
% max_pupil_area
% min_pupil_area
% mean_pupil_area
% std_pupil_area
% Dilatacion Maxima
% Contraccion Maxima

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