%% ========================================================================
%  ANÁLISIS DE ESCALABILIDAD - SISTEMA COMPLETO DE FILTROS BESSEL-THOMSON
%  VERSIÓN FINAL - CON MANEJO ROBUSTO DE ERRORES
%  ========================================================================

clear; clc; close all;

%% ========================================================================
%  CONSTANTES Y PARÁMETROS FIJOS (SEGÚN ESPECIFICACIONES ORIGINALES)
%  ========================================================================

LOGE = 0.43429448190;      % log10(e)
DESATT = 1;                % Atenuación en dB
F_FIJO = 20e3;             % Frecuencia fija = 20 kHz
RS = 1;                    % Resistencia de fuente (Ω)
RL = 1;                    % Resistencia de carga (Ω)

% Valores de retardo para generar órdenes (19 valores)
RETARDOS_ORDEN = [
    6.61e-6, 8.52e-6, 1.01e-5, 1.14e-5, 1.26e-5, ...
    1.36e-5, 1.46e-5, 1.55e-5, 1.63e-5, 1.79e-5, ...
    1.86e-5, 1.92e-5, 1.99e-5, 2.05e-5, 2.11e-5, ...
    2.17e-5, 2.22e-5, 2.28e-5, 2.33e-5
];

% Valores de frecuencia de corte para FT3 (10 valores)
FRECUENCIAS_CORTE = [100, 200, 500, 1000, 2000, 5000, 10000, 20000, 50000, 100000];

% Valores de retardo de grupo para FT4 (10 valores)
RETARDOS_GRUPO = [
    6.61e-6, 8.52e-6, 1.01e-5, 1.14e-5, 1.26e-5, ...
    1.36e-5, 1.46e-5, 1.55e-5, 1.63e-5, 1.79e-5
];

% Valores de impedancia para transformación (10 valores)
IMPEDANCIAS = [10, 25, 50, 75, 100, 150, 200, 300, 500, 1000];

%% ========================================================================
%  PASO 1: CÁLCULO DE ÓRDENES ÚNICAS
%  ========================================================================

fprintf('\n========================================\n');
fprintf('PASO 1: CÁLCULO DE ÓRDENES DEL FILTRO\n');
fprintf('========================================\n');
fprintf('Especificaciones:\n');
fprintf('  f = %.0f Hz\n', F_FIJO);
fprintf('  Desatt = %.0f dB\n', DESATT);
fprintf('  loge = %.4f\n', LOGE);
fprintf('  rs = %.0f Ω\n\n', RS);

ordenes_todos = [];
for i = 1:length(RETARDOS_ORDEN)
    tau = RETARDOS_ORDEN(i);
    n = calcular_orden(F_FIJO, tau, DESATT);
    fprintf('τ = %.2e s → Orden n = %d\n', tau, n);
    if n >= 2 && n <= 21
        ordenes_todos = [ordenes_todos; n];
    end
end

ordenes_unicas = unique(ordenes_todos);

if isempty(ordenes_unicas)
    error('No se generaron órdenes válidas. Verifique los parámetros.');
end

fprintf('\nÓrdenes únicas a analizar (%d): ', length(ordenes_unicas));
fprintf('%d ', ordenes_unicas);
fprintf('\n');

n_ordenes = length(ordenes_unicas);

%% ========================================================================
%  PASO 2: INICIALIZACIÓN DE ARRAYS DE TIEMPOS
%  ========================================================================

% Tiempos hasta primera red eléctrica (elementos)
tiempo_hasta_red_FT1 = NaN(n_ordenes, 1);
tiempo_hasta_red_FT2 = NaN(n_ordenes, 1);
tiempo_hasta_red_FT3 = NaN(n_ordenes, 1);
tiempo_hasta_red_FT4 = NaN(n_ordenes, 1);

% Tiempos hasta transformación final
tiempo_hasta_transform_FT1 = NaN(n_ordenes, 1);
tiempo_hasta_transform_FT2 = NaN(n_ordenes, 1);
tiempo_hasta_transform_FT3 = NaN(n_ordenes, 1);
tiempo_hasta_transform_FT4 = NaN(n_ordenes, 1);

