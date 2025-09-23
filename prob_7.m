% Corrected MATLAB Code for V_CE Calculation

clc;
clear;

% Given Parameters
V_CC = 10;           % Supply voltage in volts
I_B = 50e-6;         % Base current in amperes (50 µA)
beta = 100;          % Current gain (hFE) of the transistor
R_C = 1e3;           % Collector resistor in ohms (1 kΩ)

% Calculations
I_C = beta * I_B;           % Collector current in amperes
V_CE = V_CC - (I_C * R_C);  % Collector-Emitter voltage

% Display Result
disp(['Collector-Emitter Voltage (V_CE): ', num2str(V_CE), ' V']);
