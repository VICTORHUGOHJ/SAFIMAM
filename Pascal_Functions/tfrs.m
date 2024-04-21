function [sysprs,syspminrs,np,denparcial,numerador,denminparcial,numin,nump_max,denp_max,nump_min,denp_min]=tfrs(ws,amax,amin,np,Rs)
[amax,amin,np,OmegaD,pmax] = rawsrsnp(amax,amin,ws,Rs,np);
wsp=ws*10;
polipa=CoeficientesPascal(np,OmegaD); %se manda a llamar la funcion coeficientespascal
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
syms w s
poliD=0;
[fil,col]=size(polipa);
aux=ones(1,col);
%omegas para polinomios pares
om=0;
for y=0:2:np
om=om(om~=0);
om=[om,aux*w^y];
end
[vu,iu]=unique(om);
%omegas para polinomios impares
im=0;
for y=1:2:np
im=im(im~=0);
im=[im,aux*w^y];
end
[vi,ii]=unique(im);
if rem(np,2)==0
    %disp('Par')
    poliome=polipa.*vu;
else
    %disp('impar')
    poliome=polipa.*vi;
end
PD2=expand((vpa(sum(poliome)))^2);
w=j*s;
PD2=expand(vpa(eval(PD2)));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%calculando lambda maximo
%pmax=ordp.pmax;
lambdamax=sqrt(10^(amax/10) -1)/abs(pmax);
%polinomio del denominador de la funcion de transferencia
denparcial=1+(lambdamax^2)*PD2; %polinomio del denominador
polos=solve(denparcial); %polos de la función de transferencia
vn=polos(polos<0); %extraer solo polos del semiplano izquierdo

den=denominador(vn,np);%se manda a llamar la funcion que contiene al polinomio del denominador

%%%%%%%%%%%%%%%numerador sin RS%%%%%%%%%%%%%%%%%%%%%
%num=1;%polinomio del denominador
%polipainv=abs(fliplr(polipa(polipa~=0)));
%constante=1/(lambdamax*polipainv(1,1));
%num*constante
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
he=mod(np,2);
Pdcero=((-1)^(np))/factorial(np);
tdc=1;
for kdc=1:np
 tdc=tdc*(((np-1)/2)-kdc+1);
end
Pdcero=Pdcero*tdc;
comp=(1+(lambdamax^2)*(Pdcero^2))^(1-he);
numerador=((1/(Rs+1))^2)*(comp);
%nump_max=numerador; %tenia raiz cuadrada
nump_max=sqrt(numerador); %tenia raiz cuadrada
denp_max=den;
%sacar raiz numerador
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sysprs=tf(nump_max,sym2poly(den));

%Determinar función de transferencia para el filtro de borde de la banda de
%paso con lambdamin
%deteminando lambdamin
Poms=((-1)^(np))/factorial(np);
te=1;
for kte=1:np
 te=te*(((np+1)/2)*wsp*OmegaD + ((np-1)/2)-kte+1);
end
Poms=Poms*te; %PD(N,Ws)
lambdamin=sqrt(10^(amin/10)-1)/abs(Poms);
%%%%%%%%%%%%%%%numerador sin RS%%%%%%%%%%%%%%%
%cmin=1/(lambdamin*polipainv(1,1))
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
comple=(1+(lambdamin^2)*(Pdcero^2))^(1-he);
numin=((1/(Rs+1))^2)*(comple);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
denminparcial=1+(lambdamin^2)*PD2; %polinomio del denominador
polosmin=solve(denminparcial); %polos de la función de transferencia
vn_x=polosmin(polosmin<0);

denmin=denominador(vn_x,np);

%nump_min=numin; %tenia raiz
nump_min=sqrt(numin); %tenia raiz
%nump_min=0.32665
denp_min=denmin;
syspminrs=tf(nump_min,sym2poly(denmin));
end