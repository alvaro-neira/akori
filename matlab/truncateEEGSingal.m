function [ res, newLength ] = truncateEEGSingal( signal )
    len=length(signal);
    if len>8192 || len<128
        error(strcat('len>8192 || len<128, len=',num2str(len)));
    end
    if len>=128 && len <256
        newLength=128;
  
    
    elseif len>=256 && len<512
        newLength=256;
        
    elseif len>=512&& len<1024
        newLength=512;
    
        
     elseif len>=1024 && len<2048
        newLength=1024;
    elseif len>=2048 && len<4096    
        newLength=2048;
    else
        newLength=4096;
    end
    
    res=signal(1:newLength,:);

end

