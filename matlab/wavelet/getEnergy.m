function E=getEnergy(mySignal)
    waveletFunction='db4';
    [C,L] = wavedec(mySignal,4,waveletFunction);
    E = zeros(1,4);
    for j = 1:3
        en = sum(detcoef(C,L,j+1).^2);
        E(j)= en;
    end
    E(4)=sum(appcoef(C,L,waveletFunction,4).^2);
    
end
