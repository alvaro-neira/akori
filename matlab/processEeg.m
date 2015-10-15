%[data,header]=readedf('/Users/aneira/lalo/data/suj2/lalo2-lalo2-23.06.15.15.16.34.edf')
EEG = pop_biosig('/Users/aneira/lalo/data/suj2/lalo2-lalo2-23.06.15.15.16.34.edf');
ts=transpose(EEG.times);
eeg=transpose(EEG.data);
EEG.chanlocs(1).labels
EEG.chanlocs(2).labels
EEG.chanlocs(3).labels