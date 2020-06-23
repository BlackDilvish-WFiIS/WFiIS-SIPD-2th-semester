clear;
clc;

n=1e2;
a=(rand()-.5)*10;
b=(rand()-.5)*10;

x=randn(1,n)*20;
t=.5;
y=a*x+b+randn(1,n)*t;

plot(x,y,'.');

dx=sum(x)/n;
dy=sum(y)/n;

ea=(sum((x-dx).*(y-dy))/sum((x-dx).*(x-dx)));
eb=dy-ea*dx;

xx=-60:.1:60;
yy=ea*xx+eb;

plot(x,y,'.',xx,yy);