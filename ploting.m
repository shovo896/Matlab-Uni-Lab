t=linspace(-2,2,500);
x1=cos(pi*t);
figure ;
plot(t,x1,'LineWidth',1.5);
xlabel('t');
ylabel('x1');
title('my function');

n=-10:10 ;
x2=cos(pi*n);
figure;
stem(n,x2,'r','filled');
grid on ;
xlabel('n');
ylabel('x2');
title('the number of terms');


%% the third one 
T=2/3 ;
t2=linspace(0,2*T,500);
x=exp(1j*3*pi*t2);
figure ;
plot(t2,real(x),'b','LineWidth',1.5);
hold on ; 
plot(t2,imag(x),'r--','LineWidth',1.5);
