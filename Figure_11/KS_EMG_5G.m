clc;
clearvars;

%% =========================
% 1. CARGAR DATOS 5G
%% =========================
data1_5g = readmatrix('Med1_5G_S12ADS.xlsx');
data2_5g = readmatrix('Med1_5G_MATLAB_ADS.xlsx');
data3_5g = readmatrix('Med1_5G_ANVECTORIAL.xlsx');

Mag1_5g = data1_5g(:,2);
Mag2_5g = data2_5g(:,2);
Mag3_5g = data3_5g(:,3);

%% =========================
% 2. CARGAR DATOS EMG
%% =========================
data1_emg = readmatrix('Med1_EMG_LTSPICE.xlsx');
data2_emg = readmatrix('Med1_EMG_MATLAB_LTSPICE.xlsx');
data3_emg = readmatrix('Med1_EMG_FPAA.xlsx');

Mag1_emg = data1_emg(:,2);
Mag2_emg = data2_emg(:,2);
Mag3_emg = data3_emg(:,2);

%% =========================
% 3. FUNCIÓN PARA CALCULAR CDF Y KS
%% =========================
function [centers_all, cdf1, cdf2, cdf3, ks12_zoom, ks13_zoom, ks23_zoom, idx12_zoom, idx13_zoom, idx23_zoom, centers_zoom, counts1_zoom, counts2_zoom, counts3_zoom] = calcular_ks_y_cdf(Mag1, Mag2, Mag3, nombre1, nombre2, nombre3, zoom_min, zoom_max)
    
    % Calcular CDF con todos los datos
    nbins = 50;
    all_data = [Mag1; Mag2; Mag3];
    edges_all = linspace(min(all_data), max(all_data), nbins+1);
    
    [counts1, edges] = histcounts(Mag1, edges_all, 'Normalization','pdf');
    [counts2, ~]     = histcounts(Mag2, edges_all, 'Normalization','pdf');
    [counts3, ~]     = histcounts(Mag3, edges_all, 'Normalization','pdf');
    
    centers_all = edges(1:end-1) + diff(edges)/2;
    
    cdf1 = cumsum(counts1);
    cdf2 = cumsum(counts2);
    cdf3 = cumsum(counts3);
    
    % Calcular KS global
    diff12_global = abs(cdf1 - cdf2);
    diff13_global = abs(cdf1 - cdf3);
    diff23_global = abs(cdf2 - cdf3);
    
    [ks12_global, idx12_global] = max(diff12_global);
    [ks13_global, idx13_global] = max(diff13_global);
    [ks23_global, idx23_global] = max(diff23_global);
    
    % Calcular KS dentro del zoom
    zoom_indices = find(centers_all >= zoom_min & centers_all <= zoom_max);
    
    [diff12_zoom, idx12_zoom_rel] = max(diff12_global(zoom_indices));
    idx12_zoom = zoom_indices(idx12_zoom_rel);
    ks12_zoom = diff12_zoom;
    
    [diff13_zoom, idx13_zoom_rel] = max(diff13_global(zoom_indices));
    idx13_zoom = zoom_indices(idx13_zoom_rel);
    ks13_zoom = diff13_zoom;
    
    [diff23_zoom, idx23_zoom_rel] = max(diff23_global(zoom_indices));
    idx23_zoom = zoom_indices(idx23_zoom_rel);
    ks23_zoom = diff23_zoom;
    
    % Datos para histogramas con zoom
    zoom_mask = (centers_all >= zoom_min) & (centers_all <= zoom_max);
    centers_zoom = centers_all(zoom_mask);
    counts1_zoom = counts1(zoom_mask);
    counts2_zoom = counts2(zoom_mask);
    counts3_zoom = counts3(zoom_mask);
    
    % Mostrar información en consola
    fprintf('\n=== %s ===\n', nombre1);
    fprintf('Rango de datos: %.2f a %.2f dB\n', min(all_data), max(all_data));
    fprintf('KS global %s vs %s = %.6f (en %.2f dB)\n', nombre1, nombre2, ks12_global, centers_all(idx12_global));
    fprintf('KS global %s vs %s = %.6f (en %.2f dB)\n', nombre1, nombre3, ks13_global, centers_all(idx13_global));
    fprintf('KS global %s vs %s = %.6f (en %.2f dB)\n', nombre2, nombre3, ks23_global, centers_all(idx23_global));
    fprintf('KS zoom (-28 a 0 dB) %s vs %s = %.6f (en %.2f dB)\n', nombre1, nombre2, ks12_zoom, centers_all(idx12_zoom));
    fprintf('KS zoom (-28 a 0 dB) %s vs %s = %.6f (en %.2f dB)\n', nombre1, nombre3, ks13_zoom, centers_all(idx13_zoom));
    fprintf('KS zoom (-28 a 0 dB) %s vs %s = %.6f (en %.2f dB)\n', nombre2, nombre3, ks23_zoom, centers_all(idx23_zoom));
