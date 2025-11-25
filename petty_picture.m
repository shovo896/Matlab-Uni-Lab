function petty_picture(N)
if nargin < 1 
    N=500;
end 
t=0:(.99*pi/2):N;
x=t.*cos(t);
y=t.*sin(t);
plot(x,y,'k');
axis('square');
title('samin is unethical');
xlabel('');
ylabel();
end
