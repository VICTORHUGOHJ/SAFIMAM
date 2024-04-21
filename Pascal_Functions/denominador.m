function den=denominador(vn,np)
h=mod(np,2);
if h==1
r=vn(1,1);
vn(1,:)=[];
ab=abs(vn);
ta=length(ab);
bn=zeros(ta,1);
for i=1:ta
bn(i,1)=ab(i,1);
end

wos=unique(bn);

abr=abs(real(vn));
te=length(abr);
realu=zeros(te,1);
for i=1:te
realu(i,1)=abr(i,1);
end
pu=unique(realu);
pareal=2*(transpose(fliplr(transpose(pu))));

Q=wos.*(pareal.^-1);

syms s
dim=length(wos);
y=1;
%productorio
for k=1:dim
y=y.*(s^2+((wos(k,:))./(Q(k,:)))*s+(wos(k,:))^2); %se multiplican entre si el numero de combinaciones
end
y=expand(vpa(y));
den=expand((s-r)*y);

elseif h==0
    
ab=abs(vn);
ta=length(ab);
bn=zeros(ta,1);
for i=1:ta
bn(i,1)=ab(i,1);
end
wos=unique(bn);

abr=abs(real(vn));
te=length(abr);
realu=zeros(te,1);
for i=1:te
realu(i,1)=abr(i,1);
end
pu=unique(realu);
pareal=2*(transpose(fliplr(transpose(pu))));

Q=wos.*(pareal.^-1);

syms s
dim=length(wos);
y=1;
%productorio
for k=1:dim
y=y.*(s^2+((wos(k,:))./(Q(k,:)))*s+(wos(k,:))^2); %se multiplican entre si el numero de combinaciones
end
den=expand(vpa(y));
end
