B1=imread('/Users/aneira/lalo/data/pngs/science_mag_mask.bmp');
B=transpose(B1(:,:,1));
%     image(B)
[width height dim]=size(B);
rect=zeros(100,4);

rectangleCounter=1;
rownumber=1;
while rownumber<=height && ~exitOuterLoop
   for columnnumber=1:width
       
        pix=B(columnnumber,rownumber);
        if rect(rectangleCounter,1) > 0
            if pix == 255
                 
                rect(rectangleCounter,3)=columnnumber-rect(rectangleCounter,1)-1;
                rectangleCounter=rectangleCounter+1;
                
                continue;
                
            end
        else
            if pix ~= 255
                 
                %Check already detected rectangles with brute force
                if isAlreadySaved( rect, rectangleCounter, columnnumber, rownumber )
                    continue;
                end
                rect(rectangleCounter,1)=columnnumber;
                rect(rectangleCounter,2)=rownumber;   
                for rownumber2=rownumber:height
                    pix2=B(columnnumber,rownumber2);
                    if pix2 == 255
                        rect(rectangleCounter,4)=rownumber2-rect(rectangleCounter,2)-1;
                        
                        break;
                    end
                end
            end
        end
        
    end
   
    rownumber=rownumber+1;
end
rect(1:rectangleCounter-1,:)
xlswrite('tuhermana.csv',rect(1:rectangleCounter-1,:));
