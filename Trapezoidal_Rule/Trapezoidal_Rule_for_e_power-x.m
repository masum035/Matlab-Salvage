lo = 0;
hi = 1;

f = @(x) exp(-x);

h = 0.1;

n = (hi - lo)/h;

%cur = 0

for i = 1 : n + 1
    y(i) = f (lo + (i-1) * h);
%    y(i) = f(cur);
%    cur = cur + h;
end

I = 0;

for i = 2 : n 
    I = I + y(i);
end

I = (h / 2) * ( y(1) + (2 * I) + y(n+1) );

disp(I);
