%LED characteristic curve 
V=0:0.01:2 ;
I=exp(V);
plot(V,I);
title('LED charactersitic curve ');
xlabel('Vlotage(v)');
ylabel('Current(I)')
