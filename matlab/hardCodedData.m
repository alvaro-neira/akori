function [  ] = hardCodedData( )
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
global subjectWithoutEEG;
subjectWithoutEEG=8;
global subjectWithoutET;
subjectWithoutET=20;
% global vision_csvs;
% global nav_csvs;
global navfilelist;
global visionfilelist;
global rng_settings;
rng_settings=99; % seed = 99 ?;
addpath internal;
% minDepth=3;
% focusThreshold=300;
maxx=1920;
datapath='/Users/aneira/data/';
% vision_csvs='/Users/aneira/data/vision_csvs/';
% nav_csvs='/Users/aneira/data/nav_csvs/';


% new_objects_path='/Users/aneira/lalo/Objetos finales/';
url_prefix='file:///C:/Users/Gino/Desktop/websites/';
coordinates_csvs='/Users/aneira/akori/coordinates_csvs/';
xoffsets=zeros(20,1);
yoffsets=zeros(20,1);
for os=1:length(yoffsets)
    yoffsets(os)=-100;
end

xoffsets(15)=0;
yoffsets(15)=-100;

xoffsets(16)=0;
yoffsets(16)=-100;

xoffsets(17)=0;
yoffsets(17)=-100;

xoffsets(18)=0;
yoffsets(18)=-100;

xoffsets(19)=140;
yoffsets(19)=-100;

xoffsets(20)=40;
yoffsets(20)=-100;

maxy=946;
ms=1.157401129603386e-08;

lst=[
'suj1/sofey_20150622.171003.694091/vision.csv ';
'suj2/sofey_20150623.151146.284899/vision.csv ';
'suj3/sofey_20150623.170015.213743/vision.csv ';
'suj4/sofey_20150624.152021.999849/vision.csv ';
'suj5/sofey_20150625.132946.259604/vision.csv ';
'suj6/sofey_20150625.182949.378244/vision.csv ';
'suj7/sofey_20150626.113812.831099/vision.csv ';
'suj8/sofey_20150626.132614.756886/vision.csv ';
'suj9/sofey_20150630.151708.864330/vision.csv ';
'suj10/sofey_20150701.122612.963045/vision.csv';
'suj11/sofey_20150701.142125.918000/vision.csv';
'suj12/sofey_20150702.104759.799348/vision.csv';
'suj13/sofey_20150702.142919.822211/vision.csv';
'suj14/sofey_20150702.172213.902820/vision.csv';
'suj15/sofey_20150708.154158.067584/vision.csv';
'suj16/sofey_20150710.100441.159137/vision.csv';
'suj17/sofey_20150710.122606.803479/vision.csv';
'suj19/sofey_20150713.100245.473159/vision.csv';
'suj20/sofey_20150714.125755.020633/vision.csv';
'NONE                                         ';
'suj22/sofey_20151007.141717.712002/vision.csv';
];
visionfilelist=cellstr(lst);
nav=[
'suj1/sofey_browserdata_20150622.171405.491/navegacion.csv ';
'suj2/sofey_browserdata_20150623.151646.478/navegacion.csv ';
'suj3/sofey_browserdata_20150623.171333.420/navegacion.csv ';
'suj4/sofey_browserdata_20150624.154353.349/navegacion.csv ';
'suj5/sofey_browserdata_20150625.133416.245/navegacion.csv ';
'suj6/sofey_browserdata_20150625.183445.901/navegacion.csv ';
'suj7/sofey_browserdata_20150626.114008.736/navegacion.csv ';
'suj8/sofey_browserdata_20150626.132830.903/navegacion.csv ';
'suj9/sofey_browserdata_20150630.152003.317/navegacion.csv ';
'suj10/sofey_browserdata_20150701.122829.871/navegacion.csv';
'suj11/sofey_browserdata_20150701.142332.043/navegacion.csv';
'suj12/sofey_browserdata_20150702.105035.551/navegacion.csv';
'suj13/sofey_browserdata_20150702.143358.912/navegacion.csv';
'suj14/sofey_browserdata_20150702.172444.235/navegacion.csv';
'suj15/sofey_browserdata_20150708.160401.530/navegacion.csv';
'suj16/sofey_browserdata_20150710.103942.244/navegacion.csv';
'suj17/sofey_browserdata_20150710.130140.316/navegacion.csv';
'suj19/sofey_browserdata_20150713.103756.244/navegacion.csv';
'suj20/sofey_browserdata_20150714.132419.903/navegacion.csv';
'NONE                                                      ';
'suj22/sofey_browserdata_20151007.143255.680/navegacion.csv';
];
navfilelist=cellstr(nav);
eeg_aux=[
    'suj1/lalo1-lalo1-22.06.15.17.13.43.edf   ';
'suj2/lalo2-lalo2-23.06.15.15.16.34.edf   ';
'suj3/lalo3-lalo3-23.06.15.17.13.19.edf   ';
'suj4/lalo4-lalo4-24.06.15.15.43.41.edf   ';
'suj5/lalo5-lalo5-25.06.15.13.34.03.edf   ';
'suj6/6-6-25.06.15.18.34.33.edf           ';
'suj7/lalo7-lalo7-26.06.15.11.39.56.edf   ';
'NONE                                     ';
'suj9/lalo9-lalo9-30.06.15.15.19.42.edf   ';
'suj10/lalo10-lalo10-01.07.15.12.28.08.edf';
'suj11/lalo11-lalo11-01.07.15.14.23.21.edf';
'suj12/lalo12-lalo12-02.07.15.10.50.30.edf';
'suj13/lalo13-lalo13-02.07.15.14.33.39.edf';
'suj14/lalo14-lalo14-02.07.15.17.24.39.edf';
'suj15/lalo15-lalo15-08.07.15.16.03.51.edf';
'suj16/lalo16-lalo16-10.07.15.10.39.18.edf';
'suj17/lalo17-lalo17-10.07.15.13.01.30.edf';
'suj19/lalo19-lalo19-13.07.15.10.37.46.edf';
'suj20/lalo20-lalo20-14.07.15.13.24.10.edf';
'suj18/lalo18-lalo18-10.07.15.15.36.23.edf';
];
eegStartTimes=[
   
    datenum('20150622.171343.164497','yyyymmdd.HHMMSS.FFF');
    datenum('20150623.151634.741070','yyyymmdd.HHMMSS.FFF');
    datenum('20150623.171319.591115','yyyymmdd.HHMMSS.FFF');
    datenum('20150624.154341.698938','yyyymmdd.HHMMSS.FFF');
    datenum('20150625.133403.367263','yyyymmdd.HHMMSS.FFF');
datenum('20150625.183433.922126','yyyymmdd.HHMMSS.FFF');
datenum('20150626.113956.483999','yyyymmdd.HHMMSS.FFF');
0.0;
datenum('20150630.151942.870924','yyyymmdd.HHMMSS.FFF');
datenum('20150701.122808.655676','yyyymmdd.HHMMSS.FFF');
datenum('20150701.142321.693212','yyyymmdd.HHMMSS.FFF');
datenum('20150702.105030.922792','yyyymmdd.HHMMSS.FFF');
datenum('20150702.143339.776590','yyyymmdd.HHMMSS.FFF');
datenum('20150702.172439.793095','yyyymmdd.HHMMSS.FFF');
datenum('20150708.160351.955038','yyyymmdd.HHMMSS.FFF');
datenum('20150710.103919.051698','yyyymmdd.HHMMSS.FFF');
datenum('20150710.130130.888433','yyyymmdd.HHMMSS.FFF');
datenum('20150713.103746.401921','yyyymmdd.HHMMSS.FFF');
datenum('20150714.132410.321490','yyyymmdd.HHMMSS.FFF');
datenum('20150710.153623.500000','yyyymmdd.HHMMSS.FFF'); %milliseconds are invented
    ];
