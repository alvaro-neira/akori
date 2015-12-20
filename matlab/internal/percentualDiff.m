function output = percentualDiff(input)

    mySizes = size(input);
  
    switch true
        case mySizes(1) > mySizes(2)
            output = [0; 100*diff(input)./abs(input(1:end-1))];
            
        case mySizes(1) < mySizes(2)
            output = [0 100*diff(input)./abs(input(1:end-1))];
        
        otherwise
            disp('percentualDiff function is not meant to be used in a non-vector matrix')
            output = -1;
    end

end