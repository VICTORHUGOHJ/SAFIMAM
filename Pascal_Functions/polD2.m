function PD2=polD2(polipa,np)
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
%    disp('Par')
    poliome=polipa.*vu;
else
%    disp('impar')
    poliome=polipa.*vi;
end
PD2=expand((vpa(sum(poliome)))^2);
w=j*s;
PD2=expand(vpa(eval(PD2)));
end