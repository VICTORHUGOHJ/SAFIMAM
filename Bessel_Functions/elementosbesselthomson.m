function [indpa,capa,indpa_pi,capa_pi]=elementosbesselthomson(denbt,numbt,nbt,RL,Rs)
syms s
im=0;
nbet=length(denbt)-1;
[fil,col]=size(nbet);
aux=ones(1,col);
for y=1:nbet
im=im(im~=0);
im=[im,aux*s^y];
end

ese=fliplr([1,im]);

om=0;
auxo=ones(1,col);
for yn=1:nbet
om=om(om~=0);
om=[om,auxo*(-s)^yn];
end

eso=fliplr([1,om]);

denomin=vpa(sum(ese.*denbt));
denomineg=vpa(sum(eso.*denbt));

%numera=abs(kbt)*numbt;
numera=numbt;
%numera=abs(kbt);

an=factorial(2*nbt-nbt)/((2^(nbt-nbt))*factorial(nbt)*factorial(nbt-nbt));

%k=1;
k=(4*(Rs*RL))/((Rs+RL)^2);
%k=8*RS/(RS+RL)
%k=2*(RS+RL)
%k=(4*RS)/RL;
ps2=(denomin*denomineg-(k*numera^2))/(denomin*denomineg);
%ps2_num=((numera^2)/(denomin*denomineg))-k
%ps2_den=denomin*denomineg
%ps2=ps2_num/ps2_den
%numps2=solve(denomin*denomineg-(k*numera^2))
%u=vpa(denomin*denomineg-(k*(numera)^2))
%v=vpa(denomin*denomineg)
numps2=solve(denomin*denomineg-(k*(numera)^2));
denps2=solve(denomin*denomineg);

piz_nump=numps2(numps2<=0);
piz_nump = unique(round(piz_nump,6));
piz_denp=denps2(denps2<=0);

%[num]=numedeno(piz_nump,nbt);
%[num]=numedenom(piz_nump,nbt);
[num]=numedenomi(piz_nump);
numeradorp=num;

%[den]=numedeno(piz_denp,nbt);
%[den]=numedenom(piz_denp,nbt);
[den]=numedenomi(piz_denp);
denominadorp=den;

ps_bessel=tf(sym2poly(numeradorp),sym2poly(denominadorp));

%if Rs<RL %RS*
%   znum=Rs*(denominadorp+numeradorp);
%   zden=denominadorp-numeradorp;
%else
%  znum=Rs*(denominadorp-numeradorp);
%  zden=denominadorp+numeradorp;
%end

%iguales RS=RL
%znum=Rs*(denominadorp-numeradorp);
%   zden=denominadorp+numeradorp;

%iguales RS<RL
%znum=RL*(denominadorp-numeradorp);
%   zden=denominadorp+numeradorp;

%iguales RS>RL
znum=(denominadorp-numeradorp);
   zden=denominadorp+numeradorp;

pz_bessel=tf(sym2poly(znum),sym2poly(zden));
%pz_bessel_n=tf(sym2poly(znum_n),sym2poly(zden_n))

  coef_znum=sym2poly(znum);
  coef_zden=sym2poly(zden);

  coef_znum_pi=sym2poly(znum);
  coef_zden_pi=sym2poly(zden);

  lzn=length(coef_znum);
  lzd=length(coef_zden);

  a=zeros(1,50);
  b=zeros(1,50);
  aux_a=0;
 aux_a_pi=0;
 
 if lzn>lzd
   for j=1:nbt
   [a b]=deconv(coef_znum,coef_zden);
   a=a(1,1);
   aux_a(1,j)=a;
   b=b(b~=0);
   coef_znum=coef_zden;
   coef_zden=b;
   end
    nel=length(aux_a);
    g=aux_a;
    %inductores
    indpa=aux_a(1:2:nel);
    %capacitores
    capa=aux_a(2:2:nel);

   for j=1:nbt
  [a_pi b_pi]=deconv(coef_zden_pi,coef_znum_pi);
  a_pi=a_pi(1,1);
  aux_a_pi(1,j)=a_pi;
  b_pi=b_pi(b_pi~=0);
  coef_zden_pi=coef_znum_pi;
  coef_znum_pi=b_pi;
     end
     g=aux_a_pi;
      nel_pi=length(aux_a_pi);
   %capacitores
   capa_pi=aux_a_pi(1:2:nel_pi);
   %inductores
   indpa_pi=aux_a_pi(2:2:nel_pi);

    else 

    %RED TIPO T
   for j=1:nbt
   [a b]=deconv(coef_zden,coef_znum);
   a=a(1,1);
   aux_a(1,j)=a;
   b=b(b~=0);
   coef_zden=coef_znum;
   coef_znum=b;
   end
    %nel=length(aux_a)
    aux_a=flip(aux_a);
    len_aux=length(aux_a);
    %inductores
    indpa=aux_a(1:2:len_aux);
    %capacitores
    capa=aux_a(2:2:len_aux);



   %RED TIPO PI
     for j=1:nbt
  [a_pi b_pi]=deconv(coef_znum_pi,coef_zden_pi);
  a_pi=a_pi(1,1);
  aux_a_pi(1,j)=a_pi;
  b_pi=b_pi(b_pi~=0);
  coef_znum_pi=coef_zden_pi;
  coef_zden_pi=b_pi;
     end
     aux_a_pi(aux_a_pi==0)=[];
     vaux=flip(aux_a_pi);
     aux_a_pi=[aux_a(1,1) vaux];
     len_aux_pi=length(aux_a_pi);
   %capacitores
   capa_pi=aux_a_pi(1:2:len_aux_pi);
   %inductores
   indpa_pi=aux_a_pi(2:2:len_aux_pi);    
  
    end
end
