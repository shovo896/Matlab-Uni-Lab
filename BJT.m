%BJT common amplifier 
beta=100;%current gain 
R_C=1e3;
V_CC=10;

I_B=50e-6;
I_C=beta*I_B;
V_CE=V_CC-I_C*R_C ;
disp(['Collector-Emitter Voltage:',num2str(V_CE),'V']);
