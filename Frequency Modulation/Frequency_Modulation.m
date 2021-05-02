%% 𝔸𝕓𝕕𝕦𝕝𝕝𝕒𝕙 𝔸𝕝 𝕄𝕒𝕤𝕦𝕞
% standard input 10 500 50 10000

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
Kf = 1;    %% change Kf from 0 to 1 and see graph But i didn't use Kf containing formula,it's call frequency sensitivity
Mt = cos(2*pi*fm*t);
Ct = cos(2*pi*fc*t);

%% This is for message signal %%
Ymsg = Am.*Mt;
figure(1);
subplot(3,1,1);
plot(t,Ymsg);
%%disp(Ymsg);
title("Message Signal");
xlabel("Time (sec)");
ylabel("Amplitude (volt)");


%% This is for Carrier signal %%
Yc = Ac.*Ct;
figure(2);
subplot(3,1,2);
plot(t,Yc);
%%disp(Ym);
title("Carrier Signal");
xlabel("Time (sec)");
ylabel("Amplitude (volt)");


%% This is for Frequency modulated signal %%
beta = (Am*Kf)/fm;   %% modulation index for frequency
%% if beta > 1 , then Widebanded Frequency Modulation
%% if beta < 1 , then NarrowbBanded Frequency Modulation
%% But for simplicity , i'm using general formula , ommiting beta
Ym = Ac.*cos((2*pi*fc*t) + (Am.*sin(2*pi*fm*t)));
figure(3);
subplot(3,1,3);
plot(t,Ym);
%%disp(Ym);
title("Frequency Modulation");
xlabel("Time (sec)");
ylabel("Amplitude (volt)");
