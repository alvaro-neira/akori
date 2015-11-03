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
    
    %[total,male,female]=getNumberOfFocuses(neutralWebsites,1000);
    %[total,male,female]=getNumberOfFocuses(maleWebsites,1000)
        [total,male,female]=getNumberOfFocuses(femaleWebsites,1000)