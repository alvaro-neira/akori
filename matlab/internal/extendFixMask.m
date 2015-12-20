%EXTENDFIXMASK Extends fixation matrix using gaussian kernel&convolution
%
%   For example:
%
%       newMask = extendFixMask(mask,3,0.5);
%
%   Will return a newMask with same dimensions as mask where each point
%   has been extended using a 3x3 gaussian kernel with a sigma of 0.5
%
function newMask = extendFixMask(mask,radius,sigma)

    %Create convolution matrix
    B = fspecial('gaussian',[radius radius],sigma);
    
    newMask = conv2(mask,B,'same');
    
    %Re-normalize
    newMask = newMask/max(max(newMask));

end