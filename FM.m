%frequenhcy modulation 
Fs=1000;
Fs=0:1/Fs:1-1/Fs;
Fm=1000;
Fc=100;
Am=1;
beta=5;
fm_signal=cos(2*pi*Fc*t+beta*sin(2*pi*Fm*t));
plot(t,fm_signal);
title('Frequency moldulated signal');
xlabel('Time');
ylabel('Amplitude');
