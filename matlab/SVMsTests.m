function [  ] = SVMsTests( P, counters, totalSamples, title )
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
   

    [h, nPartitions, depth]=size(P);
    nFeatures=depth-1;
    fid = fopen(strcat('modelos_',title,'.txt'),'w');
    fprintf(fid,strcat('title=',title,'\n'));

    for partitionToSkip=1:nPartitions
        heightToSkip=counters(partitionToSkip);
        height=totalSamples-heightToSkip;
        Ytest=zeros(heightToSkip,1);
        Ypredicted=zeros(heightToSkip,1);

        Y=[];
        X=zeros(height,nFeatures);
       
        ycounter=0;
        for partitionNumber=1:nPartitions
            if partitionNumber==partitionToSkip
                continue;
            end
            for i=1:counters(partitionNumber)
                if P(i,partitionNumber,depth)
                    Y(ycounter+i,1)=1;%cellstr(HOMBRE);
                else
                    Y(ycounter+i,1)=0;%cellstr(MUJER);
                end
                for j=1:nFeatures
                    X(ycounter+i,j)=P(i,partitionNumber,j);
                end
            end
            ycounter=ycounter+counters(partitionNumber);
        end
%       SVMModel=fitcsvm(X,Y,'KernelFunction','rbf','Standardize',true,'ClassNames',{MUJER,HOMBRE });
%       SVMModel=fitcsvm(X,Y,'KernelFunction','linear','Standardize',true,'ClassNames',{MUJER,HOMBRE });
%         SVMModel=fitcsvm(X,Y,'KernelFunction','polynomial','PolynomialOrder',2,'Standardize',true); 

%          SVMModel = lassoglm (X,Y,'binomial','Lambda',10) ;
%         label=glmval(B,X,'logit') ;

SVMModel=fitglm(X,Y,'Distribution','binomial'); %te entrega todo el modelo. Creo q Y puede ser {hombre, mujer}

Ypredicted=predict(SVMModel,X);  %Luego es lo mismo
        
        %Testing
        Xtest=zeros(heightToSkip,nFeatures);
        testLength=heightToSkip;
        for i=1:testLength
            for j=1:nFeatures
                Xtest(i,j)=P(i,partitionToSkip,j);
            end
        end
        for i=1:testLength
            Ytest(i)=P(i,partitionToSkip,depth);
        end
        labels = predict(SVMModel,Xtest); 
        for i=1:testLength
            
            Ypredicted(i)=labels(i);
        end

        C=confusionmat(Ytest,Ypredicted);
        VP=C(1,1);
        FN=C(1,2);
        FP=C(2,1);
        VN=C(2,2);
        recall= VP/(VP+FN);
        precision= VP/(VP+FP);
        accuracy= (VP+VN)/(VP+VN+FP+FN);

        disp(strcat('recall=',num2str(recall),',precision=',num2str(precision),',accuracy=',num2str(accuracy)));
        
            fprintf(fid,strcat('recall=',num2str(recall),',precision=',num2str(precision),',accuracy=',num2str(accuracy),'\n'));

        
    
    end
    fprintf(fid,'DONE\n');
    fclose(fid);
end