end

%% =========================
% 4. DEFINIR PARÁMETROS COMUNES
%% =========================
zoom_min = -28;
zoom_max = 0;

%% =========================
% 5. CALCULAR PARA EMG (PRIMERO)
%% =========================
fprintf('\n========================================');
fprintf('\n=== ANÁLISIS EMG: LTSPICE, MATLAB, FPAA ===');
fprintf('\n========================================');

[centers_emg, cdf1_emg, cdf2_emg, cdf3_emg, ks12_emg, ks13_emg, ks23_emg, ...
 idx12_emg, idx13_emg, idx23_emg, centers_zoom_emg, counts1_zoom_emg, ...
 counts2_zoom_emg, counts3_zoom_emg] = calcular_ks_y_cdf(Mag1_emg, Mag2_emg, Mag3_emg, ...
    'LTSPICE', 'MATLAB', 'FPAA', zoom_min, zoom_max);

%% =========================
% 6. CALCULAR PARA 5G (SEGUNDO)
%% =========================
fprintf('\n========================================');
fprintf('\n=== ANÁLISIS 5G: ADS, MATLAB, MS4644B ===');
fprintf('\n========================================');

[centers_5g, cdf1_5g, cdf2_5g, cdf3_5g, ks12_5g, ks13_5g, ks23_5g, ...
 idx12_5g, idx13_5g, idx23_5g, centers_zoom_5g, counts1_zoom_5g, ...
 counts2_zoom_5g, counts3_zoom_5g] = calcular_ks_y_cdf(Mag1_5g, Mag2_5g, Mag3_5g, ...
    'ADS', 'MATLAB', 'MS4644B', zoom_min, zoom_max);

%% =========================
% 7. FIGURA UNIFICADA: EMG ARRIBA, 5G ABAJO
%% =========================
figure('Name','Análisis Comparativo EMG vs 5G (-28dB a 0dB)','Position',[50 50 1400 900]);

% ==================== FILA 1 - EMG ====================
% SUBPLOT 1: HISTOGRAMAS EMG
subplot(2,2,1);
bar(centers_zoom_emg, counts1_zoom_emg, 'FaceAlpha',0.4, 'FaceColor','b', 'EdgeColor','k', 'LineWidth',0.5); hold on;
bar(centers_zoom_emg, counts2_zoom_emg, 'FaceAlpha',0.4, 'FaceColor','r', 'EdgeColor','k', 'LineWidth',0.5);
bar(centers_zoom_emg, counts3_zoom_emg, 'FaceAlpha',0.4, 'FaceColor','g', 'EdgeColor','k', 'LineWidth',0.5);
xlabel('Magnitude (dB)', 'FontSize', 10);
ylabel('PDF', 'FontSize', 10);
title('EMG Filter - histograms', 'FontSize', 11, 'FontWeight','bold');
legend('LTSPICE', 'MATLAB', 'FPAA', 'Location','best', 'FontSize', 8);
grid on;
xlim([-28 0]);

% SUBPLOT 2: CDF EMG
subplot(2,2,2);
plot(centers_emg, cdf1_emg, 'b-', 'LineWidth', 2); hold on;
plot(centers_emg, cdf2_emg, 'r-', 'LineWidth', 2);
plot(centers_emg, cdf3_emg, 'g-', 'LineWidth', 2);

