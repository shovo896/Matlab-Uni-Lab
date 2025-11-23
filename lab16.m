x_tau = zeros(size(tau));
x_tau(tau >= 0 & tau <= 1) = tau(tau >= 0 & tau <= 1);
x_tau(tau > 1 & tau <= 2) = 2 - tau(tau > 1 & tau <= 2);
h_tau = zeros(size(tau));
h_tau(tau >= 0 & tau <= 1) = 1 - tau(tau >= 0 & tau <= 1);
t0_list = [0, 0.6, 1.2, 1.8, 2.4, 3.0];
figure('Color','w','Name','Convolution stages');
tiledlayout(2, numel(t0_list), 'Padding','compact', 'TileSpacing','compact');
for k = 1:numel(t0_list)
t0 = t0_list(k);
% flipped & shifted h: h(t0 - tau)
h_flip_shift = zeros(size(tau));
% Map h(t) support [0,1] -> (t0 - tau) in [0,1] <=> tau in [t0-1, t0]
mask = (tau >= t0-1) & (tau <= t0);
% On that interval, h(t0 - tau) = 1 - (t0 - tau) = (tau - t0 + 1)
h_flip_shift(mask) = 1 - (t0 - tau(mask));
% pointwise product for integrand
prod_tau = x_tau .* h_flip_shift;
% numerical area (approx) equals y(t0)
y_t0 = sum(prod_tau) * dt;
% --- Row 1: overlay x(tau) and h(t0 - tau)
nexttile(k);
plot(tau, x_tau, 'LineWidth', 1.6); hold on;
plot(tau, h_flip_shift, 'LineWidth', 1.6);
grid on; xlim([tau_min tau_max]); ylim([0 1.1]);
title(sprintf('t_0 = %.2f: x(\\tau) & h(t_0-\\tau)', t0));
legend('x(\tau)','h(t_0-\tau)','Location','northwest');
% --- Row 2: product (integrand)
nexttile(k + numel(t0_list));
area(tau, prod_tau, 'FaceAlpha', 0.15, 'LineWidth', 1.2); hold on;
plot(tau, prod_tau, 'LineWidth', 1.2);
grid on; xlim([tau_min tau_max]); ylim([0 1.1]);
title(sprintf('Product, y(%.2f) \\approx %.4f', t0, y_t0));
xlabel('\tau');
end 

for k=1:numel(t0_list)
    t0=t0_list(k);
    h_flip_shift=zeros(size(tau));
    h_flip_shift(mask) = 1 - (t0 - tau(mask));
    prod_tau = x_tau .* h_flip_shift;
    y_t0 = sum(prod_tau) * dt;

    nexttile(k);
    plot(tau, x_tau, 'LineWidth', 1.6); hold on;
    plot(tau, h_flip_shift, 'LineWidth', 1.6);
    grid on; xlim([tau_min tau_max]); ylim([0 1.1]);
    title(sprintf('t_0 = %.2f: x(\\tau) & h(t_0-\\tau)', t0));
    legend('x(\tau)','h(t_0-\tau)','Location','northwest');
    nexttile(k + numel(t0_list));
    area(tau, prod_tau, 'FaceAlpha', 0.15, 'LineWidth', 1.2); hold on;
    plot(tau, prod_tau, 'LineWidth', 1.2);
    grid on; xlim([tau_min tau_max]); ylim([0 1.1]);
    title(sprintf('Product, y(%.2f) \\approx %.4f', t0, y_t0));
    xlabel('\tau');
end 
