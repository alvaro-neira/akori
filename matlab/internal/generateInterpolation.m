%GENERATEINTERPOLATION Linear interpolation of npoints between two points.
%
%   For example:
%
%       generateInterpolation(0,1,3);
%
%   Will output:
%       
%       [0 0.5 1]
%
%   Another example:
%
%       generateInterpolation(0,1,4);
%
%   Will output:
%
%       [0 0.3333 0.6667 1]
%
%   Note that this function is used internally by other functions, for more
%   information about where this function is used
%   SEE ALSO interpolateBlinks
%
function output = generateInterpolation(firstNumber,secondNumber,Npoints)

    x = 1:Npoints;
    output = secondNumber - (secondNumber-firstNumber)/(x(end)-x(1))*(x(end)-x);

end