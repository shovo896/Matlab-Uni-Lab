clc;
clear tf ;
close all;


L = 1e-3;        % Inductance (H)
C = 1e-6;        % Capacitance (F)
R = 10;          % Resistance (Ohm) -> এটা আগে define করতে হবে
v = 1;           % Input amplitude

num = [1]; 
den = [L*C, R*C, 1];   % Proper denominator coefficients

sys = tf(num, den);    % Transfer function তৈরি করা হলো

t = linspace(0,1,1000);
x = step(v*sys, t);

plot(t, x, 'LineWidth', 1.5);
title('Series RLC Circuit Analysis');
xlabel('Time (s)');
ylabel('Voltage (V)');
grid on;