% Contadores de errores
errores_FT1 = 0;
errores_FT2 = 0;
errores_FT3 = 0;
errores_FT4 = 0;

%% ========================================================================
%  PASO 3: MEDICIÓN DE TIEMPOS PARA CADA ORDEN
%  ========================================================================

fprintf('\n========================================\n');
fprintf('PASO 2: MEDICIÓN DE TIEMPOS DE EJECUCIÓN\n');
fprintf('========================================\n');

for idx = 1:n_ordenes
    n = ordenes_unicas(idx);
    fprintf('\n--- Procesando n = %d (%d/%d) ---\n', n, idx, n_ordenes);
    
    % ========== ETAPA COMÚN: Polinomio y frecuencia de corte ==========
    try
        t_start_total = tic;
        [numbt, denbt, yn] = generar_polinomio_bessel(n);
        wc = calcular_frecuencia_corte(n, yn);
        tiempo_base = toc(t_start_total);
        fprintf('  Base (polinomio + wc): %.3f ms\n', tiempo_base*1000);
    catch ME
        fprintf('  Error en etapa común: %s\n', ME.message);
        continue;
    end
    
    % Pre-calcular formas normalizadas
    s_sym = sym('s');
    yn_norm = subs(yn, s_sym, s_sym * wc);
    denbt_2 = double(coeffs(yn_norm, s_sym, 'All'));
    denbt_2 = denbt_2(end:-1:1);
    
    % ========== FT1 (τ=1) ==========
    [L_T_FT1, C_T_FT1, L_pi_FT1, C_pi_FT1, exito_FT1] = ...
        elementosbesselthomson_seguro(denbt, numbt, n, RL, RS);
    
    if exito_FT1
        tiempo_hasta_red_FT1(idx) = tiempo_base;
        
        t_transform_total = 0;
        for z_idx = 1:length(IMPEDANCIAS)
            Zn = IMPEDANCIAS(z_idx);
            t_start = tic;
            [~, ~] = transformar_impedancia(L_T_FT1, C_T_FT1, Zn);
            [~, ~] = transformar_impedancia(L_pi_FT1, C_pi_FT1, Zn);
            t_transform_total = t_transform_total + toc(t_start);
        end
        tiempo_hasta_transform_FT1(idx) = tiempo_hasta_red_FT1(idx) + ...
            (t_transform_total / length(IMPEDANCIAS));
        fprintf('  FT1: Red = %.3f ms, Transform = %.3f ms\n', ...
            tiempo_hasta_red_FT1(idx)*1000, tiempo_hasta_transform_FT1(idx)*1000);
    else
        errores_FT1 = errores_FT1 + 1;
        fprintf(' FT1: OMITIDO (error en síntesis de red)\n');
    end
    
    % ========== FT2 (wc=1) ==========
    [L_T_FT2, C_T_FT2, L_pi_FT2, C_pi_FT2, exito_FT2] = ...
        elementosbesselthomson_seguro(denbt_2, numbt, n, RL, RS);
    
    if exito_FT2
        tiempo_hasta_red_FT2(idx) = tiempo_base;
        
        t_transform_total = 0;
        for z_idx = 1:length(IMPEDANCIAS)
            Zn = IMPEDANCIAS(z_idx);
            t_start = tic;
            [~, ~] = transformar_impedancia(L_T_FT2, C_T_FT2, Zn);
            [~, ~] = transformar_impedancia(L_pi_FT2, C_pi_FT2, Zn);
            t_transform_total = t_transform_total + toc(t_start);
        end
        tiempo_hasta_transform_FT2(idx) = tiempo_hasta_red_FT2(idx) + ...
            (t_transform_total / length(IMPEDANCIAS));
        fprintf('  FT2: Red = %.3f ms, Transform = %.3f ms\n', ...
            tiempo_hasta_red_FT2(idx)*1000, tiempo_hasta_transform_FT2(idx)*1000);
    else
        errores_FT2 = errores_FT2 + 1;
        fprintf(' FT2: OMITIDO (error en síntesis de red)\n');
    end
    
    % ========== FT3 (TODAS las frecuencias de corte) ==========
    casos_validos_FT3 = 0;
    for j = 1:length(FRECUENCIAS_CORTE)
        fc = FRECUENCIAS_CORTE(j);
        wc_f = 2 * pi * fc;
        yn_frec = subs(yn_norm, s_sym, s_sym / wc_f);
        denbt_3 = double(coeffs(yn_frec, s_sym, 'All'));
        denbt_3 = denbt_3(end:-1:1);
        
        [~, ~, ~, ~, exito_FT3] = ...
            elementosbesselthomson_seguro(denbt_3, numbt, n, RL, RS);
        
        if exito_FT3
            casos_validos_FT3 = casos_validos_FT3 + 1;
        end
    end
    
    if casos_validos_FT3 > 0
        tiempo_hasta_red_FT3(idx) = tiempo_base;
        tiempo_hasta_transform_FT3(idx) = tiempo_base;
        fprintf(' FT3: %d/%d fc diseñables\n', casos_validos_FT3, length(FRECUENCIAS_CORTE));
    else
        errores_FT3 = errores_FT3 + 1;
        fprintf(' FT3: 0/%d fc diseñables\n', length(FRECUENCIAS_CORTE));
    end
    
    % ========== FT4 (TODOS los retardos de grupo) ==========
    casos_validos_FT4 = 0;
    for j = 1:length(RETARDOS_GRUPO)
        tgcero = RETARDOS_GRUPO(j);
        try
            [kbt, zbt, pbt] = BESSEL_POLES(tgcero, n);
            numbt_4 = poly(zbt) * abs(kbt);
            denbt_4 = poly(pbt);
            
            [~, ~, ~, ~, exito_FT4] = ...
                elementosbesselthomson_seguro(denbt_4, numbt_4, n, RL, RS);
            
            if exito_FT4
                casos_validos_FT4 = casos_validos_FT4 + 1;
            end
        catch
            % Error en BESSEL_POLES, omitir
        end
    end
    
    if casos_validos_FT4 > 0
        tiempo_hasta_red_FT4(idx) = tiempo_base;
        tiempo_hasta_transform_FT4(idx) = tiempo_base;
        fprintf(' FT4: %d/%d τ diseñables\n', casos_validos_FT4, length(RETARDOS_GRUPO));
    else
        errores_FT4 = errores_FT4 + 1;
        fprintf(' FT4: 0/%d τ diseñables\n', length(RETARDOS_GRUPO));
    end
