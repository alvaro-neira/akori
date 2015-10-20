function [ res ] = getVectorNumeroSacadas( subjects,websites )
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


    len1=length(subjects);
    len2=length(websites);
    focusThreshold=1000;

    res=zeros(len1,1);
    for persona=1:len1
        subjectId=subjects(persona);
        [ timestamp_double, pupil_area_filtered, gx, gy, sacc, blk ] = getVisionData( subjectId );
        nfocuses=0;
        expectedFocusesSize=1000;
        fijacionesDePersona=zeros(expectedFocusesSize,1);
        numeroFijaciones=0;
        for pregunta=1:len2
            userFocuses=getFocuses(subjectId,websites(pregunta),focusThreshold,timestamp_double,...
                pupil_area_filtered,gx,gy,sacc,blk);
            [len3 wid]=size(userFocuses);
            for i=1:len3
                fijacionesDePersona(nfocuses+i)=userFocuses(i,2)-userFocuses(i,1);
            end
            nfocuses=nfocuses+len3;
            numeroFijaciones=numeroFijaciones+len3;

        end
        fijacionesDePersona=fijacionesDePersona(1:numeroFijaciones,:);
        nSacadasTotal=getSaccadesBySubject(subjectId,websites);
        duracionTotal=getDuracionTotal(subjectId,websites);

        % escalas de acuerdo a la tabla

         res(persona)=nSacadasTotal/((duracionTotal/ms)/1000);

      


    end


end

