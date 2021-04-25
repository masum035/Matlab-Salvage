count = 1;
es=0.5*10^(2-7);
g = 9.8;
t = 10;
v = 40;
m = 68.1;
f = @(c)((g * m) / c)*(1 - exp((-t * (c / m)))) - 40

x0 = input('X0 = ')
x1 = input('X1 = ')
if(x0 == 0 || x1 == 0 || f(x0)*f(x1) > 0)
    fprintf('Not a valid interval\n');
else

for i=1:10
    c(i) = x0-(f(x0)/(f(x1)-f(x0))*(x1-x0));
    if(f(c(i))*f(x0) > 0)
        x0 = c(i);
    else
        x1 = c(i);
    end
    if(i>1)
    e(i-1)=(abs(c(i)-c(i-1)))/c(i)*100;
    count = count + 1;
    if(e(i-1)<es)
        break;
    end
    end
end
disp('I = ')
fprintf('%d\n',count);
disp('X= ')   
fprintf('%.6f ',c)
fprintf('\n')
disp('E= ')
fprintf('%.9f ',e)
fprintf('\n')
end
plot(e)
grid on;
title('Error')
xlabel('iteration')
ylabel('error')
