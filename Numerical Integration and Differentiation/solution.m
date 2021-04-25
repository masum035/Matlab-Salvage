clear all;
clc;
%given problem no is: 5 as id:201914044
f = @(x)(4*x - 3)^3;
a = -3; %lower limit
b = 5; %upper limit
n = input('Input the total number of intervals : '); % partition number
h = (b-a)/n; %height & it is constant for simpson + trapezoidal

%Actual solution
syms x;
Ac = int(f(x),a,b);
fprintf('Actual value of the integration is: %f\n',Ac);

%Trapezoidal method
s = 0;
for i=1 : n-1
   x = a + i*h; 
   s = s + f(x);
end
% I for Integration
I = h*(f(a) + 2*s + f(b))/2 ; % general formula for trapezoidal rule
fprintf("\nIntegrated result by trapezoidal method: %f\n",I);

%Simpson(1/3) method
sum1 = 0;
sum2 = 0;

for i = 1 : 2 : n-1
    y = a + i*h;
    sum1 = sum1 + f(y);
end

for i = 2 : 2 : n-2
   y = a + i*h;
   sum2 = sum2 + f(y);
end
% Is for sympson integration
Is = h*(f(a) + 4*sum1 + 2*sum2 +f(b))/3; % general formula of sympson (1/3) rule
fprintf("Integrated result by sympson(1/3) method: %f\n",Is);

fprintf('\n');
fprintf('Error percentage of trapezoidal method here is: %f percent\n',abs(1-(I/Ac)));
fprintf('Error percentage of Sympson (1/3) method here is: %f percent\n',abs(1-(Is/Ac)));
fprintf('\n');
fprintf("To calculate integral using sympson (1/3) rule,you must input even integer interval\n");
fprintf("otherwise,sympson method will give negative garbage value\n");
fprintf('Again,Here if we take a very large number for total intervals , than this trapezoidal method will be more accurate\nSame goes for Sympson method\n');


%Graph plotting
figure(1);
p = [a : b];
q = ((4*p) - 3).^3;
hold('on');
bar(p,q);
plot(p,q,'LineWidth',5);
hold('off');
grid('minor');
xlabel('X (lower limit to upper limit)');
ylabel('Y');
hold('on');
m = [1 : b]; %01 theke upper limit porjonto graph-e show korbe 
n = ((4*m) - 3).^3;
plot(m,n,'LineWidth',3);
hold('off');
ax = gca;
ax.YAxisLocation = 'right';
