clc;
close all;
clear;

fs = 1000;
dt = 1/fs;
T = 2;
t = 0:dt:T;
N = numel(t);
tol = 1e-10;

D = @(x) [0, diff(x)] / dt;
Int = @(y, x0) x0 + cumsum(y) * dt;
shift = @(x, k) [zeros(1, k), x(1:end-k)];

fprintf('lab ta ektu hard eeee\n\n');

rng(0);
x1 = randn(1, N);
x2 = randn(1, N);
a = -1.7;
b = 0.8;

lhs = D(a*x1 + b*x2);
rhs = a*D(x1) + b*D(x2);

lin_err = max(abs(lhs - rhs));
is_linear = lin_err < 1e-9;
 

if is_linear
    fprintf('amar e keu valobashe ni \nSystem is LINEAR (error = %.2e)\n', lin_err);
else
    fprintf('amar e keu valobashe ni \nSystem is NONLINEAR (error = %.2e)\n', lin_err);
end
