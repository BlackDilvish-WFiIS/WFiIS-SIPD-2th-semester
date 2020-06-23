clc;
clear;

n=1e3;
m=2;
s=4;
x=icdf('normal',rand(1,n),m,s);

%dystrybuanta teoretyczna
Fteo=cdf('normal',x,m,s);

%dystrybuanta empiryczna
for i=1:n
    X=x(x<x(i));
    Fe(i)=(length(X))/n;
end

Dn=max(abs(Fteo-Fe))

sqrt(n)*Dn>1.63

%wychodzi -> odrzucamy


