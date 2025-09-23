% Transmission Line Impedance
L = 0.5e-6; % Inductance per unit length (H/m)
C = 2e-12; % Capacitance per unit length (F/m)
Z0 = sqrt(L/C); % Characteristic impedance
disp(['Characteristic Impedance: ', num2str(Z0), ' Ohms']);