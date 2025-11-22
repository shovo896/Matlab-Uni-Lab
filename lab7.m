u=@(t) double(t>=0);
xo=@(t) t.*(u(t)-u(t-5));
t=linspace(-6,18,6000);
x_base=xo(t);
x_ref = x0(-t); 
x_c4 = x0(4*t); % 5.2 x(4t)
x_c03 = x0(0.3*t); % 5.3 x(0.3t)
x_shiftL = x0(t+2); % 5.4 x(t+2)
x_shiftR = x0(t-3); % 5.5 x(t-3)
x_affine = x0(1-3*t);


figure('color','w','name','transforms of');
subplot(3,2,1)
plot(t,x_ref,'b','LineWidth',1.6); hold on
plot(t,x_base,'--','Color',[0.6 0.6 0.6],'LineWidth',1)
grid on; ylim([-0.5 5.5]); 
xlim([t(1) t(end)]);
title('5.1 x(-t) (time reversal)'); xlabel('t')

subplot(3,2,2)
plot(t,x_c4,'b','LineWidth',1.6); hold on
plot(t,x_base,'--','Color',[0.6 0.6 0.6],'LineWidth',1)
grid on; ylim([-0.5 5.5]); xlim([t(1) t(end)])
title('5.2 x(4t) (compress by 4)'); xlabel('t')

subplot(3,2,3)
plot(t,x_c03,'b','LineWidth',1.6); hold on
plot(t,x_base,'--','Color',[0.6 0.6 0.6],'LineWidth',1)
grid on; ylim([-0.5 5.5]); xlim([t(1) t(end)])
title('5.3 x(0.3t) (stretch by 1/0.3)'); xlabel('t')

subplot(3,2,4)
plot(t,x_shiftL,'b','LineWidth',1.6); hold on
plot(t,x_base,'--','Color',[0.6 0.6 0.6],'LineWidth',1)
grid on; ylim([-0.5 5.5]); xlim([t(1) t(end)])
title('5.4 x(t+2) (shift left by 2)'); xlabel('t')

subplot(3,2,5)
plot(t,x_shiftR,'b','LineWidth',1.6); hold on
plot(t,x_base,'--','Color',[0.6 0.6 0.6],'LineWidth',1)
grid on; ylim([-0.5 5.5]); xlim([t(1) t(end)])
title('5.5 x(t-3) (shift right by 3)'); xlabel('t')


subplot(3,2,6)
plot(t,x_affine,'b','LineWidth',1.6); hold on
plot(t,x_base,'--','Color',[0.6 0.6 0.6],'LineWidth',1)
grid on; ylim([-0.5 5.5]); xlim([t(1) t(end)])
title('5.6 x(1-3t) = reflect + compress 3 + shift'); xlabel('t')
sgtitle('Transforms of x(t) = t[u(t)-u(t-5)]')


