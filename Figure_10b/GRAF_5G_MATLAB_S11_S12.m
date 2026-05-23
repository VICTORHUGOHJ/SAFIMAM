%% LIMPIEZA
clc; clear; close all;

%% 1. LEER ARCHIVO
filename = 'DataFile#2.s2p';
s = sparameters(filename);

f = s.Frequencies;

S11 = squeeze(s.Parameters(1,1,:));
S12 = squeeze(s.Parameters(1,2,:));

%% 2. CONVERSIONES
S11_dB = 20*log10(abs(S11));
S12_dB = 20*log10(abs(S12));

% Métricas
IL = -S12_dB;      % Pérdida de inserción
RL = -S11_dB;      % Return Loss

% VSWR
S11_mag = abs(S11);
VSWR = (1 + S11_mag) ./ (1 - S11_mag);

%% 3. GRAFICAS S11 Y S12
%% Calculo de -3 dB usando S12
mag = S12_dB;

[peak, idx] = max(mag);
f0 = f(idx);

nivel_3dB = peak - 3;

indices = find(mag >= nivel_3dB);

f_low = f(indices(1));
f_high = f(indices(end));

%% Obtener valores en S11 en esas frecuencias
S11_f0   = interp1(f, S11_dB, f0);
S11_flow = interp1(f, S11_dB, f_low);
S11_fhigh= interp1(f, S11_dB, f_high);

%% GRAFICAS
figure;

% ---- S11 ----
subplot(2,1,1)
plot(f, S11_dB, 'b', 'LineWidth', 1.5); hold on
grid on
set(gca,'XScale','log')

% Líneas verticales
xline(f0,'--g')
xline(f_low,'--r')
xline(f_high,'--r')

% Marcadores (tipo cursor)
plot(f0, S11_f0, 'go','MarkerFaceColor','g')
plot(f_low, S11_flow, 'ro','MarkerFaceColor','r')
plot(f_high, S11_fhigh, 'ro','MarkerFaceColor','r')

% Etiquetas con valores
%text(f0, S11_f0, sprintf('  f0=%.2f Hz',f0))
%text(f_low, S11_flow, sprintf('  %.2f Hz',f_low))
%text(f_high, S11_fhigh, sprintf('  %.2f Hz',f_high))

xlabel('Frecuencia (Hz)')
ylabel('|S11| (dB)')
title('S11 (Adaptación)')

% ---- S12 ----
subplot(2,1,2)
plot(f, S12_dB, 'r','LineWidth',1.5); hold on
set(gca,'XScale','log')
grid on

% Línea -3 dB
yline(nivel_3dB,'--k','-3 dB')

% Líneas verticales
xline(f0,'--g')
xline(f_low,'--r')
xline(f_high,'--r')

% Marcadores
plot(f0, peak, 'go','MarkerFaceColor','g')
plot(f_low, nivel_3dB, 'ro','MarkerFaceColor','r')
plot(f_high, nivel_3dB, 'ro','MarkerFaceColor','r')

% Etiquetas
%text(f0, peak, sprintf('  f0=%.2f Hz',f0))
%text(f_low, nivel_3dB, sprintf('  %.2f Hz',f_low))
%text(f_high, nivel_3dB, sprintf('  %.2f Hz',f_high))

xlabel('Frecuencia (Hz)')
ylabel('|S12| (dB)')
title('S12 (Transmisión)')
legend('S12','-3 dB','Location','best')

%% Sincronizar ejes
linkaxes(findall(gcf,'Type','axes'),'x')

%% Mostrar resultados
fprintf('f0 = %.2f Hz\n', f0);
fprintf('f_low = %.2f Hz\n', f_low);
fprintf('f_high = %.2f Hz\n', f_high);

%% 4. CALCULO DE Q Y BW
mag = S12_dB;

[peak, idx] = max(mag);
f0 = f(idx);

nivel_3dB = peak - 3;

indices = find(mag >= nivel_3dB);

f_low = f(indices(1));
f_high = f(indices(end));

BW = f_high - f_low;
BW = 0.38E9
Q = f0 / BW;

%% 5. MOSTRAR RESULTADOS
fprintf('----- Results -----\n');
fprintf('Center frequency %.2f Hz\n', f0);
fprintf('Bandwidth (-3 dB): %.2f Hz\n', BW);
fprintf('Q factor: %.2f\n', Q);

%% 6. GRAFICA IL CON ANALISIS DE BANDA
figure;
plot(f, IL, 'r','LineWidth',1.5); hold on
set(gca,'XScale','log')
grid on

% Línea -3 dB (en IL es positivo)
yline(-nivel_3dB,'--k')

% Líneas verticales
xline(f0,'--g')
xline(f_low,'--b')
xline(f_high,'--b')

% ---- Marcadores (puntos) ----
% Punto central
plot(f0, IL(idx), 'go','MarkerFaceColor','g','MarkerSize',8)

% Puntos de corte (-3 dB)
plot(f_low, -nivel_3dB, 'bo','MarkerFaceColor','b','MarkerSize',8)
plot(f_high, -nivel_3dB, 'bo','MarkerFaceColor','b','MarkerSize',8)

