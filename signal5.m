try
opengl software; % stable fallback path
set(groot,'DefaultFigureRenderer','painters'); % safest 2D renderer
set(groot,'DefaultFigureGraphicsSmoothing','off'); % avoid driver bugs
catch ME
warning("Graphics fallback setup failed: %s", ME.message);
end
%% --- Define domain and functions ---
x = linspace(0,5,500); % 500 evenly spaced points on [0, 5]
f = cos(2*pi*x); % f(x) = cos(2?x)
g = x .* exp(-x); % g(x) = x e^{-x}
%% 4.1 Plot f(x) with title, grid, and legend
figure('Renderer','painters'); % open a stable figure
plot(x, f, 'LineWidth', 1.5); % plot f(x)
title('f(x) = cos(2\pi x)');
xlabel('x'); ylabel('f(x)');
grid on;
legend('f(x)','Location','best');
%% 4.2 Plot f(x) and g(x) in the same figure
figure('Renderer','painters'); % new figure
plot(x, f, 'LineWidth', 1.5); hold on; % plot f(x), keep figure
plot(x, g, '--', 'LineWidth', 1.5); % plot g(x) with dashed line
title('f(x) and g(x) on the same axes');
xlabel('x'); ylabel('value');
grid on;
legend('f(x) = cos(2\pi x)', 'g(x) = x e^{-x}', 'Location','best');
hold off;
%% 4.3 Plot the same functions in two subplots of one figure
figure('Renderer','painters');
% Top subplot: f(x)
subplot(2,1,1);
plot(x, f, 'LineWidth', 1.5);
title('f(x) = cos(2\pi x)');
xlabel('x'); ylabel('f(x)');
grid on;
% Bottom subplot: g(x)
subplot(2,1,2);
plot(x, g, '--', 'LineWidth', 1.5);
title('g(x) = x e^{-x}');
xlabel('x'); ylabel('g(x)');
grid on;
