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

   [P, counters, numberOfFocuses]=getPartitionsMaleSites(1000,5);
    SVMsTests( P, counters, numberOfFocuses,'male' );
    [P, counters, numberOfFocuses] = getPartitionsFemaleSites( 1000,5 );
    SVMsTests( P, counters, numberOfFocuses,'female' );
    [P, counters, numberOfFocuses] = getPartitionsNeutralSites( 1000,5 );
    SVMsTests( P, counters, numberOfFocuses, 'neutros' );

