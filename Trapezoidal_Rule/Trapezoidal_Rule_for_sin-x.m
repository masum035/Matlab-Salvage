sine = @(x) sin( x * pi / 180);


lo = 0;
hi = pi / 2;

h = pi / 256;
n = (hi - lo) / h;


f = @(x) sin(x);

for i = 1 : n + 1
    y(i) = f(lo + (i - 1) * h);
end

I = 0;

for i = 2 : n
    I = I + y(i);
end

I = h / 2 * (y(1) + 2 * I + y(n+1));

disp(I);
