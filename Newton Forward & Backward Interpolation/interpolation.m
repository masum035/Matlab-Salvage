%%-----------------Applying Lagrange Theorem-------------- 
%%For this given problem,it can not be solved by Newton Backward
process
%%cause the finding value(18) is next to provided last value(14)and
data is
%%not equally distributed
%%and also,if Lagrange theorem applied it gives negative value,which
is not
%%aspected value in this scenario.
x = [4 5 7 9 14];
y = [15 20 30 45 65];
n = length(x) - 1;
xp = 18;
sm = 0;
for i = 1 : n+1
 pr = 1;
 for j = 1 : n+1
 if j ~= i
 pr = pr * (xp - x(j))/(x(i) - x(j));
 end
 end
 sm = sm + y(i) * pr;
end
fprintf("By using Lagrange Theorem, when x = 18 the result is: %.2f
\n",sm)
%%--------------Newton Backward Process---------------------
%% cause newton interpolation method is only applicable for equal
difference 
%% But in this problem,data is not equally distributed
%% when we put x2 - x1 in h,the result is 195
%% when we put x3 - x2 in h,the result is 120
%% when we put x4 - x3 in h,the result is 120
%% when we put x5 - x4 in h,the result is 84
%% By this newton Backward process we can not determine which one is
correct
%% but judging manually, the correct answer would be 84 
x = [4 5 7 9 14];
y = [15 20 30 45 65];
n = length(x);
xp = 18;
for i=1 : n-1
 d(i,1) = y(1+i) - y(i);
end
for j = 2 : n-1
 for i=1 : n-j
 d(i,j) = d(i+1,j-1) - d(i,j-1);
 end
endh = x(5)-x(4); 
p = (xp - x(n))/h;
Y = y(n);
a = 1;
for t = 1 : n-1
 a = a*(p + t -1)/t;
 Y = Y + a*d(n-t,t);
end
fprintf("By using Newton's Backward interpolation theorem, when x = 18
the result is: %.2f \n",Y)
 
