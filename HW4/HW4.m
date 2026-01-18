% Define the parameters of the filter
R1 = 1.6*10e3;   % Resistor 1 value in Ohms
R2 = 0.16*10e3;   % Resistor 2 value in Ohms
C1 = 1e-6;   % Capacitor value in Farads

% Define the transfer function of the active low-pass filter
num = [1/(R1*R2*C1)];
den = [1, 1/(R1*C1), 1/(R1*R2*C1)];

% Create a transfer function object
H = tf(num, den);

% Plot the Bode plot
bode(H);
title('Bode Plot of Active Low-Pass Filter');