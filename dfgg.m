t=linspace(-6,6,2000);
x=t.*cos(t);
xeng=(-t).*cos(-t);

xe=0.5*(x+xeng);
xo=0.5*(x-xeng);

fprintf('max|xe| = %.2e\n', max(abs(xe)));
fprintf('min|xe| = %.2e\n',min(abs(x-xo)));
figure;

plot(t,x,'k',t,xe,'r--',t,xo,'b-','Linewidth',1.5);
