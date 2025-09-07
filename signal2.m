clc;
clear; 
close all;

a = 1:5;                         % Vector [1 2 3 4 5]
b = 2^(-1.5);                    % Scalar
newVec = [a, b];                 % Concatenate
len_newVec = length(newVec);     % Length of newVec
prod_ab = a .* b;                % Element-wise product (vector)
x = 0:100;                       % 101 elements
y = 0:-0.01:-1;                   % 101 elements
dot_xy = dot(x, y);              % Dot product
sum_x = sum(x);                  % Sum of x

disp(newVec);
disp(len_newVec);
disp(prod_ab);
disp(dot_xy);
disp(sum_x);

