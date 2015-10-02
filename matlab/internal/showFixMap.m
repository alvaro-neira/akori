%SHOWFIXMAP Shows fixation map using the complementary 'sc' library
%
%   For example:
%
%       showFixMap(image,fixMap);
%
%   Will show 'image' as a black&white background with fixMap as a heatmap
%   over it. Both image and fixMap are 2D matrixes.
%
function showFixMap(image,fixMap)

    addpath ../sc
    im = sc(fixMap,'hsv').*sc(fixMap,'gray')+sc(image,'rgb2gray');
    sc(im);

end