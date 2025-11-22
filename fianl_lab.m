clc ;
close all; 
clear all ;

fs=1000;
dt=1/fs;
T=2;
t=0:dt:T;
N=numel(t);
tol=1e-10;
D=@(x) [0 diff(x)]/dt;
int=@(y,xo) [zeros(1,k),x(1:end-k)];
shift=@(x,k) [zeros(1,k),x(1:end-k)];

fprintf('Numerical determination for y determintion ');
rng(0);
x1=randn(1,N);
x2=randn(1,N);
a=-1.7;
b=0.8;
lhs=D(a*x1+b*x2);
rhs=a*D(x1)+b*D(x2);
lin_err=max(abs(lhs-rhs));
is_linear=lin_err <1e-9;
fprintf('(1.1 linear %(max error =%.3e)\n',onoff(is_linear),lin_err);


no=round(N/2);
xa=zeros(1,N);
xb=xa;
xa(no+1:end)=0;
xb(no+1:end)=randn(1,N-no);

yA = D(xA);
yB = D(xB);
causal_err = max(abs(yA(1:n0) - yB(1:n0)));
is_causal = causal_err < tol;
fprintf('1.2 Causal? %s (max diff up to n0 = %.3e)\n', onoff(is_causal), causal_err);


xc1 = zeros(1,N); xc2 = xc1;
k = n0; 
xc1(k) = 0;
xc2(k) = 0;
xc1(k-1) = 0; xc2(k-1) = 1;
yc1 = D(xc1); yc2 = D(xc2);
is_dynamic = abs(yc1(k) - yc2(k)) > tol;
fprintf('1.3 Dynamic (not memoryless)? %s\n', onoff(is_dynamic));

x = randn(1,N);
kshift = 123; 
lhs_ti = D(shift(x,kshift));
rhs_ti = shift(D(x),kshift);
ti_err = max(abs(lhs_ti - rhs_ti));
is_time_invariant = ti_err < 1e-9;
fprintf('1.4 Time-invariant? %s (max error = %.3e)\n', onoff(is_time_invariant), ti_err);

u = double(t >= 0.5); 
yu = D(u);
step_peak = max(abs(yu)); 
% sine test across frequencies
freqs = [1 5 10 20 50 100]; ampG = zeros(size(freqs));
for i = 1:numel(freqs)
f = freqs(i);
xs = sin(2*pi*f*t); 
ys = D(xs);
ampG(i) = max(abs(ys)); 
end

is_stable = (step_peak < 10) && all(diff(ampG) < 1e-3); % very strict, likely false
fprintf('1.5 BIBO-stable? %s (step peak ? %.2f, gain vs f increases)\n', onoff(is_stable), step_peak);

figure('Name','Stability evidence');
subplot(2,1,1);
plot(t, u, 'LineWidth',1.5); hold on;
plot(t, yu, 'LineWidth',1.2);
title('Step input and derivative (spike ~ 1/dt)'); grid on;
legend('u(t)','D\{u\}(t)');
subplot(2,1,2);
plot(freqs, ampG, '-o','LineWidth',1.5);
xlabel('Frequency (Hz)'); ylabel('Max |D{sin(2?ft)}|');
title('Output amplitude grows with frequency ? not BIBO-stable'); grid on;

x_true = 0.7*cos(2*pi*3*t) + 0.3*sin(2*pi*7*t); % bounded test signal
y_true = D(x_true);
x_rec = Int(y_true, x_true(1)); % use correct initial value
rmse = sqrt(mean((x_rec - x_true).^2));
is_invertible = rmse < 1e-3; % small error ? good inverse
fprintf('1.6 Invertible (up to constant)? %s (RMSE = %.3e)\n', onoff(is_invertible), rmse);

figure('Name','Invertibility demo');
plot(t, x_true, 'LineWidth',1.6); hold on;
plot(t, x_rec, '--', 'LineWidth',1.6);
grid on; legend('Original x(t)','Recovered by integrating D{x}');
title(sprintf('Reconstruction (RMSE = %.2e)', rmse));

function s = onoff(tf)
if tf, s = 'YES'; else, s = 'NO'; end
end
