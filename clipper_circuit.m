%Diode clipper circuit 
v_in=linspace(-10,10,1000);
v_clip=3;
v_out=zeros(size(v_in));

for i = 1:length(v_in)
    if v_in>v_clip
        v_out = v_clip 
    elseif v_in(i) <- v_clip 
        v_out(i)=v_clip

    else 
        v_out(i)=v_in(i);
    end 
end 
plot(v_in,v_out);
title('Diode clipper circuit');
xlabel('Input image');
ylabel('Output image');
