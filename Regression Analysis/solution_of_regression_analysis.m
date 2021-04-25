clc;
data = csvread('coviddata.csv');
global x;
global y;
global ns;
x = data(:,1);
y = data(:,2);

plot(x,y,'*');
title("Covid 19 Total Cases vs Date"),grid on,xlabel("Date"),ylabel("Total Cases");
hold on;
ns = size(data,1)
sumx = sum(x);
sumy = sum(y)
sumx2 = sum(x.^2)
sumx3 = sum(x.^3)
sumx4 = sum(x.^4)
sumxy = sum(x.*y)
sumx2y = sum((x.^2).*y)

%Gauess Jordan Part
A=[
    ns ns*sumx ns*sumx2;
   ns*sumx ns*sumx2 ns*sumx3;
   ns*sumx2 ns*sumx3 ns*sumx4
   ];

b=[ns*sumy ;ns*sumxy ;ns*sumx2y];

[m,n] = size(A);

t = zeros(m,1);
l = zeros(m,m-1);

for k = 1:m-1
        for p = k+1:m
            if (abs(A(k,k)) < abs(A(p,k))) %checking Conditions
                A([k p],:) = A([p k],:);
                  b([k p]) = b([p k]);
            end
        end

    for i = k+1:m
        l(i,k) = A(i,k)/A(k,k);
        for j = k+1:n
            A(i,j) = A(i,j)-l(i,k)*A(k,j);
        end  
        b(i) = b(i)-l(i,k)*b(k);
    end
end

for k = 1:m-1
    for i = k+1:m
        A(i,k) = 0;
    end
end

t(m) = b(m)/A(m,m);

for i = m-1:-1:1
    sum = 0;
    for j = i+1:m
        sum = sum + A(i,j)*t(j);
    end
    t(i) = (b(i)- sum)/A(i,i);
end
fprintf("The value of coefficients : ");
a0 = t(1);
a1 = t(2);
a2 = t(3);
yprediction = a0 + a1*x + a2*(x.^2)
plot(x,yprediction);

%To find R^2 i am getting error (Index exceeds array bounds)
St = sum((y - sumy/ns).^2);
Sr = sum((y - a0 - a1*x - a2*(x.^2)).^2);
rsquare = (St - Sr)/St;
fprintf("Co-efficient of Determination is %f percent\n",rsquare*100);