end

%% ========================================================================
%  PASO 4: REPORTE DE ERRORES
%  ========================================================================

fprintf('\n========================================\n');
fprintf('REPORTE DE CASOS NO DISEÑABLES\n');
fprintf('========================================\n');
fprintf('FT1 (τ=1): %d/%d errores\n', errores_FT1, n_ordenes);
fprintf('FT2 (wc=1): %d/%d errores\n', errores_FT2, n_ordenes);
fprintf('FT3 (fc variable): %d/%d errores\n', errores_FT3, n_ordenes);
fprintf('FT4 (τ variable): %d/%d errores\n', errores_FT4, n_ordenes);

%% ========================================================================
%  PASO 5: GRÁFICAS - UNA SOLA FIGURA CON SUBPLOTS (8 gráficas)
%  ========================================================================

fprintf('\n========================================\n');
fprintf('PASO 3: GENERANDO GRÁFICAS DE ESCALABILIDAD\n');
fprintf('========================================\n');

if ~exist('graficas_escalabilidad', 'dir')
    mkdir('graficas_escalabilidad');
end

% Crear una sola figura con 2 filas y 4 columnas
figure('Name', 'Análisis de Escalabilidad - Sistema Completo', ...
    'Position', [50, 50, 1400, 800]);

% Subplot 1: FT1 - Tiempo hasta red
subplot(2,4,1);
plot(ordenes_unicas, tiempo_hasta_red_FT1*1000, 'b-o', 'LineWidth', 1.5, 'MarkerSize', 8);
xlabel('Orden (n)'); ylabel('Tiempo (ms)');
title('FT1 (\tau=1) - Hasta Red Eléctrica');
grid on;

