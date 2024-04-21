function [den]=numedenomi(x)
vn=x;

if isreal(vn)==1 %si las raices unicamente son reales %%%%%%%%%%%%%%%%%%%%

%%%%c=find(vn==0)
%%%%ce=vn(c)

%%%% vn=vn(vn~=0)

 ab=vn;

 ta=length(ab);
 bn=zeros(ta,1);
 for i=1:ta
 bn(i,1)=ab(i,1);
 end
 bn = round(bn,7);
 wos=unique(bn);
 
 syms s
 dim=length(wos);
 y=1;
 %productorio
 for k=1:dim
 y=y.*(s-wos(k,:)); %se multiplican entre si el numero de combinaciones
 end

%%%if ce==0
%%% y=expand(vpa(s*y));
%%% else
%%% y=expand(vpa(y))
%%%end

den=expand(y);

else %si no son reales las raicez %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
 %identificar cuantas raices complejas hay %%%%%%%%%%%%%%%
 vaux_imag=find(imag(vn));
 vn_imag=vn(vaux_imag);

%identificar cuantas raices son reales %%%%%%%%%%%%%%%%%%%
leng=length(vaux_imag);
h=zeros(leng,1);
for kx=1:leng
g=vaux_imag(kx);
vn(g,1)=1.1;
end
vn_real=vn(vn~=1.1);

pe=isempty(vn_real); %1 si esta vacio 0 si no esta vacio
%vaux_real=find(~imag(vn))
%vn_real=vn(vaux_real)

if pe==1 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%% IF RAICES COMPLEJAS UNICAMENTE 
% vn(1,:)=[]
 ab=abs(vn_imag);
 ta=length(ab);
 bn=zeros(ta,1);
 for i=1:ta
 bn(i,1)=ab(i,1);
 end
 bn = round(bn,7);
 wos=unique(bn);
 abr=abs(real(vn_imag));
 te=length(abr);
 realu=zeros(te,1);
 for i=1:te
 realu(i,1)=abr(i,1);
 end
 pu=unique(realu);
 pareal=2*(transpose(fliplr(transpose(pu))));

 if length(wos)~=length(pareal)
 disp('Complex roots without real part, Non-realizable Network synthesis')
 else
 Q=wos.*(pareal.^-1);
 
 syms s
 dim=length(wos);
 y=1;
 %productorio
 for k=1:dim
 y=y.*(s^2+((wos(k,:))./(Q(k,:)))*s+(wos(k,:))^2); %se multiplican entre si el numero de combinaciones
 end

 %%%if rem(nbt,2)==0    %%%%%%% Si orden es Impar
 %pares
    %%%% if ce==0
    %%%% y=expand(vpa(s*y));
    %%%% else
     y=expand(vpa(y));
    %%%% end
 
%impares
% pr=isreal(r);
%if pr==1
% den=expand((s-r)*y)
%else
 den=expand(y);    
%end

%%% else                     %%%%%%%%% Si orden es Par
%pr=isreal(r);
%if pr==1
% den=expand((s-r)*y);
%else
%%% den=expand(y);    
%end

%%% end  %%%%%%%%%%%%%termina si es pas impar para determinar y para raices complejas
 end %end para determinar si existen unicamente raices imaginarias

else %%%%%%%%para raices reales y complejas

 ab1=vn_real;
 ta1=length(ab1);
 bn1=zeros(ta1,1);
 for i=1:ta1
 bn1(i,1)=ab1(i,1);
 end
 bn1 = round(bn1,7);
 wos1=unique(bn1);
 
 syms s
 dim1=length(wos1);
 y1=1;
 %productorio
 for k=1:dim1
 y1=y1.*(s-wos1(k,:)); %se multiplican entre si el numero de combinaciones
 end
 
%%%%if ce==0      %%%ya se esta considerando el valor de la raiz cero 0
%%%% y1=expand(vpa(s*y1));
%%%% else
 y1=expand(vpa(y1));
%%%%end

%den=expand(y1)

 ab=abs(vn_imag);
 ta=length(ab);
 bn=zeros(ta,1);
 for i=1:ta
 bn(i,1)=ab(i,1);
 end
 bn = round(bn,7);
 wos=unique(bn);
 abr=abs(real(vn_imag));
 te=length(abr);
 realu=zeros(te,1);
 for i=1:te
 realu(i,1)=abr(i,1);
 end
 pu=unique(realu);
 pareal=2*(transpose(fliplr(transpose(pu))));

 if length(wos)~=length(pareal)
 disp('Complex roots without real part, Non-realizable Network synthesis')
 else
 Q=wos.*(pareal.^-1);
 
 syms s
 dim=length(wos);
 y=1;
 %productorio
 for k=1:dim
 y=y.*(s^2+((wos(k,:))./(Q(k,:)))*s+(wos(k,:))^2); %se multiplican entre si el numero de combinaciones
 end

 y2=expand(vpa(y1*y));
 den=expand(y2);    

 end %end para determinar si existen unicamente raices imaginarias





end %end para raices reales y complejas
end %%%extra agrengado apenas definir si son raices reales o complejas
end