function [ A4, D4, D3, D2, A1 ] = getWaveletCoefficients( signal )
    global QMF;
    [wcoef] = FWT_PO(truncateEEGSingal(signal),3,QMF);
    len=length(wcoef);
    if len ~= 128 && len ~= 256 && len ~= 512 && len ~= 1024&& len ~= 2048&& len ~= 4096
        error(strcat('len ~= 256 && len ~= 128 && len ~= 512 && len ~= 1024&& len ~= 2048&& len ~= 4096, len=',num2str(len)));
    end
    if len==128
        A4=wcoef(1:8);
        D4=wcoef(9:16);
        D3=wcoef(17:32);
        D2=wcoef(33:64);
        A1=wcoef(65:128);
        return;
    elseif len==256
        A4=wcoef(1:16);
        D4=wcoef(17:32);
        D3=wcoef(33:64);
        D2=wcoef(65:128);
        A1=wcoef(129:256);
        return;
    elseif len==512
        
        A4=wcoef(1:32);
        D4=wcoef(33:64);
        D3=wcoef(65:128);
        D2=wcoef(129:256);
        A1=wcoef(257:512);
        
        return;
    
    elseif len==1024
        
        
        A4=wcoef(1:64);
        D4=wcoef(65:128);
        D3=wcoef(129:256);
        D2=wcoef(257:512);
        A1=wcoef(513:1024);
        
        return;
    elseif len==2048
        
        
        
        A4=wcoef(1:128);
        D4=wcoef(129:256);
        D3=wcoef(257:512);
        D2=wcoef(513:1024);
        A1=wcoef(1025:2048);
        
        return;
    elseif len==4096
        
        
        
        
        A4=wcoef(1:256);
        D4=wcoef(257:512);
        D3=wcoef(513:1024);
        D2=wcoef(1025:2048);
         A1=wcoef(2049:4096);
        
        return;
    end
    error('Coefficients not set');
    
end

