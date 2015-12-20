function E=getBand(mySignal)
    waveletFunction='db4';
    [C,L] = wavedec(mySignal,4,waveletFunction);
    [Ea Eb] = wenergy(C,L);
    E = [Eb Ea];

%Calculation The Coificients Vectors of every Band 
 
%cD1 = detcoef(C,L,1); %NOISY 
cD1 = detcoef(C,L,1); %Gamma 
cD2 = detcoef(C,L,2); %Beta 
cD3 = detcoef(C,L,3); %Alpha 
cD4 = detcoef(C,L,4); %Theta 
cA4 = appcoef(C,L,waveletFunction,4); %Delta
 
 %Calculation the Details Vectors of every Band : 

%D1 = wrcoef('d',C,L,waveletFunction,1); %NOISY 
%D2 = wrcoef('d',C,L,waveletFunction,2); %Gamma 
%D3 = wrcoef('d',C,L,waveletFunction,3); %Beta 
%D4 = wrcoef('d',C,L,waveletFunction,4); %Alpha 
%D5 = wrcoef('d',C,L,waveletFunction,5); %Theta 
%A5 = wrcoef('a',C,L,waveletFunction,5); %Delta

%Gamma = D2; figure, plot(1:1:length(Gamma),Gamma); 
%Beta = D3; figure, plot(1:1:length(Beta), Beta); 
%Alpha = D4; figure, plot(1:1:length(Alpha),Alpha); 
%Theta = D5; figure, plot(1:1:length(Theta),Theta); 
%Delta = A5; figure, plot(1:1:length(Delta),Delta);

end
% Call The Function : 
% Fs = 256; t = 0:1/Fs:1; mySignal = sin(2*pi*t); 
% waveletFunction = 'db4'; 
%[Gamma,Beta,Alpha,Theta,Delta]=getBand(mySignal,waveletFunction);