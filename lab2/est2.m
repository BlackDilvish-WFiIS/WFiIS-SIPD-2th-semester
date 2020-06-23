clear;
clc;

n=1e3;
q=5;
w=(rand(1,q+1)-.5)*10;
x=randn(1,n)*20;
t=.5;
y=sum(x'.^(0:q).*w,2)'+randn(1,n)*t;

plot(x,y,'.');

m=6;
G=zeros(m+1);
ro=zeros(m+1,1);

for i=1:m+1
    for j=1:m+1
        G(i,j)=sum(x.^(i-2+j));
    end
end

for j=1:m+1
    ro(j)=sum(y.*(x.^(j-1)));
end

a=G^-1*ro;

xx=-60:.1:60;
yy=sum(xx'.^(0:m).*a',2)';

plot(x,y,'.',xx,yy);

ey=sum(x'.^(0:m).*a',2)';
err=sum((y-ey).^2)/n

