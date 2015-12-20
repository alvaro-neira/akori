%MASK2RGB Transforms B&W mask to color RGB mask
%
%   For example:
%
%       mask = fspecial('gaussian',[100 100],0.5);
%       rgbMask = mask2rgb(mask);
%       imshow(rgbMask);
%
%   Will show each value in mask as a color, where is suposed that mask is
%   normalized and a 2D matrix. Colors near max are red, and near 0 are
%   blue like in a heatmap.
%
function rgbMask = mask2rgb(mask)

    mSize = size(mask);
    rgbMask = zeros(mSize(1),mSize(2),3);
    
    for i = 1:mSize(1)
        for j = 1:mSize(2)
            r = (mask(i,j)>0.5)*(mask(i,j)-0.5)*2;
            b = (mask(i,j)<0.5)*(0.5-mask(i,j))*2;
            g = 1 - r - b;
            
            rgbMask(i,j,:) = [r g b];
        end
    end

end