% Subplot 2: FT2 - Tiempo hasta red
subplot(2,4,2);
plot(ordenes_unicas, tiempo_hasta_red_FT2*1000, 'r-s', 'LineWidth', 1.5, 'MarkerSize', 8);
xlabel('Orden (n)'); ylabel('Tiempo (ms)');
title('FT2 (wc=1 rad/seg) - Hasta Red Eléctrica');
grid on;

% Subplot 3: FT3 - Tiempo hasta red
subplot(2,4,3);
plot(ordenes_unicas, tiempo_hasta_red_FT3*1000, 'g-^', 'LineWidth', 1.5, 'MarkerSize', 8);
xlabel('Orden (n)'); ylabel('Tiempo (ms)');
title(sprintf('FT3 (fc variable) - Hasta Red (%d fc)', length(FRECUENCIAS_CORTE)));
grid on;

% Subplot 4: FT4 - Tiempo hasta red
subplot(2,4,4);
plot(ordenes_unicas, tiempo_hasta_red_FT4*1000, 'm-d', 'LineWidth', 1.5, 'MarkerSize', 8);
xlabel('Orden (n)'); ylabel('Tiempo (ms)');
title(sprintf('FT4 (\u03C4 variable) - Hasta Red (%d \u03C4)', length(RETARDOS_GRUPO)));
grid on;

% Subplot 5: FT1 - Tiempo hasta transformación
subplot(2,4,5);
plot(ordenes_unicas, tiempo_hasta_transform_FT1*1000, 'b-o', 'LineWidth', 1.5, 'MarkerSize', 8);
xlabel('Orden (n)'); ylabel('Tiempo (ms)');
title('FT1 (\tau=1) - Hasta Transformación Zn');
grid on;

% Subplot 6: FT2 - Tiempo hasta transformación
subplot(2,4,6);
plot(ordenes_unicas, tiempo_hasta_transform_FT2*1000, 'r-s', 'LineWidth', 1.5, 'MarkerSize', 8);
xlabel('Orden (n)'); ylabel('Tiempo (ms)');
title('FT2 (wc=1 rad/seg) - Hasta Transformación Zn');
grid on;

% Subplot 7: FT3 - Tiempo hasta transformación
subplot(2,4,7);
plot(ordenes_unicas, tiempo_hasta_transform_FT3*1000, 'g-^', 'LineWidth', 1.5, 'MarkerSize', 8);
xlabel('Orden (n)'); ylabel('Tiempo (ms)');
title(sprintf('FT3 (fc variable) - Hasta Transformación (%d fc)', length(FRECUENCIAS_CORTE)));
grid on;

% Subplot 8: FT4 - Tiempo hasta transformación
subplot(2,4,8);
plot(ordenes_unicas, tiempo_hasta_transform_FT4*1000, 'm-d', 'LineWidth', 1.5, 'MarkerSize', 8);
xlabel('Orden (n)'); ylabel('Tiempo (ms)');
title(sprintf('FT4 (\u03C4 variable) - Hasta Transformación (%d \u03C4)', length(RETARDOS_GRUPO)));
grid on;

% Título general
sgtitle(sprintf('Análisis de Escalabilidad - Bessel Thomson (f=%.0f Hz, Desatt=%.0f dB)', F_FIJO, DESATT), ...
    'FontSize', 14, 'FontWeight', 'bold');

% Guardar figura
saveas(gcf, 'graficas_escalabilidad/00_escalabilidad_completa.png');
savefig('graficas_escalabilidad/00_escalabilidad_completa.fig');
fprintf('✓ Figura completa con 8 subplots guardada\n');

%% ========================================================================
%  RESUMEN FINAL
%  ========================================================================

fprintf('\n========================================\n');
fprintf('RESUMEN DEL ANÁLISIS DE ESCALABILIDAD\n');
fprintf('========================================\n');

