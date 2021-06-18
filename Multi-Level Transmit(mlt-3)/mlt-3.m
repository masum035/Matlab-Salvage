clc;
clear;
close all;

bits = [0 1 0 0 1 1 0 0 0 1 0 1];
frequency = 1; % bits per second(bitrate)or frequency here

%% ----------For input signal -----------%%
[t,s] = inputted_digital_signal(bits,frequency);
subplot(2,1,1);
figure(1);
plot(t,s,'LineWidth',3,color='#000000');
xticks([0 : 1 : length(bits)]);
hline = refline(0); % baseline y-axis=0 heighlighting 
hline.Color = 'r';
ylim([-1 1]);
grid on; % to clearely visualize grid
title(["Inputted Digital Signal" num2str(bits)]);
xlabel("Time Period");
ylabel("Bits");

%% ----------For mlt-3 signal -----------%%
[t,s] = mlt3(bits,frequency*2);
subplot(2,1,2);
figure(1);
plot(t,s,'LineWidth',3,color='b');
xticks([0 : 1 : length(bits)]);
hline = refline(0); % baseline y-axis=0 heighlighting 
hline.Color = 'r';
ylim([-1 1]);  % limiting y-axis
grid on; % to clearely visualize
title(["mlt-3 Output Signal (1 bit right shifted)" num2str(bits)]);
xlabel("Time Period");
ylabel("Bits");

% Normal Digital input Signal
function [time_series,output_signal] = inputted_digital_signal(bits,bitrate)

bit_sequence_Time = length(bits)/bitrate; % full time of bit sequence
n = 100;  % actually i'm using n for pulse shaping (change this n value & see differences)
N = n*length(bits);
dt = bit_sequence_Time / N;
time_series = 0 : dt : bit_sequence_Time;
output_signal = zeros(1,length(time_series)); % output signal

for i = 0 : length(bits)-1
    if bits(i+1) == 1
        output_signal(i*n+1 : (i+1)*n) = 1;
    else
        output_signal(i*n+1 : (i+1)*n) = -1;
    end
end

end

%mlt-3 function
function [time_series,output_signal] = mlt3(bits, bitrate)

bit_sequence_Time = length(bits) / bitrate;
n = 100;  
N = n*length(bits);
dt = bit_sequence_Time / N;
time_series = 0 : dt : bit_sequence_Time;
output_signal = zeros(1,length(time_series)); 

last_no_zero = -1;

for i = 2 : length(bits)-1 % in matlab,array indices starts from 1 & this is the reason why 1 bit right shifted
    if bits(i) == 0
        g = output_signal((i-1)*n : i*n);
       %output_signal(i*n +1 :(i+1)*n) = g;
        %output_signal((i+0.5)*n+1:(i+1)*n) = -1;
    else
        if bits(i-1) ~= 0
            output_signal(i*n +1 :(i+1)*n) = 0;
        else
            last_no_zero = last_no_zero * (-1);
            output_signal(i*n +1 :(i+1)*n) = last_no_zero;
        end
    end
end

end
