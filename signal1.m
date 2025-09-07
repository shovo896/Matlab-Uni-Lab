clc ;
clear ;
close all ;
format long g ;
A=cos(pi);
A2=A^2;
term1 = 2 * A2;
B=sin(pi/2);
inside=4*B - exp(1)^2 ;

term2 = sqrt(inside);
result=term1+term2 ;

disp(term1);
disp(inside);
disp(term2);
disp(result);
