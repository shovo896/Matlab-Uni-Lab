% Amplitude Modulation
Fs = 10000; % Sampling frequency
t = 0:1/Fs:1-1/Fs;
Fc = 100; % Carrier frequency
Fm = 5; % Modulating frequency
Am = 1; % Modulating amplitude
carrier = cos(2*pi*Fc*t);
modulator = cos(2*pi*Fm*t);
am_signal = (1 + Am*modulator) .* carrier;
plot(t, am_signal);
title('Amplitude Modulated Signal');
xlabel('Time (s)');
ylabel('Amplitude');