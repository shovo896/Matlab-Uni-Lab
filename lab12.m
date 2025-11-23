N = 2000; 
tol = 1e-12;
Dd = @(x) [x(1), diff(x)];
shift = @(x,k) [zeros(1,k), x(1:end-k)];
rng(1);
x1=randn(1,N);
x2=randn(1,N);
a=-0.9;
b=1.3;
lhs=D(a*x1+b*x2);
rhs=a*Dd(x1)+b*Dd(x2);
lin_err=max(abs(lhs-rhs));
fprintf(onoff(is_linear,lin_err));
n0=round(N/2);
xA(n0+1:end)=0;
xB(n0+1,end)=randn(1,N-N0);
yA=Dd(xA);
yB=Dd(xB);
casual_err=,ax(abs(yA(1:n0)-yB(1:n0)));
is_casual=casual_err< tol;
k=n0;
xa=zeros(1,N);
xb=xa;
xa(k)=0;
xb=xa;
xa(k)=0;
xb(k)=0;
xa(k-1)=0;
xb(k-1)=0;
ya=Dd(xa);
yb=Dd(xb);
display(onoff(is_dynamic));
x = randn(1,N);
kshift = 137; % number of-sample delay
lhs_ti = Dd(shift(x,kshift)); % shift then apply system
rhs_ti = shift(Dd(x),kshift); % apply system then shift
ti_err = max(abs(lhs_ti - rhs_ti));
is_ti = ti_err < 1e-10;
fprintf('2.4 Shift-invariant? %s (max error = %.3e)\n', onoff(is_ti), ti_
function s = onoff(tf)
if tf, s = 'YES'; else, s = 'NO'; end
end
