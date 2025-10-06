%Ampliotude modulation 
Fs=1000;
t=0:1/Fs:1-1/Fs;
Fc = 1000 ;
Fm = 5;
Am=1 ;
carrier=cos(2*pi*Fc*t);
modulator=cos(2*pi*Fm*t);
am_signal=(1+Am*modulator).*carrier;
plot(t,am_signal);
title('Amplitude Modulated Signal');
xlabel('time(s)');
ylabel('Amplitude')
