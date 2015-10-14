B1=imread('/Users/aneira/lalo/data/pngs/science_mag_mask.bmp');
B=transpose(B1(:,:,1));%permute(B1,[2 1]);
%   image(B)
[width height dim]=size(B);
rect=zeros(100,4);
endloop1=0;
rectangleCounter=1;
for rownumber=1:height
    for columnnumber=1:width
        pix=B(columnnumber,rownumber);
        if rect(rectangleCounter,1) > 0
            if pix == 255
                rect(rectangleCounter,3)=columnnumber-rect(rectangleCounter,1);
                rectangleCounter=rectangleCounter+1;
                endloop1=1;
                break;
            end
        else
            if pix ~= 255
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
    if endloop1
        break;
    end
end