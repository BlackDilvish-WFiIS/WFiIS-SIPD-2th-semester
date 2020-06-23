clear;
clc;
a=[1,2,3,4;25,16,9,4;2,3,5,7;8,3,2,5];

b=[1;2;3;4];
ax1=a;
ax1(:,1)=b;
ax2=a;
ax2(:,2)=b;
ax3=a;
ax3(:,3)=b;
ax4=a;
ax4(:,4)=b;

detA=det(a);
detAX1=det(ax1);
detAX2=det(ax2);
detAX3=det(ax3);
detAX4=det(ax4);

x1=detAX1/detA
x2=detAX2/detA
x3=detAX3/detA
x4=detAX4/detA

c=a^-1 * b