xlabel('Frecuencia (Hz)')
ylabel('Pérdida de Inserción (dB)')
title('Pérdida de Inserción y Ancho de Banda')
legend('IL','-3 dB','Location','best')

%% Encontrar rango donde VSWR < 2
idx_vswr = find(VSWR < 2);

% Verificar que exista ese rango
if ~isempty(idx_vswr)
    f_low_vswr = f(idx_vswr(1));
    f_high_vswr = f(idx_vswr(end));
else
    disp('No hay rango donde VSWR < 2');
end

%% Grafica
figure;
plot(f, VSWR, 'k', 'LineWidth', 1.5); hold on
set(gca,'XScale','log')
grid on

% Línea de referencia VSWR = 2
yline(2, '--b', 'VSWR = 2');

% Resaltar región válida
if ~isempty(idx_vswr)
    area(f(idx_vswr), VSWR(idx_vswr), ...
        'FaceColor',[1 0 0], 'EdgeColor','none', 'FaceAlpha',0.5);
end

xlabel('Frecuencia (Hz)')
ylabel('VSWR')
title('VSWR vs Frecuencia (Región VSWR < 2 resaltada)')
legend('VSWR','Límite VSWR=2','Región válida','Location','best')

%% Mostrar rango en consola
if ~isempty(idx_vswr)
    fprintf('Rango con VSWR < 2:\n');
    fprintf('Desde %.2f Hz hasta %.2f Hz\n', f_low_vswr, f_high_vswr);
end



%% FIGURA GENERAL
figure;

%% ---- 1. S11 ----
subplot(2,2,1)
plot(f, S11_dB, 'b', 'LineWidth', 1.5, 'DisplayName','S11'); hold on
set(gca,'XScale','log')
grid on

xline(f0,'--g','DisplayName','f_0')
xline(f_low,'--r','DisplayName','f_{low}')
xline(f_high,'--r','DisplayName','f_{high}')

plot(f0, S11_f0, 'go','MarkerFaceColor','g','DisplayName','Point f_0')
plot(f_low, S11_flow, 'ro','MarkerFaceColor','r','DisplayName','Cut point')
plot(f_high, S11_fhigh, 'ro','MarkerFaceColor','r','HandleVisibility','off')

title('S11')
xlabel('Frequency (Hz)')
ylabel('|S11| (dB)')
legend show

%% ---- 2. S12 ----
subplot(2,2,2)
plot(f, S12_dB, 'r', 'LineWidth', 1.5, 'DisplayName','S12'); hold on
set(gca,'XScale','log')
grid on

yline(nivel_3dB,'--k','DisplayName','-3 dB')

xline(f0,'--g','DisplayName','f_0')
xline(f_low,'--b','DisplayName','f_{low}')
xline(f_high,'--b','HandleVisibility','off')

plot(f0, peak, 'go','MarkerFaceColor','g','DisplayName','Point f_0')
plot(f_low, nivel_3dB, 'bo','MarkerFaceColor','b','DisplayName','Cut point')
plot(f_high, nivel_3dB, 'bo','MarkerFaceColor','b','HandleVisibility','off')

title('S12')
xlabel('Frequency (Hz)')
ylabel('|S12| (dB)')
legend show

%% ---- 3. IL ----
subplot(2,2,3)
plot(f, IL, 'r','LineWidth',1.5,'DisplayName','IL'); hold on
set(gca,'XScale','log')
grid on

yline(-nivel_3dB,'--k','DisplayName','-3 dB')

xline(f0,'--g','DisplayName','f_0')
xline(f_low,'--b','DisplayName','f_{low}')
xline(f_high,'--b','HandleVisibility','off')

plot(f0, IL(idx), 'go','MarkerFaceColor','g','DisplayName','Point f_0')
plot(f_low, -nivel_3dB, 'bo','MarkerFaceColor','b','DisplayName','Cut point')
plot(f_high, -nivel_3dB, 'bo','MarkerFaceColor','b','HandleVisibility','off')

title('Insertion Loss')
xlabel('Frequency (Hz)')
ylabel('IL (dB)')
legend show

%% ---- 4. VSWR ----
subplot(2,2,4)
plot(f, VSWR, 'k','LineWidth',1.5,'DisplayName','VSWR'); hold on
set(gca,'XScale','log')
grid on

yline(2,'--b','DisplayName','VSWR = 2')

if ~isempty(idx_vswr)
    area(f(idx_vswr), VSWR(idx_vswr),10, ...
        'FaceColor',[1 0 0], ...
        'EdgeColor','none', ...
        'FaceAlpha',0.6, ...
        'DisplayName','VSWR < 2');
end

title('VSWR')
xlabel('Frequency (Hz)')
ylabel('VSWR (u/u)')
legend show

%% SINCRONIZAR EJES
linkaxes(findall(gcf,'Type','axes'),'x')



%% 8. EXPORTAR A EXCEL
T = table(f, S11_dB, S12_dB, IL, RL, VSWR);
T.Properties.VariableNames = {'Frecuencia_Hz','S11_dB','S12_dB','InsertionLoss_dB','ReturnLoss_dB','VSWR'};

writetable(T, 'C:\Users\JUBITO\Videos\Resultados_Sparam.xlsx');
disp('Datos exportados correctamente a Excel')

