% Frequency Modulation
Fs = 10000; % Sampling frequency
t = 0:1/Fs:1-1/Fs;
Fc = 100; % Carrier frequency
Fm = 5; % Modulating frequency
Am = 1; % Modulating amplitude
beta = 5; % Modulation index
carrier = cos(2*pi*Fc*t);
modulator = cos(2*pi*Fm*t);
fm_signal = cos(2*pi*Fc*t + beta*sin(2*pi*Fm*t));
plot(t, fm_signal);
title('Frequency Modulated Signal');
xlabel('Time (s)');
ylabel('Amplitude');