function [syspmin]=funpas_optbandpas(np,wsp,amin)
[OmegaD,pmax]=newdat(np); %se determina OmegaD y Pmax del polinomio de grano np
polipa=CoeficientesPascal(np,OmegaD); %se manda a llamar la funcion coeficientespascal
PD2=polD2(polipa,np); %se calcula el polinomio de pascal
polipainv=abs(fliplr(polipa(polipa~=0)));

Poms=((-1)^(np))/factorial(np);
te=1;
for kte=1:np
 te=te*(((np+1)/2)*wsp*OmegaD + ((np-1)/2)-kte+1);
end
Poms=Poms*te; %PD(N,Ws)
lambdamin=sqrt(10^(amin/10)-1)/abs(Poms);
cmin=1/(lambdamin*polipainv(1,1));
denminparcial=1+(lambdamin^2)*PD2; %polinomio del denominador
polosmin=solve(denminparcial); %polos de la función de transferencia
vn=polosmin(polosmin<0);
denmin=denominador(vn,np);
%disp('Pascal - Optimización de la Banda de Paso')
syspmin=tf(cmin,sym2poly(denmin));
end