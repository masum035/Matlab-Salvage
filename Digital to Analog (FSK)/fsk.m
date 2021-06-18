% Date 12 Jube,2021 
% Abdullah Al Masum 
clc;
clear;
close all;

x = [1 0 1 1 0 1 0 1]; % Data
% disp (x);

bp = 0.000001; % bit period (if bit period is less, than bit rate will be high)

%% -------------------Digital Data--------------------%%
bit = [];

for n = 1:1:length(x)
    if x(n) == 0    % if binary data is zero
        se = zeros(1,100); 
    else            % if binary data is one
        se = ones(1,100);
    end
    bit = [bit se]; % here marging 2 arrays 
end

t1 = bp/100:bp/100:length(x)*bp; % time span is crucial

subplot(2,1,1);
plot(t1,bit, 'LineWidth', 2.5,color='#000'); 
grid on;  % to clearly visualize line
hline = refline(0); % baseline y-axis=0 heighlighting 
hline.Color = 'r';
axis([0 length(x)*bp -0.5 1.5]); % this can be done also by xlim() and ylim() 
xlabel('Time');
ylabel('Amplitude');
title(["Digital Signal" num2str(x)]);

%% -------------------Analog Signal(FSK)--------------------%%
t2 = bp/100:bp/100:bp;   % time span is crucial

A = 1;  % Here, amplitude will have no change 

f  = 1/bp; % this,f means carriar frequency(high frequency) let's say 1/bp
f0 = 3*f;
f1 = 8*f;

sig = [];

for n=1:1:length(x)
    if x(n) == 0    % if binary data is zero
        y = A*sin(2*pi*f0*t2);
    else            % if binary data is one
        y = A*sin(2*pi*f1*t2);  
    end
    sig = [sig y];
end


subplot(2,1,2);
plot(t1,sig, 'LineWidth', 2.5,color='b'); 
grid on;                         % to clearly visualize line
hline = refline(0); % baseline y-axis=0 heighlighting 
hline.Color = 'r';
axis([0 length(x)*bp -1.5 1.5]); % this can be done also by xlim() and ylim() 
xlabel('Time');
ylabel('Amplitude');
title(["Analog Signal(FSK)" num2str(x)]);
