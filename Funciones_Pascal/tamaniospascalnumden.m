function [tawosnum taparealnum tawosden taparealden]=tamaniospascalnumden(numerador,denparcial,rs)
nump_max=(denparcial)-(4*rs*numerador);
denp_max=denparcial;
   
 polos_nump=solve(nump_max);
 polos_nump=sortrows(polos_nump);
 polos_denp=solve(denp_max);
 polos_denp=sortrows(polos_denp);
 
piz_nump=polos_nump(polos_nump<=0);
piz_nump = round(piz_nump,6);
piz_denp=polos_denp(polos_denp<=0);

[tawosnum taparealnum]=tamanpascal(piz_nump);
[tawosden taparealden]=tamanpascal(piz_denp);

end