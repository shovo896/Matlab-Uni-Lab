x_true = 0.7*cos(2*pi*3*t) + 0.3*sin(2*pi*7*t); % bounded test signal
y_true = D(x_true);
x_rec = Int(y_true, x_true(1)); 
rmse = sqrt(mean((x_rec - x_true).^2));
is_invertible = rmse < 1e-3; 
fprintf('1.6 Invertible (up to constant)? %s (RMSE = %.3e)\n', onoff(is_invertible), rmse);
figure('Name','Invertibility demo');
plot(t, x_true, 'LineWidth',1.6); hold on;
plot(t, x_rec, '--', 'LineWidth',1.6);
grid on; legend('Original x(t)','Recovered by integrating D{x}');
title(sprintf('Reconstruction (RMSE = %.2e)', rmse));
function s = onoff(tf)
if tf, s = 'YES'; else, s = 'NO'; end
end