eeglist=cellstr(eeg_aux);
questions=[ %sorted 
'bi_apps       ';
'columbia_about';
'columbia_adm  ';
'columbia_nobel';
'ds_argentina  ';
'ds_berlin     ';
'ds_eggs       ';
'ds_instagram  ';
'ds_london     ';
'emol_vino     ';
'enfemDiez     ';
'enfemRecetas  ';
'es_berlin     ';
'gq_autos      ';
'gq_bit        ';
'gq_secuelas   ';
'primer_battery';
'primer_beer   ';
'uncrate_phones';
'werd_rides    ';
'wharton_phd   ';
'wiki_paine    ';
'wiki_pisco    ';
'wired_note    ';
    ];



questionlist=cellstr(questions);

maleWebsitesaux=[
    'gq_secuelas   ';
    'gq_bitbite    ';
    'gq_autos      ';
    'wired         ';
    'primer_battery';
    'primer_beer   ';
    'bi_apps       '
    'werd_rides    ';
    'uncrate_phones';
    ];
femaleWebsitesaux=[
    'es_berlin    ';
    'ds_eggs      ';
    'ds_berlin    ';
    'ds_london    ';
    'ds_instagram ';
    'ds_argentina ';
    'enfem_diez   ';
    'enfem_recetas';
    'dc_manhattan ';
   
    ];
neutralWebsitesaux=[
    'science_cat   ';
    'science_mag   '; 
    'columbia_about';
    'columbia_adm  ';
    'columbia_nobel';
    'wharton_phd   ';
    'emol_vino     ';
    'wiki_pisco    ';
    'wiki_paine    ';
      
    ];
allWebsitesAux=[
    'gq_secuelas   ';
    'gq_bitbite    ';
    'gq_autos      ';
    'wired         ';
    'primer_battery';
    'primer_beer   ';
    'bi_apps       '
    'werd_rides    ';
    'uncrate_phones';
    'es_berlin     ';
    'ds_eggs       ';
    'ds_berlin     ';
    'ds_london     ';
    'ds_instagram  ';
    'ds_argentina  ';
    'enfem_diez    ';
    'enfem_recetas ';
    'dc_manhattan  ';
    'science_cat   ';
    'science_mag   '; 
    'columbia_about';
    'columbia_adm  ';
    'columbia_nobel';
    'wharton_phd   ';
    'emol_vino     ';
    'wiki_pisco    ';
    'wiki_paine    ';
];

maleSubjects=[1;2;3;4;5;6;7;8;9;10;];
femaleSubjects=[11;12;13;14;15;16;17;18;19;20;];
allSubjects=[1;2;3;4;5;6;7;8;9;10;11;12;13;14;15;16;17;18;19;20;];

maleWebsites=cellstr(maleWebsitesaux);
neutralWebsites=cellstr(neutralWebsitesaux);
femaleWebsites=cellstr(femaleWebsitesaux);
allWebsites=cellstr(allWebsitesAux);
end

