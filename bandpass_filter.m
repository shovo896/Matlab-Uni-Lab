
Fs = 1000;
Fpass1 = 100;
Fpass2 = 200;
N = 50;

bpFilt = designfilt('bandpassfir', ...
    'FilterOrder', N, ...
    'CutoffFrequency1', Fpass1, ...
    'CutoffFrequency2', Fpass2, ...
    'SampleRate', Fs);

fvtool(bpFilt);
title('Bandpass Filter Design');
