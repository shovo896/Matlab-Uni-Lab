t=linspace(-5,10,3000);
u=@(x) double(x>=0);
r=@(x) x.^u(x);


%step based signals 
x1=u(t);
x2=u(t+3);
x3=u(t-2)-u(t+3);
x4=exp(-t).*u(t+2);

%ramp based signals 

x5=r(t);
x6=r(t-1);
x7=r(t)-r(t-2)-r(t-5)+r(t-7);


%%% bad baki duita kora lagbo 

kmin2=ceil((-5/4));
kmax2=floor((10-1)/2);
p2s_times=1+2*(kmin2:kmax2);

kmin3=ceil(((-5)-1)/2);
kmax3=floor((10-1)/2);
p3s_times=1+2*(kmin3:kmax3);

%%ploting all the values 

figure('Name','signals(2.1-2.12','Color','w');
subplot(4,3,1);
plot(t,x1,'LInewidth',1.4);
grid on ; 
ylim([-0.2 1.2]);
title('2.2 u(t) ');
xlabel('t');


subplot(4,3,2);
plot(t, x2, 'LineWidth', 1.4); grid on; ylim([-0.2 1.2]);
title('2.2 u(t+3)'); xlabel('t');

subplot(4,3,3);
plot(t, x3, 'LineWidth', 1.4); grid on; ylim([-1.2 1.2]);
title('2.3 u(t-2) - u(t+3)'); xlabel('t');

subplot(4,3,4);
plot(t, x4, 'LineWidth', 1.4); grid on;
title('2.4 e^{-t} u(t+2)'); xlabel('t');





subplot(4,3,5);
stem(0,1,'filled','LineWidth',1.2);
grid on ;
xlabel('t');

subplot(4,3,6);
stem(2,1,'filled','LineWidth',1.2);
grid on ; 
xlabel('t');

subplot(4,3,7);
stem([-1 2],[1 1],'filled','LineWidth',1.2);
xlim([t(1) t(end)]);
ylim([0 1.2]);
grid on ;
xlabel('t');

subplot(4,3,7);
stem([-1 2], [1 1], 'filled', 'LineWidth', 1.2); grid on;
xlim([t(1) t(end)]); ylim([0 1.2]);
title('2.7 \delta(t-1)+\delta(t+2)'); xlabel('t');

