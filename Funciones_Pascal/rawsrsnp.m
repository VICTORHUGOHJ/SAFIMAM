function [amax,amin,np,OmegaD,pmax] = rawsrsnp(amax,amin,ws,RS,np)
h=mod(np,2);
if ((h==0) && (RS==1))
%    disp('RS=RL no se puede diseñar directamente')
 np = np+1; %se incrementa un orden
T1=readtable('TablasPT.xlsx','sheet','valorescaracteristicos');
tamT1=size(T1); %tamaño de la tabla T1
for i=1:tamT1(1)
if np==T1.N(i)
   ordp=T1(i,:);
end
end
OmegaD=ordp.omegad;%se determina Wd
pmax=ordp.pmax;
 return;

elseif (h==1)
%disp('orden impar y se puede calcular todo sin problema')
T1=readtable('TablasPT.xlsx','sheet','valorescaracteristicos');
tamT1=size(T1); %tamaño de la tabla T1
for i=1:tamT1(1)
if np==T1.N(i)
   ordp=T1(i,:);
end
end
OmegaD=ordp.omegad;%se determina Wd
pmax=ordp.pmax;
return;
end

T1=readtable('TablasPT.xlsx','sheet','valorescaracteristicos');
tamT1=size(T1); %tamaño de la tabla T1
for i=1:tamT1(1)
if np==T1.N(i)
   ordp=T1(i,:);
end
end
pmax=ordp.pmax;
OmegaD=ordp.omegad;
Pdcero=((-1)^(np))/factorial(np);
tdc=1;
for kdc=1:np
 tdc=tdc*(((np-1)/2)-kdc+1);
end
Pdcero=Pdcero*tdc;

pr=10^(amax/10)-1;
p1=1+2*(Pdcero^2/pmax^2)*pr;
p2=2*abs(Pdcero/pmax)*sqrt(pr*(1+(Pdcero^2/pmax^2)*pr));
RS1=p1-p2; %Minimo
RS2=p1+p2; %Maximo


%%%%%%%%EXTRA%%%%%%%%%
lamax=sqrt(10^(amax/10)-1)/abs(pmax);
ao=20*log10((RS+1)/(2*sqrt(RS)));
dA=20*log10(sqrt(1+(lamax^2)*(Pdcero^2)));
%%%%%%%%%%%%%%%%%%%%%%
if ((RS<RS1) || (RS>RS2))
%    disp('Esta dentro del rango Realizable')
%T1=readtable('TablasPT.xlsx','sheet','valorescaracteristicos');
%tamT1=size(T1); %tamaño de la tabla T1
%for i=1:tamT1(1)
%if np==T1.N(i)
%   ordp=T1(i,:);
%end
%end
%OmegaD=ordp.omegad;%se determina Wd
OmegaD;
pmax;
return;

else
%    disp('No esta dentro del rango realizable')
%Pdcero=((-1)^(np))/factorial(np);
%tdc=1;
%for kdc=1:np
% tdc=tdc*(((np-1)/2)-kdc+1);
%end
%Pdcero=Pdcero*tdc;
%
%T1=readtable('TablasPT.xlsx','sheet','valorescaracteristicos');
%tamT1=size(T1); %tamaño de la tabla T1
%for i=1:tamT1(1)
%if np==T1.N(i)
%   ordp=T1(i,:);
%end
%end
%pmax=ordp.pmax;
%OmegaD=ordp.omegad;
%%%%%%%
%calculo de nuevo rizo recomendado
dr=(((RS-1)^2)*pmax^2)/(4*RS*(Pdcero^2));
amaxo=20*log10(sqrt(1+dr));

wsp=ws*10;
Poms=((-1)^(np))/factorial(np);
te=1;
for kte=1:np
 te=te*(((np+1)/2)*wsp*OmegaD + ((np-1)/2)-kte+1);
end
Poms=Poms*te; %PD(N,Ws)
Asmx=10*log10(((((RS-1)^2)*(Poms^2))/(4*RS*(Pdcero^2)))+1);

end
if (amaxo>amax)
 np = np + 1;
T1=readtable('TablasPT.xlsx','sheet','valorescaracteristicos');
tamT1=size(T1); %tamaño de la tabla T1
for i=1:tamT1(1)
if np==T1.N(i)
   ordp=T1(i,:);
end
end
OmegaD=ordp.omegad;%se determina Wd
pmax=ordp.pmax;
 return;

elseif (amin>Asmx)
 np = np + 1;
T1=readtable('TablasPT.xlsx','sheet','valorescaracteristicos');
tamT1=size(T1); %tamaño de la tabla T1
for i=1:tamT1(1)
if np==T1.N(i)
   ordp=T1(i,:);
end
end
OmegaD=ordp.omegad;%se determina Wd
pmax=ordp.pmax;
 return;
end

amax=amaxo;
amin=Asmx;
T1=readtable('TablasPT.xlsx','sheet','valorescaracteristicos');
tamT1=size(T1); %tamaño de la tabla T1
for i=1:tamT1(1)
if np==T1.N(i)
   ordp=T1(i,:);
end
end
OmegaD=ordp.omegad;%se determina Wd
pmax=ordp.pmax;
end