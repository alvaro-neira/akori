%MEANNONAN Returns mean of a vector ignoring nan data
%
%   For example:
%
%       res = meanNoNan([1 NaN 3]);
%
%       Gives res = 2.
%
function myMean = meanNoNan(input)

    count = 0;
    total = 0;
    
    for i = 1:length(input)
       if ~isnan(input(i))
           count = count + 1;
           total = total + input(i);
       end
    end
    if count > 0
        myMean = total/count;
    else
        myMean = 0;
    end

end