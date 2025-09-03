[x,y]=meshgrid(-2:0.1:2,-2:0.1:2);
z=x.^2 + y.^8;
surf(x,y,z);
title('3D plot')