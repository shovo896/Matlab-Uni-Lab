clc ;
close all;
b = [1 2]; 
a = [1 0.1 -1];
N1 = 0:30;
delta = [1, zeros(1, numel(N1)-1)];
h = filter(b, a, delta);

figure('Color','w','Name','Impulse and Step Responses');
subplot(2,1,1);
stem(N1, h, 'filled'); grid on;
xlabel('n'); ylabel('h[n]');
title('4.1 Impulse response h[n] (0 \leq n \leq 30)');

u = ones(1, numel(N1)); % u[n]
r = filter(b, a, u);
subplot(2,1,2);
stem(N1, r, 'filled'); grid on;
xlabel('n'); ylabel('r[n]');
title('4.2 Step response r[n] (0 \leq n \leq 30)');

N2 = 0:50;
x = (0.8.^N2) .* cos(N2);
y = filter(b, a, x);

figure('Color','w','Name','Response to x[n] = 0.8^n cos(n)');
subplot(2,1,1);
stem(N2, x, 'filled'); grid on;
xlabel('n'); ylabel('x[n]');
title('Input: x[n] = 0.8^n cos(n) (0 \leq n \leq 50)');
subplot(2,1,2);
stem(N2, y, 'filled'); grid on;
xlabel('n'); ylabel('y[n]');
title('4.3 Output y[n] for x[n] = 0.8^n cos(n)');
