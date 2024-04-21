function [np]=pasord(amax,amin,nch1,wsp)
if nch1<=1 || nch1>=22
np=NaN;
else
ge=sqrt((10^(amax*0.1)-1)/(10^(amin*0.1)-1));
vt=1000; %variable temporal
while(vt>ge)
T1=readtable('TablasPT.xlsx','sheet','valorescaracteristicos');
tamT1=size(T1); %tamaño de la tabla T1
for i=1:tamT1(1)
if nch1==T1.N(i)
   ordp=T1(i,:);
end
end
OmegaD=ordp.omegad;
Pa1=((-1)^(nch1))/factorial(nch1);
vt2=1;
for ka=1:nch1
vt2=vt2*(((nch1+1)/(2))*OmegaD + ((nch1-1)/2)-ka+1);
end
Pa1=Pa1*vt2; %P(N,1)
%calculo de Pd(N,Ws)
Pas=((-1)^(nch1))/factorial(nch1);
vt3=1;
for ka=1:nch1
 vt3=vt3*(((nch1+1)/2)*wsp*OmegaD + ((nch1-1)/2)-ka+1);
end
Pas=Pas*vt3;%PD(N,ws)
vt=abs(Pa1/Pas);
 nch1 = nch1 + 1;
end
np = nch1 - 1;
end
end