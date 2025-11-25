t=linspace(0,0.01,1000);
v_in=sin(2*pi*50*t);
v_out=abs(v_in);
plot(t,v_in,t,v_out);
title('full wave rectifier simulation');
xlabel('Time');
ylabel('Voltage');
legend('Input voltage','output voltage');
