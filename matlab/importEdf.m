%[data,header]=readedf('/Users/aneira/lalo/data/suj2/lalo2-lalo2-23.06.15.15.16.34.edf')
% EEG.chanlocs(1).labels
% EEG.chanlocs(2).labels
% EEG.chanlocs(3).labels

function [ ts, o1, o2 ] = importEdf( filename )
    if ~exist(filename, 'file')
        error('edf file does not exist');
    end
    EEG = pop_biosig(filename);
    ts=transpose(EEG.times);
    eeg=transpose(EEG.data);
    o1=eeg(:,9);
    o2=eeg(:,10);
end

