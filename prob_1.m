% Diode Clipper Circuit
t = 0:0.001:1; % Time vector
Vi = 5*sin(2*pi*50*t); % Input sine wave
Vd = 0.7; % Diode forward voltage
Vo = Vi;
Vo(Vi > Vd) = Vd;
Vo(Vi < -Vd) = -Vd;
plot(t, Vi, t, Vo);
title('Diode Clipper Circuit');
xlabel('Time (s)');
ylabel('Voltage (V)');
legend('Input Voltage', 'Output Voltage');