clc;
clear;

n=5e4;
n1=.2*n;
n2=n-n1;
m1=-2;
s1=1;
m2=4;
s2=2;

z=[icdf('normal',rand(1,n1),m1,s1),icdf('normal',rand(1,n2),m2,s2)];

bins=100;
h=histogram(z,bins);
X=h.BinEdges(1:end-1)+h.BinWidth/2;
Yh=h.Values/(n*h.BinWidth);

%estymator nieparametryczny

Y=n1/n*normpdf(X,m1,s1) + n2/n*normpdf(X,m2,s2);

errH=sum((Y-Yh).^2)/bins;

h=1.06*std(z)*n^-.2;

%estymator jądrowy

for i=1:bins
    yk(i)=sum(normpdf((X(i)-z)/h))/(n*h);
end

plot(X,Y,X,yk)

errK=sum((Y-yk).^2)/bins;

%z=z(randperm(n));

%for j=1:n
    %h=1.06*std(z(1:j))*j^-.2;
    %for i=1:bins
        %yk(i)=sum(normpdf((X(i)-z(1:j))/h))/(j*h);
    %end
    %errK(j)=mse(Y,yk);
%end

%semilogy(errK)


