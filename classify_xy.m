function classify_xt

u = @(t) double(t >= 0); % unit step
x = @(t) t .* (u(t) - u(t-8)); % x(t)
x2 = @(t) abs(x(t)).^2; % |x(t)|^2

E = integral(@(t) x2(t), -Inf, Inf, 'ArrayValued', true);
fprintf('Energy E = %.10f\n', E);
if isfinite(E) && E > 0
fprintf('Classification: ENERGY signal (0 < E < ?).\n');
else

T = 1e6; 
P = (1/(2*T)) * integral(@(t) x2(t), -T, T, 'ArrayValued', true);
fprintf('Approx. average power P ? %.6g\n', P);
if isfinite(P) && P > 0
fprintf('Classification: POWER signal (finite, nonzero average power).\n');
else
fprintf('Classification: NEITHER energy nor power.\n');
end
end
end