% Líneas KS del zoom
plot([centers_emg(idx12_emg) centers_emg(idx12_emg)], [cdf1_emg(idx12_emg) cdf2_emg(idx12_emg)], 'k--', 'LineWidth', 1.5);
plot([centers_emg(idx13_emg) centers_emg(idx13_emg)], [cdf1_emg(idx13_emg) cdf3_emg(idx13_emg)], 'k--', 'LineWidth', 1.5);
plot([centers_emg(idx23_emg) centers_emg(idx23_emg)], [cdf2_emg(idx23_emg) cdf3_emg(idx23_emg)], 'k--', 'LineWidth', 1.5);

% Anotaciones KS
text(centers_emg(idx12_emg), mean([cdf1_emg(idx12_emg), cdf2_emg(idx12_emg)]) + 0.05, ...
    sprintf('KS = %.4f', ks12_emg), 'HorizontalAlignment','center', 'FontSize', 7, 'BackgroundColor','white');
text(centers_emg(idx13_emg), mean([cdf1_emg(idx13_emg), cdf3_emg(idx13_emg)]) - 0.05, ...
    sprintf('KS = %.4f', ks13_emg), 'HorizontalAlignment','center', 'FontSize', 7, 'BackgroundColor','white');
text(centers_emg(idx23_emg), mean([cdf2_emg(idx23_emg), cdf3_emg(idx23_emg)]) + 0.05, ...
    sprintf('KS = %.4f', ks23_emg), 'HorizontalAlignment','center', 'FontSize', 7, 'BackgroundColor','white');

xlabel('Magnitude (dB)', 'FontSize', 10);
ylabel('CDF', 'FontSize', 10);
title(sprintf('EMG Filter - CDF Comparison - KS: LT-MAT=%.4f, LT-FPAA=%.4f, MAT-FPAA=%.4f', ...
    ks12_emg, ks13_emg, ks23_emg), 'FontSize', 9);
legend('LTSPICE', 'MATLAB', 'FPAA', 'Location','best', 'FontSize', 8);
grid on;
xlim([-28 0]);
ylim([0 1]);

% ==================== FILA 2 - 5G ====================
% SUBPLOT 3: HISTOGRAMAS 5G
subplot(2,2,3);
bar(centers_zoom_5g, counts1_zoom_5g, 'FaceAlpha',0.4, 'FaceColor','b', 'EdgeColor','k', 'LineWidth',0.5); hold on;
bar(centers_zoom_5g, counts2_zoom_5g, 'FaceAlpha',0.4, 'FaceColor','r', 'EdgeColor','k', 'LineWidth',0.5);
bar(centers_zoom_5g, counts3_zoom_5g, 'FaceAlpha',0.4, 'FaceColor','g', 'EdgeColor','k', 'LineWidth',0.5);
xlabel('Magnitude (dB)', 'FontSize', 10);
ylabel('PDF', 'FontSize', 10);
title('5G Filter - histograms', 'FontSize', 11, 'FontWeight','bold');
legend('ADS', 'MATLAB', 'MS4644B', 'Location','best', 'FontSize', 8);
grid on;
xlim([-28 0]);

% SUBPLOT 4: CDF 5G
subplot(2,2,4);
plot(centers_5g, cdf1_5g, 'b-', 'LineWidth', 2); hold on;
plot(centers_5g, cdf2_5g, 'r-', 'LineWidth', 2);
plot(centers_5g, cdf3_5g, 'g-', 'LineWidth', 2);

% Líneas KS del zoom
plot([centers_5g(idx12_5g) centers_5g(idx12_5g)], [cdf1_5g(idx12_5g) cdf2_5g(idx12_5g)], 'k--', 'LineWidth', 1.5);
plot([centers_5g(idx13_5g) centers_5g(idx13_5g)], [cdf1_5g(idx13_5g) cdf3_5g(idx13_5g)], 'k--', 'LineWidth', 1.5);
plot([centers_5g(idx23_5g) centers_5g(idx23_5g)], [cdf2_5g(idx23_5g) cdf3_5g(idx23_5g)], 'k--', 'LineWidth', 1.5);

