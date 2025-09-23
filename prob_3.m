% Phase Shift in RC Circuit
R = 1e3; % Resistance in ohms
C = 1e-6; % Capacitance in farads
f = 1000; % Frequency in Hz
omega = 2*pi*f; % Angular frequency
phi = atan(1/(omega*R*C)); % Phase shift
disp(['Phase Shift: ', num2str(rad2deg(phi)), ' degrees']);