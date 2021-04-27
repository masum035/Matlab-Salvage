sine = @(x) sin( x * pi / 180);


lo = 0;
hi = pi / 2;

h = pi / 16;
n = (hi - lo) / h;


f = @(x) sin(x);

%cur = 0

for i = 1 : n + 1
    y(i) = f (lo + (i-1) * h);
%    y(i) = f(cur);
%    cur = cur + h;
end

I = 0;

for i = 2 : 2 : n 
    I = I + 4 * y(i);
end

for i = 3 : 2 : n - 1
    I = I + 2 * y(i);
end

I = (h / 3) * ( y(1) + I + y(n+1) );

disp(I);
