function [tawos tapareal]=tamanpascal(x)
vn=x;
 r=vn(1,1);
 vn=vn(vn~=0);
 vn(1,:)=[];
 ab=abs(vn);
 ta=length(ab);
 bn=zeros(ta,1);
 for i=1:ta
 bn(i,1)=ab(i,1);
 end
 bn = round(bn,7);
 wos=unique(bn);
 abr=abs(real(vn));
 te=length(abr);
 realu=zeros(te,1);
 for i=1:te
 realu(i,1)=abr(i,1);
 end
 pu=unique(realu);
 pareal=2*(transpose(fliplr(transpose(pu))));
 tawos=length(wos);
 tapareal=length(pareal);
end