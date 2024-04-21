function [indpa,capa,capa_pi,indpa_pi,num,den]=elementospascal(numerador,denparcial,RL,Rs,np)
nump=(1*RL*denparcial)-(4*Rs*numerador);
denp=denparcial;
   
% polos_nump=solve(nump);
nump=sym2poly(nump);
denp=sym2poly(denp);
 polos_nump=roots(nump);
 polos_nump=sortrows(polos_nump);
% polos_denp=solve(denp);
 polos_denp=roots(denp);
 polos_denp=sortrows(polos_denp);
 
piz_nump=polos_nump(polos_nump<=0);
%piz_nump = round(piz_nump,6)
piz_denp=polos_denp(polos_denp<=0);

%calculo de numerador y denominador polinomios
%[num]=numedenop(piz_nump);
[num]=numedenomi(piz_nump);
numeradorp=num;
%[den]=numedenop(piz_denp)
[den]=numedenomi(piz_denp);
denominadorp=den;
 
  ps_pascal=tf(sym2poly(numeradorp),sym2poly(denominadorp));
   if Rs<RL
   znum=Rs*(denominadorp+numeradorp);
   zden=denominadorp-numeradorp;
   else
   znum=Rs*(denominadorp-numeradorp);
   zden=denominadorp+numeradorp;
   end
%znum=Rs*(denominadorp-numeradorp);
%zden=denominadorp+numeradorp; 

  pz_pascal=tf(sym2poly(znum),sym2poly(zden));

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
 
 if lzn>=lzd
   for j=1:np
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

   for j=1:np
  [a_pi b_pi]=deconv(coef_zden_pi,coef_znum_pi);
  a_pi=a_pi(1,1);
  aux_a_pi(1,j)=a_pi;
  b_pi=b_pi(b_pi~=0);
  coef_zden_pi=coef_znum_pi;
  coef_znum_pi=b_pi;
     end
     h=aux_a_pi;

     aux_a_pi(aux_a_pi==0)=[];
     vaux=flip(aux_a);
     aux_a_pi=[aux_a_pi vaux(1,1)];

      nel_pi=length(aux_a_pi);
   %capacitores
   capa_pi=aux_a_pi(1:2:nel_pi);
   %inductores
   indpa_pi=aux_a_pi(2:2:nel_pi);

    else %lzn<lzd

    %RED TIPO T
   for j=1:np
   [a b]=deconv(coef_zden,coef_znum);
   a=a(1,1);
   aux_a(1,j)=a;
   b=b(b~=0);
   coef_zden=coef_znum;
   coef_znum=b;
   end
    %nel=length(aux_a)
    %aux_a=flip(aux_a)
    len_aux=length(aux_a);
    %inductores
    indpa=aux_a(1:2:len_aux);
    %capacitores
    capa=aux_a(2:2:len_aux);



   %RED TIPO PI
     for j=1:np
  [a_pi b_pi]=deconv(coef_znum_pi,coef_zden_pi);
  a_pi=a_pi(1,1);
  aux_a_pi(1,j)=a_pi;
  b_pi=b_pi(b_pi~=0);
  coef_znum_pi=coef_zden_pi;
  coef_zden_pi=b_pi;
     end
     aux_a_pi(aux_a_pi==0)=[];
     vaux=flip(aux_a);
     aux_a_pi=[aux_a_pi vaux(1,1)];
     len_aux_pi=length(aux_a_pi);
   %capacitores
   capa_pi=aux_a_pi(1:2:len_aux_pi);
   %inductores
   indpa_pi=aux_a_pi(2:2:len_aux_pi);    
  
    end
end