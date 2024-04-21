function polipa=CoeficientesPascal(np,OmegaD)
aN=(((-1)^np)/factorial(np))*(((np+1)/2)*OmegaD)^np;
if rem(np,2)==0
   % disp('Par')
    h=0;
else
  %  disp('impar')
    h=1;
end
x=(np-h)/2-1;
z=[0];
for i=0:x
z=[z,((2*i+1+h)/2)^2];
end
zt=z(z~=0); %calculo de BasicTerm(i)
ai=[0];
%for k=0:8
    if zt==1 %para el caso de n=3
for k=0:1        
f=nchoosek(zt,k); %se realizan las combinaciones posibles
y=1;
for j=1:k
y=y.*f(:,j); %se multiplican entre si el numero de combinaciones
end
yt=sum(y); %se suman entre si el resultado de las multiplicaciones de las combinaciones
w=(((-1)^(k+h))/factorial(np))*(((np+1)/2)*OmegaD)^(np-2*k); %calculo de la otra parte de la ecuación
ai=[ai,w]; %multiplicaciones de ecuaciones
        end    
    else
for k=0:10        
f=nchoosek(zt,k); %se realizan las combinaciones posibles
y=1;
for j=1:k
y=y.*f(:,j); %se multiplican entre si el numero de combinaciones
end
yt=sum(y); %se suman entre si el resultado de las multiplicaciones de las combinaciones
w=(((-1)^(k+h))/factorial(np))*(((np+1)/2)*OmegaD)^(np-2*k); %calculo de la otra parte de la ecuación
ai=[ai,w*yt]; %multiplicaciones de ecuaciones
    end
    end
polipa=fliplr(ai(ai~=0)); %polinomio de pascal en forma de vector
end