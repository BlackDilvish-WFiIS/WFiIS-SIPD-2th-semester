clear
clc;

m=2^32;
a=[321,21317,3251];
n=1e5;
b=123;
x=[1,1,1];
for i=4:n
    x(i)=mod(sum(a.*x(i-3:i-1))+b,m);    
end
x=x/(m-1);

%hist(x,1000);

%plot(x(1:end-1),x(2:end),'.');

EX=sum(x)/n

blad=log10(abs(EX-0.5))

DX=(sum((x-0.5).^2)/n)^.5

DXX=(sum((x-EX).^2)/(n-1))^.5

blad2 =log10(abs(DX-(12^-.5))) 

y=icdf('normal',x+0.00001,0,1);
%hist(y,1000)

plot(y(1:end-1),y(2:end),'.');

EY=sum(y)/n
bladY=log10(abs(EY))

DY=(sum((y).^2)/n)^.5
bladyy=log10(abs(DY-(12^-.5))) 

