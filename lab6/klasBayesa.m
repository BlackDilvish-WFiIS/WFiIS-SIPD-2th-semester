clear;
clc;

load fisheriris;

labels= findgroups(species);

n=length(labels);

ratio=.2;

an=ratio*n; %wielkosc uczących
bn=n-an;    %wielkosc testujących

aidx=randperm(n,an); %losowe indeksy
bidx=setdiff(1:n,aidx); %różnica zbiorów

adata=meas(aidx,:);
bdata=meas(bidx,:);

alab=labels(aidx);
blab=labels(bidx);

for i=1:3
    mu(i,:)=mean(adata(alab==i,:))
    sig(i,:)=std(adata(alab==i,:))
    Pc(i,:)=length(adata(alab==i,:))/an
    for j=1:3
            p(:,i)=mvnpdf(bdata,mu(i,:),sig(i,:));
    end
end

[~,reslab]=max(p,[],2);
sum(reslab==blab)/bn

%p
