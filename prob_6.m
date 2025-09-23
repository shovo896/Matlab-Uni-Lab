% 23024006
clc;
clear;
close all;

% Parameters
Am = 1;            % Amplitude of message signal
Ac = 1;            % Amplitude of carrier signal
fm = 5;            % Message frequency (Hz)
fc = 50;           % Carrier frequency (Hz)
kf = 50;           % Frequency sensitivity
fs = 1000;         % Sampling frequency
t = 0:1/fs:1;      % Time vector (1 second duration)

% Message signal (modulating signal)
m_t = Am * sin(2 * pi * fm * t);

% Carrier signal
c_t = Ac * cos(2 * pi * fc * t);

% Frequency Modulated Signal
int_m = cumsum(m_t) / fs; % Integration of message signal
s_t = Ac * cos(2 * pi * fc * t + 2 * pi * kf * int_m);

% Plotting
figure;

subplot(3,1,1);
plot(t, m_t, 'b', 'LineWidth', 1.5);
xlabel('Time (s)');
ylabel('Amplitude');
title('Message Signal');
grid on;

subplot(3,1,2);
plot(t, c_t, 'r', 'LineWidth', 1.5);
xlabel('Time (s)');
ylabel('Amplitude');
title('Carrier Signal');
grid on;

subplot(3,1,3);
plot(t, s_t, 'k', 'LineWidth', 1.5);
xlabel('Time (s)');
ylabel('Amplitude');
title('FM Signal');
grid on;

% Spectrum Analysis
figure;
N = length(s_t);
f = (-fs/2:fs/N:fs/2-fs/N);
S = fftshift(abs(fft(s_t))/N);

plot(f, S, 'm', 'LineWidth', 1.5);
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('Spectrum of FM Signal');
grid on;
