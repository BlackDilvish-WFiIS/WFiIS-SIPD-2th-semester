clear;
clc;

load fisheriris;

labels= findgroups(species);

%gscatter(meas(:,3),meas(:,4),labels); % 3 i 4 atrybut kwiatkow

n=length(labels);

ratio=.2;

an=ratio*n; %wielkosc uczących
bn=n-an;    %wielkosc testujących

aidx=randperm(n,an); %losowe indeksy
bidx=setdiff(1:n,aidx); %różnica zbiorów

adata=meas(aidx,:);
bdata=meas(bidx,:);

labels2=labels; %kopia
labels2(bidx)=labels2(bidx)+3;

gscatter(meas(:,3),meas(:,4),labels2);

dist=zeros(bn,an);

for i=1:bn
    for j=1:an
        dist(i,j)=sqrt(sum((bdata(i,:)-adata(j,:)).^2));
    end
end

[mindist,minidx]=min(dist,[],2);
%[najmniejsza wartość długość, indeks najmniejszego elementu]

gminidx=aidx(minidx);
reslabels=labels(gminidx);

sum(reslabels==labels(bidx))/bn %porównujemy jak dobrze poszło


