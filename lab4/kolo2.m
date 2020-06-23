clc;
clear;

n=1e3;
m=2;
T=1e3;
r=[0,0,0,0,0];
K=[1.07,1.14,1.22,1.36,1.63];

for i=1:T
    x=icdf('exponential',rand(1,n),m);
    Fteo=cdf('exponential',x,m);
    for j=1:n
        Fe(j)=length(x(x<x(j)))/n;
    end
    Dn=max(abs(Fe-Fteo));
    r=r+(n^.5*Dn > K);
end

r/T