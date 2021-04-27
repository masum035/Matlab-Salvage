%% Date-27/04/2021        id-201914044 
%% stndard input - 2 4 120
clc;        %% clearing comment 
clear all;  %% clearing workspace
close all;  %% closing all window (like graph window)

Am = input("enter msg signal amplitude: ");
fm = input("enter msg signal frequency: ");
fs = input("enter sampling signal frequency: ");

Tm = 1/fs;
t = 0: Tm : 1;
Ym = Am*cos(2*pi*fm*t); %% msg signal
figure(1);
subplot(3,1,1);
plot(t,Ym);
title("Message Signal");
xlabel("Time (sec)");
ylabel("Amplitude (volt)");

l = length(Ym);
%disp(l);   %% here extra one is coming as i started from 0
delta = (2*pi*fm*Am)/fs; %%this will be my step size
%disp(delta);
Yn=0;       %% Delta modulated signal
for i=1:l;
if Ym(i)>Yn(i)
d(i)=1;
Yn(i+1) = Yn(i) + delta;
else
d(i)=0; 
Yn(i+1) = Yn(i) - delta;
end
end
figure(2);
subplot(3,1,2);
stairs(Yn);     %%plot() was giving me edges,so i used stairs()
title("Delta Modulated Signal");
xlabel("Time (sec)");
ylabel("Amplitude (volt)");

%% Delta modulation's reverse process will give me Demodulated signal
for i = 1 : d
if d(i)>Yn(i)
d(i) = 0;
Yn(i+1) = Yn(i) - delta;
else
d(i) = 1; 
Yn(i+1) = Yn(i) + delta;
end
end
figure(3);
subplot(3,1,3);
plot(Yn);     %% here instead of stairs() i used plot according to question
title("DeModulated Signal");
xlabel("Time (sec)");
ylabel("Amplitude (volt)");