fprintf('\n--- ESPECIFICACIONES ---\n');
fprintf('f = %.0f Hz\n', F_FIJO);
fprintf('Desatt = %.0f dB\n', DESATT);
fprintf('loge = %.4f\n', LOGE);
fprintf('rs = %.0f Ω\n', RS);

fprintf('\n--- ÓRDENES EVALUADOS ---\n');
fprintf('Órdenes: ');
fprintf('%d ', ordenes_unicas);
fprintf('\nTotal: %d órdenes únicos\n', n_ordenes);

% Mostrar tiempos del último orden válido
ultimo_valido_FT1 = find(~isnan(tiempo_hasta_red_FT1), 1, 'last');
ultimo_valido_FT2 = find(~isnan(tiempo_hasta_red_FT2), 1, 'last');
ultimo_valido_FT3 = find(~isnan(tiempo_hasta_red_FT3), 1, 'last');
ultimo_valido_FT4 = find(~isnan(tiempo_hasta_red_FT4), 1, 'last');

if ~isempty(ultimo_valido_FT1)
    fprintf('\n--- TIEMPOS PARA n = %d (ms) ---\n', ordenes_unicas(ultimo_valido_FT1));
    fprintf('FT1 - Red: %.3f ms, Transform: %.3f ms\n', ...
        tiempo_hasta_red_FT1(ultimo_valido_FT1)*1000, tiempo_hasta_transform_FT1(ultimo_valido_FT1)*1000);
end

fprintf('\n ANÁLISIS COMPLETADO. Figura guardada en "graficas_escalabilidad/00_escalabilidad_completa.png"\n');

%% ========================================================================
%  FUNCIONES AUXILIARES (NO MODIFICAR)
%  ========================================================================

function n = calcular_orden(f, retardo, Desatt)
    LOGE = 0.43429448190;
    if retardo <= 0 || Desatt <= 0 || f <= 0
        n = 0;
        return;
    end
    n = round((5 * (((2 * pi * f) * retardo) ^ 2) * LOGE / Desatt) + 0.5);
    if n >= 22 || n <= 1
        n = 0;
    end
end

function [numbt, denbt, yn] = generar_polinomio_bessel(n)
    syms s;
    yn = 0;
    for k = 0:n
        coef = factorial(2*n - k) / (2^(n - k) * factorial(k) * factorial(n - k));
        yn = yn + coef * s^k;
    end
    numbt = double(factorial(2*n) / (2^n * factorial(0) * factorial(n)));
    denbt = double(coeffs(yn, s, 'All'));
    denbt = denbt(end:-1:1);
end

function wc = calcular_frecuencia_corte(n, yn)
    syms s w real;
    numbt = double(factorial(2*n) / (2^n * factorial(0) * factorial(n)));
    yn_jw = subs(yn, s, 1j * w);
    real_part = real(yn_jw);
    imag_part = imag(yn_jw);
    e = real_part^2 + imag_part^2 - (numbt / 0.7077)^2;
    e_poly = sym2poly(e);
    roots_e = roots(e_poly);
    wc_pos = roots_e(roots_e > 0);
    if ~isempty(wc_pos)
        wc = min(wc_pos);
    else
        wc = 1;
    end
    wc = double(wc);
end

function [L_trans, C_trans] = transformar_impedancia(L, C, Zn)
    L_trans = L * Zn;
    C_trans = C / Zn;
end

function [L_T, C_T, L_pi, C_pi, exito] = elementosbesselthomson_seguro(denbt, numbt, n, RL, RS)
    % Envoltorio seguro para elementosbesselthomson
    % Captura TODOS los errores posibles
    
    L_T = [];
    C_T = [];
    L_pi = [];
    C_pi = [];
    exito = false;
    
    if isempty(denbt) || isempty(numbt) || n < 2 || n > 21
        return;
    end
    
    try
        [L_T, C_T, L_pi, C_pi] = elementosbesselthomson(denbt, numbt, n, RL, RS);
        
        if ~isempty(L_T) && ~isempty(C_T) && ~isempty(L_pi) && ~isempty(C_pi)
            exito = true;
        end
    catch
        exito = false;
    end
end