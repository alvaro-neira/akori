function [ maxx, datapath, url_prefix, xoffsets, yoffsets, maxy, ...
    filelist, filelist2,questionlist, ms, coordinates_path, ...
    focusThreshold, minDepth, maleWebsites,maleSubjects,femaleWebsites,...
    femaleSubjects,neutralWebsites,allSubjects, allWebsites] = hardCodedData( )
maxx=1920;
datapath='/Users/aneira/lalo/data/';
coordinates_path='/Users/aneira/results/';
url_prefix='file:///C:/Users/Gino/Desktop/websites/';
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
focusThreshold=200;
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
'suj22/sofey_20151007.141717.712002/vision.csv';
];
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
'suj22/sofey_browserdata_20151007.143255.680/navegacion.csv';
];
questions=[
    'columbia_about';
    'ds_eggs       ';
    'ds_instagram  ';
    'ds_london     ';
    'enfem_diez    ';
    ];
    
filelist=cellstr(lst);
filelist2=cellstr(nav);
questionlist=cellstr(questions);
minDepth=3;
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
    %'science_mag   '; //missing
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
    %'science_mag   '; //missing
    'columbia_about';
    'columbia_adm  ';
    'columbia_nobel';
    'wharton_phd   ';
    'emol_vino     ';
    'wiki_pisco    ';
    'wiki_paine    ';
];

maleSubjects=[1;2;3;4;5;6;7;8;9;10;];
femaleSubjects=[11;12;13;14;15;16;17;18;19;];
allSubjects=[1;2;3;4;5;6;7;8;9;10;11;12;13;14;15;16;17;18;19;];

maleWebsites=cellstr(maleWebsitesaux);
neutralWebsites=cellstr(neutralWebsitesaux);
femaleWebsites=cellstr(femaleWebsitesaux);
allWebsites=cellstr(allWebsitesAux);
end

