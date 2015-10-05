addpath internal;

maxx=1920;
maxy=1080;
datapath='/Users/aneira/lalo/data/';
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
'suj18/sofey_browserdata_20150710.153632.395/navegacion.csv';
'suj19/sofey_browserdata_20150713.103756.244/navegacion.csv';
'suj20/sofey_browserdata_20150714.132419.903/navegacion.csv';
];
filelist=cellstr(lst);
filelist2=cellstr(nav);
for filecounter=3:3 %length(filelist)
    filename = strcat(datapath,char(filelist(filecounter)));
    filename2 = strcat(datapath,char(filelist2(filecounter)));
    [timestamp,frame_number,gaze_x,gaze_y,pupil_axis1,pupil_axis2,pupil_area,saccade,blink]=importVision(filename);
    nrows=length(timestamp);
    [timestamp2,outerWidth,outerHeight,innerWidth,innerHeight,screenX,screenY,scrollTop,scrollLeft,url_id,url] = importNavegacion(filename2);
    for i=1:nrows
        if gaze_x(i) < 1
            gaze_x(i)=1;
        end
        if gaze_y(i) < 1
            gaze_y(i)=1;
        end
        if gaze_x(i) > maxx
            gaze_x(i)=maxx;
        end
        if gaze_y(i) > maxy
            gaze_y(i)=maxy;
        end
    end    
    
    plot(timestamp2double(timestamp),gaze_x,'r',timestamp2double(timestamp2),scrollTop,'b');
    %h = zoom;
    %set(h,'Motion','horizontal','Enable','on');
    
end