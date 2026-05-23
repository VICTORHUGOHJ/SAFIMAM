clc
clearvars
format short
syms s

%Las funciones de transferencia fueron generadas con SAFIMAM

%But BP
numb = sym2poly(2.188e21*s^5 + 1.321e08*s^4 + 4.336e10*s^3 - 2.525e13*s^2 - 1.963e13*s);
denb = sym2poly(s^10 + 5.998e04*s^9 + 1.829e09*s^8 + 3.476e13*s^7 + 4.143e17*s^6 + 2.595e21*s^5 + 2.453e24*s^4 + 1.219e27*s^3 + 3.797e29*s^2 + 7.376e31*s + 7.282e33);
sys1 = tf(numb, denb);

%cheb1
numch1 = sym2poly(3.129e12*s^3);
dench1 = sym2poly(s^6 + 1.832e04*s^5 + 4.432e08*s^4 + 3.346e12*s^3 + 2.625e15*s^2 + 6.424e17*s + 2.077e20);
sys2 = tf(numch1, dench1);

%cheb2
numch2 = sym2poly(5589*s^5 + 2.626e12*s^3 + 1.96e17*s);
dench2 = sym2poly(s^6 + 2.605e04*s^5 + 3.414e08*s^4 + 2.869e12*s^3 + 2.022e15*s^2 + 9.135e17*s + 2.077e20);
sys3 = tf(numch2, dench2);

%Elip
nume = sym2poly(5942*s^5 + 4.303e12*s^3 + 2.084e17*s);
dene = sym2poly(s^6 + 1.792e04*s^5 + 4.44e08*s^4 + 4.445e12*s^3 + 2.629e15*s^2 + 6.283e17*s + 2.077e20);
sys4 = tf(nume, dene);

%PasOBR
nump1 = sym2poly(2.374e12*s^3);
denp1 = sym2poly(s^6 + 1.661e04*s^5 + 3.676e08*s^4 + 2.53e12*s^3 + 2.179e15*s^2 + 5.837e17*s + 2.083e20);
sys5 = tf(nump1, denp1);

%PasOBP
nump2 = sym2poly(2.374e12*s^3);
denp2 = sym2poly(s^6 + 1.993e04*s^5 + 4.283e08*s^4 + 3.338e12*s^3 + 2.539e15*s^2 + 7.004e17*s + 2.083e20);
sys6 = tf(nump2, denp2);

% Graficando Funciones de Transferencias Pasa Banda
h = bodeoptions; 
h.FreqUnits = 'Hz';
h.PhaseVisible = 'Off';

bodeplot(sys1, h,'yellow', sys2, h,'blue', sys3, h,'green', sys4, h,'black', sys5, h,'red', sys6, h);

legend('Butterworth', 'Chebyshev I', 'Chebyshev II', 'Elliptic', ...
       'Pascal with Stop Band Optimization', 'Pascal with Pass Band Optimization', 'Location', 'south', 'FontSize', 12, 'NumColumns', 3);

% === ETIQUETAS DE EJES ===
xlabel('Frequency', 'FontSize', 13);
ylabel('Magnitude', 'FontSize', 13);

title('Bandpass responses of the Approximation Methods', 'Color', 'Blue', 'FontSize', 14);

ax = gca;
%ax.FontSize = 13;
grid on;
