es = 0.5*10^(2-6);
x0 = input ('X0= ');

f = @(x)x^6-x^4-x^3-1
f1 = @(x)6*x^5-4*x^3-3*x^2

for i=1:6
    c(i)=x0-f(x0)/f1(x0);
    x0=c(i);
    if(i>1)
        e(i-1)=(abs(c(i)-c(i-1)))/c(i)*100;
        if(e(i-1)<es)
            break;
        end
    end
end
        
disp('Roots')
fprintf('\nX0 =')
fprintf('%.6f ',c);
fprintf('\n\n')
disp('Error')
fprintf('\ne = ')
fprintf('%.6f ',e);
fprintf('\n')
root = roots(p);
fprintf('\n\n')
disp('Using roots function: ')
display(root)
disp('Using fzero function: ')
z = fzero(f,x0)
disp('Using fsolve function: ')
s = fsolve(f,x0)
