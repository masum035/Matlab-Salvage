%% 𝔸𝕓𝕕𝕦𝕝𝕝𝕒𝕙 𝔸𝕝 𝕄𝕒𝕤𝕦𝕞
% standard input 10 500 50 2000

clc;        %% clearing comment 
clear all;  %% clearing workspace
close all;  %% closing all window (like graph window)

Am = input("enter message signal amplitude: ");
fm = input("enter message signal frequency: ");
Ac = input("enter carrier signal amplitude: ");
fc = input("enter carrier signal frequency: ");

initPhase = 0;
Tm = 1/fm;
t = 0 : Tm/1000 : 6*Tm;
Kp = 1;    %% change Kp from 0 to 1 and see graph, it's call phase sensitivity
Mt = cos(2*pi*fm*t);
Ct = cos(2*pi*fc*t);

%% This is for message signal %%
Ymsg = Am.*Mt;
figure(1);
subplot(3,1,1);
plot(t,Ymsg);
title("Message Signal");
xlabel("Time (sec)");
ylabel("Amplitude (volt)");


%% This is for Carrier signal %%
Yc = Ac.*Ct;
figure(2);
subplot(3,1,2);
plot(t,Yc);
title("Carrier Signal");
xlabel("Time (sec)");
ylabel("Amplitude (volt)");


%% This is for Frequency modulated signal %%
beta = (Am*Kp);   %% modulation index for phase modulation
instantaneous_phase = Kp.*Ymsg;
%% The amplitude and the frequency of the carrier signal
%% remains constant whereas the phase of the carrier changes

%% When the amplitude is positive, the phase changes in one direction
%% and if the amplitude is negative, the phase changes in the opposite direction.

Ym = Ac.*cos((2*pi*fc*t) + (beta.*cos(2*pi*fm*t)));
figure(3);
subplot(3,1,3);
plot(t,Ym);
title("Phase Modulation");
xlabel("Time (sec)");
ylabel("Amplitude (volt)");