% Anotaciones KS
text(centers_5g(idx12_5g), mean([cdf1_5g(idx12_5g), cdf2_5g(idx12_5g)]) + 0.05, ...
    sprintf('KS = %.4f', ks12_5g), 'HorizontalAlignment','center', 'FontSize', 7, 'BackgroundColor','white');
text(centers_5g(idx13_5g), mean([cdf1_5g(idx13_5g), cdf3_5g(idx13_5g)]) - 0.05, ...
    sprintf('KS = %.4f', ks13_5g), 'HorizontalAlignment','center', 'FontSize', 7, 'BackgroundColor','white');
text(centers_5g(idx23_5g), mean([cdf2_5g(idx23_5g), cdf3_5g(idx23_5g)]) + 0.05, ...
    sprintf('KS = %.4f', ks23_5g), 'HorizontalAlignment','center', 'FontSize', 7, 'BackgroundColor','white');

xlabel('MagnitudE (dB)', 'FontSize', 10);
ylabel('CDF', 'FontSize', 10);
title(sprintf('5G Filter - CDF Comparison - KS: ADS-MAT=%.4f, ADS-MS4=%.4f, MAT-MS4=%.4f', ...
    ks12_5g, ks13_5g, ks23_5g), 'FontSize', 9);
legend('ADS', 'MATLAB', 'MS4644B', 'Location','best', 'FontSize', 8);
grid on;
xlim([-28 0]);
ylim([0 1]);

%% =========================
% 8. TABLA RESUMEN COMPARATIVA
%% =========================
fprintf('\n========================================');
fprintf('\n=== TABLA RESUMEN COMPARATIVA ===');
fprintf('\n========================================\n');

fprintf('\n%-25s %-20s %-20s\n', 'Comparación', 'KS EMG (zoom)', 'KS 5G (zoom)');
fprintf('%-25s %-20.6f %-20.6f\n', 'Herramienta 1 vs 2', ks12_emg, ks12_5g);
fprintf('%-25s %-20.6f %-20.6f\n', 'Herramienta 1 vs 3', ks13_emg, ks13_5g);
fprintf('%-25s %-20.6f %-20.6f\n', 'Herramienta 2 vs 3', ks23_emg, ks23_5g);

fprintf('\n=== ANÁLISIS POR CASO ===\n');
fprintf('\nEMG - Mayor diferencia: ');
if ks12_emg > ks13_emg && ks12_emg > ks23_emg
    fprintf('LTSPICE vs MATLAB (KS = %.6f en %.2f dB)\n', ks12_emg, centers_emg(idx12_emg));
elseif ks13_emg > ks12_emg && ks13_emg > ks23_emg
    fprintf('LTSPICE vs FPAA (KS = %.6f en %.2f dB)\n', ks13_emg, centers_emg(idx13_emg));
else
    fprintf('MATLAB vs FPAA (KS = %.6f en %.2f dB)\n', ks23_emg, centers_emg(idx23_emg));
end

fprintf('5G - Mayor diferencia: ');
if ks12_5g > ks13_5g && ks12_5g > ks23_5g
    fprintf('ADS vs MATLAB (KS = %.6f en %.2f dB)\n', ks12_5g, centers_5g(idx12_5g));
elseif ks13_5g > ks12_5g && ks13_5g > ks23_5g
    fprintf('ADS vs MS4644B (KS = %.6f en %.2f dB)\n', ks13_5g, centers_5g(idx13_5g));
else
    fprintf('MATLAB vs MS4644B (KS = %.6f en %.2f dB)\n', ks23_5g, centers_5g(idx23_5g));
end

fprintf('\n=== COMPARACIÓN ENTRE CASOS ===\n');
fprintf('KS promedio EMG: %.6f\n', (ks12_emg + ks13_emg + ks23_emg)/3);
fprintf('KS promedio 5G: %.6f\n', (ks12_5g + ks13_5g + ks23_5g)/3);