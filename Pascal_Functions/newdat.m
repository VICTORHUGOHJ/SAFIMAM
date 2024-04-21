function [OmegaD,pmax]=newdat(np) 
if np>=22
    disp('Data not available')
else
T1=readtable('TablasPT.xlsx','sheet','valorescaracteristicos');
tamT1=size(T1); %tamaño de la tabla T1
for i=1:tamT1(1)
if np==T1.N(i)
   ordp=T1(i,:);
end
end
OmegaD=ordp.omegad;
pmax=ordp.pmax;
end
end