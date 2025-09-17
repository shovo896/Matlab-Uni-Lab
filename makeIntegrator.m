function integrator =makeIntegrator(method)
        switch lower(method)
            case 'trapezoid'
                integrator=@(f,a,b,n) trapRule(f,a,b,n);
            case 'midpoint'
                integrator=@(f,a,b,n) midRule(f,a,b,n);
            case 'simpson'
                integrator=@(f,a,b,n) simpRule(f,a,b,n);
            otherwise 
                error('unknown integer value')
        end 
function I =trapRule(f,a,b,n)
         x = linspace(a,b,n+1);
         y=f(x);
         h=(b-a)/n;
         I = h*(sum(y)-0.5*(y(1)+y(end)));
end 
function I = midRule(f,a,b,n)
    h=(b-a)/n;
    x=linspace(a+h/2,b-h/2,n);
    I=h*sum(f(x));
end
function I =simpRule(f,a,b,n)
     if mod(n,2)~=0 
         error('n must be even in simpson rule');
     end 
     x=linspace(a,b,n+1);
     y=f(x);
     h=(b-a)/n;
     I=h/3*(y(1)+2*sum(y(3:2:end-2))+4*sum(y(2:2:end))+y(end));
end 
end 