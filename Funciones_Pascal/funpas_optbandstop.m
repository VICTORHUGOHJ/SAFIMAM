function sysp=funpas_optbandstop(np,amax)
[OmegaD,pmax]=newdat(np); %se determina OmegaD y Pmax del polinomio de grano np
polipa=CoeficientesPascal(np,OmegaD); %se manda a llamar la funcion coeficientespascal
PD2=polD2(polipa,np); %se calcula el polinomio de pascal

%%%%%%%%Optimización de la Banda de Rechazo%%%%%%%%%%%%%%%%%

lambdamax=sqrt(10^(amax/10) -1)/abs(pmax);
%polinomio del denominador de la funcion de transferencia
denparcial=1+(lambdamax^2)*PD2; %polinomio del denominador
polos=solve(denparcial); %polos de la función de transferencia
vn=polos(polos<0); %extraer solo polos del semiplano izquierdo
den=denominador(vn,np);%se manda a llamar la funcion que contiene al polinomio del denominador
num=1;%polinomio del denominador
polipainv=abs(fliplr(polipa(polipa~=0)));
constante=1/(lambdamax*polipainv(1,1));
%disp('Pascal - Optimización de la Banda de Rechazo')
sysp=tf(num*constante,sym2poly(den));
end