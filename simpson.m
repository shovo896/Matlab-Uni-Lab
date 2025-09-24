clc ; 
close all ;
clear all ;
f=@(x) 1./(1+x.^2);
a=input('Enter the value of upper limit:');
b=input('Enter the value of upper limit:');
n=input('Enter the interval:');
h=(b-a)/n;
so=0;
se=0;
for k=1:1:n-1
    x=a+k*h;
    if mod(k,2)==0
        se=se+f(x);
    else 
        so=so+f(x);
    end 
end 
output=h/3*(f(a)+f(b)+4*so+2*se);
fprintf('Answer is = %.4f\n',output);
