%% ========================================================================
%  MEDICIÓN DE RUNTIME TOTAL - SISTEMA COMPLETO DE FILTROS BESSEL-THOMSON
%  ========================================================================
%  OBJETIVO: Medir el tiempo total de ejecución para cada orden del filtro,
%  incluyendo todas las etapas del proceso, con desglose por función de
%  transferencia (FT1, FT2, FT3, FT4).
%  ========================================================================
%  GRÁFICAS GENERADAS:
%    1. Runtime total por orden
%    2. Desglose de tiempos por etapa (para un orden representativo)
%    3. Comparación de tiempos de generación de FTs
%    4. Comparación de tiempos de síntesis de red por FT
%    5. Tasa de éxito de síntesis por orden
%    6. Tiempos totales por FT vs orden
%  ========================================================================

clear; clc; close all;

%% ========================================================================
%  PARÁMETROS DE PRUEBA
%  ========================================================================

% Especificaciones de diseño (fijas para todas las pruebas)
F_DISENO = 20000;      % 20 kHz
DESATT_DISENO = 1;     % 1 dB
RS = 1;                % Resistencia fuente (Ω)
RL = 1;                % Resistencia carga (Ω)

% Órdenes a probar (TODOS los órdenes posibles)
ordenes_a_probar = 2:1:21;   % 2,3,4,...,21

% Valores de impedancia para transformación (10 valores)
IMPEDANCIAS = [10, 25, 50, 75, 100, 150, 200, 300, 500, 1000];

% Valores de frecuencia de corte para FT3 (10 valores)
FRECUENCIAS_CORTE = [100, 200, 500, 1000, 2000, 5000, 10000, 20000, 50000, 100000];

% Valores de retardo de grupo para FT4 (10 valores)
RETARDOS_GRUPO = [
    6.61e-6, 8.52e-6, 1.01e-5, 1.14e-5, 1.26e-5, ...
    1.36e-5, 1.46e-5, 1.55e-5, 1.63e-5, 1.79e-5
];

% Número de repeticiones para medición precisa
NUM_REPETICIONES = 3;  % Reducido para evitar tiempos largos

%% ========================================================================
%  INICIALIZACIÓN DE ARRAYS CON DESGLOSE COMPLETO POR FT
%  ========================================================================

n_ordenes = length(ordenes_a_probar);

% Tiempos de generación de FTs (ms)
tiempo_gen_FT1 = zeros(n_ordenes, 1);
tiempo_gen_FT2 = zeros(n_ordenes, 1);
tiempo_gen_FT3 = zeros(n_ordenes, 1);
tiempo_gen_FT4 = zeros(n_ordenes, 1);

% Tiempos de síntesis de red (elementos) por FT (ms)
tiempo_elem_FT1 = zeros(n_ordenes, 1);
tiempo_elem_FT2 = zeros(n_ordenes, 1);
tiempo_elem_FT3 = zeros(n_ordenes, 1);
tiempo_elem_FT4 = zeros(n_ordenes, 1);

% Tiempos de transformación de impedancia por FT (ms)
tiempo_trans_FT1 = zeros(n_ordenes, 1);
tiempo_trans_FT2 = zeros(n_ordenes, 1);
tiempo_trans_FT3 = zeros(n_ordenes, 1);
tiempo_trans_FT4 = zeros(n_ordenes, 1);

% Tiempos totales por FT (ms)
tiempo_total_FT1 = zeros(n_ordenes, 1);
tiempo_total_FT2 = zeros(n_ordenes, 1);
tiempo_total_FT3 = zeros(n_ordenes, 1);
tiempo_total_FT4 = zeros(n_ordenes, 1);

% Tiempos de etapas comunes
tiempo_polinomio = zeros(n_ordenes, 1);
tiempo_frec_corte = zeros(n_ordenes, 1);

% Contadores de éxito de síntesis
exitos_FT1 = zeros(n_ordenes, 1);
exitos_FT2 = zeros(n_ordenes, 1);
exitos_FT3 = zeros(n_ordenes, 1);
exitos_FT4 = zeros(n_ordenes, 1);

%% ========================================================================
%  CABECERA DE CONSOLA
%  ========================================================================

fprintf('\n');
fprintf('================================================================================\n');
fprintf('MEDICIÓN DE RUNTIME TOTAL - SISTEMA BESSEL-THOMSON\n');
fprintf('================================================================================\n');
fprintf('Especificaciones: f = %.0f Hz, Desatt = %.0f dB\n', F_DISENO, DESATT_DISENO);
fprintf('Órdenes a probar: %d a %d (TODOS los órdenes posibles)\n', min(ordenes_a_probar), max(ordenes_a_probar));
fprintf('Repeticiones por medición: %d\n', NUM_REPETICIONES);
fprintf('================================================================================\n\n');

fprintf('%-6s | %-10s | %-10s | %-10s | %-10s | %-10s | %-10s | %-10s\n', ...
    'Orden', 'Gen_FT1', 'Gen_FT2', 'Gen_FT3', 'Gen_FT4', 'Elem_FT1', 'Elem_FT2', 'Elem_FT3');
fprintf('--------------------------------------------------------------------------------\n');

%% ========================================================================
%  MEDICIÓN DE RUNTIME POR ORDEN CON DESGLOSE COMPLETO
%  ========================================================================

for idx = 1:n_ordenes
    n = ordenes_a_probar(idx);
    fprintf('%-6d | ', n);
    
    % ========== ETAPA COMÚN: Polinomio y frecuencia de corte ==========
    try
        t_start_total = tic;
        [numbt, denbt, yn] = generar_polinomio_bessel(n);
        tiempo_polinomio(idx) = toc(t_start_total) * 1000;
        
        t_start = tic;
        wc = calcular_frecuencia_corte(n, yn);
        tiempo_frec_corte(idx) = toc(t_start) * 1000;
    catch ME
        fprintf('Error en etapa común: %s\n', ME.message);
        continue;
    end
    
    % Pre-calcular formas normalizadas
    s_sym = sym('s');
    yn_norm = subs(yn, s_sym, s_sym * wc);
    denbt_2 = double(coeffs(yn_norm, s_sym, 'All'));
    denbt_2 = denbt_2(end:-1:1);
    
    % ========== 1. TIEMPO DE GENERACIÓN DE CADA FT ==========
    
    % FT1 (τ=1)
    t_total = 0;
    for rep = 1:NUM_REPETICIONES
        t_start = tic;
        sys_FT1 = tf(numbt, denbt);
        t_total = t_total + toc(t_start);
    end
    tiempo_gen_FT1(idx) = (t_total / NUM_REPETICIONES) * 1000;
    
    % FT2 (wc=1 rad/seg)
    t_total = 0;
    for rep = 1:NUM_REPETICIONES
        t_start = tic;
        sys_FT2 = tf(numbt, denbt_2);
        t_total = t_total + toc(t_start);
    end
    tiempo_gen_FT2(idx) = (t_total / NUM_REPETICIONES) * 1000;
    
    % FT3 (promedio sobre todas las frecuencias de corte)
    t_total = 0;
    for j = 1:length(FRECUENCIAS_CORTE)
        fc = FRECUENCIAS_CORTE(j);
        wc_f = 2 * pi * fc;
        yn_frec = subs(yn_norm, s_sym, s_sym / wc_f);
        denbt_3 = double(coeffs(yn_frec, s_sym, 'All'));
        denbt_3 = denbt_3(end:-1:1);
        
        for rep = 1:NUM_REPETICIONES
            t_start = tic;
            sys_FT3 = tf(numbt, denbt_3);
            t_total = t_total + toc(t_start);
        end
    end
    tiempo_gen_FT3(idx) = (t_total / (NUM_REPETICIONES * length(FRECUENCIAS_CORTE))) * 1000;
    
    % FT4 (promedio sobre todos los retardos de grupo)
    t_total = 0;
    for j = 1:length(RETARDOS_GRUPO)
        tgcero = RETARDOS_GRUPO(j);
        try
            [kbt, zbt, pbt] = BESSEL_POLES(tgcero, n);
            numbt_4 = poly(zbt) * abs(kbt);
            denbt_4 = poly(pbt);
            
            for rep = 1:NUM_REPETICIONES
                t_start = tic;
                sys_FT4 = tf(numbt_4, denbt_4);
                t_total = t_total + toc(t_start);
            end
        catch
            % Si falla BESSEL_POLES, omitir esta iteración
        end
    end
    tiempo_gen_FT4(idx) = (t_total / (NUM_REPETICIONES * length(RETARDOS_GRUPO))) * 1000;
    
    % ========== 2. TIEMPO DE SÍNTESIS DE RED (ELEMENTOS) POR FT ==========
    
    % FT1
    t_total = 0;
    for rep = 1:NUM_REPETICIONES
        t_start = tic;
        [L_T1, C_T1, L_pi1, C_pi1, exito] = ...
            elementosbesselthomson_seguro(denbt, numbt, n, RL, RS);
        t_total = t_total + toc(t_start);
        if exito
            exitos_FT1(idx) = exitos_FT1(idx) + 1;
        end
    end
    tiempo_elem_FT1(idx) = (t_total / NUM_REPETICIONES) * 1000;
    
    % FT2
    t_total = 0;
    for rep = 1:NUM_REPETICIONES
        t_start = tic;
        [L_T2, C_T2, L_pi2, C_pi2, exito] = ...
            elementosbesselthomson_seguro(denbt_2, numbt, n, RL, RS);
        t_total = t_total + toc(t_start);
        if exito
            exitos_FT2(idx) = exitos_FT2(idx) + 1;
        end
    end
    tiempo_elem_FT2(idx) = (t_total / NUM_REPETICIONES) * 1000;
    
    % FT3 (promedio sobre todas las frecuencias de corte)
    t_total = 0;
    for j = 1:length(FRECUENCIAS_CORTE)
        fc = FRECUENCIAS_CORTE(j);
        wc_f = 2 * pi * fc;
        yn_frec = subs(yn_norm, s_sym, s_sym / wc_f);
        denbt_3 = double(coeffs(yn_frec, s_sym, 'All'));
        denbt_3 = denbt_3(end:-1:1);
        
        for rep = 1:NUM_REPETICIONES
            t_start = tic;
            [~, ~, ~, ~, exito] = ...
                elementosbesselthomson_seguro(denbt_3, numbt, n, RL, RS);
            t_total = t_total + toc(t_start);
            if exito
                exitos_FT3(idx) = exitos_FT3(idx) + 1;
            end
        end
    end
    tiempo_elem_FT3(idx) = (t_total / (NUM_REPETICIONES * length(FRECUENCIAS_CORTE))) * 1000;
    
    % FT4 (promedio sobre todos los retardos de grupo)
    t_total = 0;
    for j = 1:length(RETARDOS_GRUPO)
        tgcero = RETARDOS_GRUPO(j);
        try
            [kbt, zbt, pbt] = BESSEL_POLES(tgcero, n);
            numbt_4 = poly(zbt) * abs(kbt);
            denbt_4 = poly(pbt);
            
            for rep = 1:NUM_REPETICIONES
                t_start = tic;
                [~, ~, ~, ~, exito] = ...
                    elementosbesselthomson_seguro(denbt_4, numbt_4, n, RL, RS);
                t_total = t_total + toc(t_start);
                if exito
                    exitos_FT4(idx) = exitos_FT4(idx) + 1;
                end
            end
        catch
            % Omitir si falla
        end
    end
    tiempo_elem_FT4(idx) = (t_total / (NUM_REPETICIONES * length(RETARDOS_GRUPO))) * 1000;
    
    % ========== 3. TIEMPO DE TRANSFORMACIÓN DE IMPEDANCIA POR FT ==========
    
    % FT1 (usar los elementos obtenidos en la última iteración exitosa)
    [L_T1, C_T1, L_pi1, C_pi1, exito1] = ...
        elementosbesselthomson_seguro(denbt, numbt, n, RL, RS);
    
    if exito1
        t_start = tic;
        for z_idx = 1:length(IMPEDANCIAS)
            Zn = IMPEDANCIAS(z_idx);
            [~, ~] = transformar_impedancia(L_T1, C_T1, Zn);
            [~, ~] = transformar_impedancia(L_pi1, C_pi1, Zn);
        end
        tiempo_trans_FT1(idx) = toc(t_start) * 1000;
    end
    
    % FT2
    [L_T2, C_T2, L_pi2, C_pi2, exito2] = ...
        elementosbesselthomson_seguro(denbt_2, numbt, n, RL, RS);
    
    if exito2
        t_start = tic;
        for z_idx = 1:length(IMPEDANCIAS)
            Zn = IMPEDANCIAS(z_idx);
            [~, ~] = transformar_impedancia(L_T2, C_T2, Zn);
            [~, ~] = transformar_impedancia(L_pi2, C_pi2, Zn);
        end
        tiempo_trans_FT2(idx) = toc(t_start) * 1000;
    end
    
    % FT3 (usar el primer valor de fc como referencia)
    fc_ref = FRECUENCIAS_CORTE(1);
    wc_f = 2 * pi * fc_ref;
    yn_frec = subs(yn_norm, s_sym, s_sym / wc_f);
    denbt_3 = double(coeffs(yn_frec, s_sym, 'All'));
    denbt_3 = denbt_3(end:-1:1);
    
    [L_T3, C_T3, L_pi3, C_pi3, exito3] = ...
        elementosbesselthomson_seguro(denbt_3, numbt, n, RL, RS);
    
    if exito3
        t_start = tic;
        for z_idx = 1:length(IMPEDANCIAS)
            Zn = IMPEDANCIAS(z_idx);
            [~, ~] = transformar_impedancia(L_T3, C_T3, Zn);
            [~, ~] = transformar_impedancia(L_pi3, C_pi3, Zn);
        end
        tiempo_trans_FT3(idx) = toc(t_start) * 1000;
    end
    
    % FT4 (usar el primer valor de τ como referencia)
    tgcero_ref = RETARDOS_GRUPO(1);
    try
        [kbt, zbt, pbt] = BESSEL_POLES(tgcero_ref, n);
        numbt_4 = poly(zbt) * abs(kbt);
        denbt_4 = poly(pbt);
        
        [L_T4, C_T4, L_pi4, C_pi4, exito4] = ...
            elementosbesselthomson_seguro(denbt_4, numbt_4, n, RL, RS);
        
        if exito4
            t_start = tic;
            for z_idx = 1:length(IMPEDANCIAS)
                Zn = IMPEDANCIAS(z_idx);
                [~, ~] = transformar_impedancia(L_T4, C_T4, Zn);
                [~, ~] = transformar_impedancia(L_pi4, C_pi4, Zn);
            end
            tiempo_trans_FT4(idx) = toc(t_start) * 1000;
        end
    catch
        % Omitir si falla
    end
    
    % ========== 4. TIEMPOS TOTALES POR FT ==========
    tiempo_total_FT1(idx) = tiempo_gen_FT1(idx) + tiempo_elem_FT1(idx) + tiempo_trans_FT1(idx);
    tiempo_total_FT2(idx) = tiempo_gen_FT2(idx) + tiempo_elem_FT2(idx) + tiempo_trans_FT2(idx);
    tiempo_total_FT3(idx) = tiempo_gen_FT3(idx) + tiempo_elem_FT3(idx) + tiempo_trans_FT3(idx);
    tiempo_total_FT4(idx) = tiempo_gen_FT4(idx) + tiempo_elem_FT4(idx) + tiempo_trans_FT4(idx);
    
    % Mostrar resultados en consola
    fprintf('%-10.3f | %-10.3f | %-10.3f | %-10.3f | %-10.3f | %-10.3f | %-10.3f\n', ...
        tiempo_gen_FT1(idx), tiempo_gen_FT2(idx), tiempo_gen_FT3(idx), tiempo_gen_FT4(idx), ...
        tiempo_elem_FT1(idx), tiempo_elem_FT2(idx), tiempo_elem_FT3(idx));
end

%% ========================================================================
%  CREAR CARPETA PARA GRÁFICAS
%  ========================================================================

if ~exist('graficas_runtime', 'dir')
    mkdir('graficas_runtime');
end

%% ========================================================================
%  GRÁFICA 1: RUNTIME TOTAL POR ORDEN (TODAS LAS FTs)
%  ========================================================================

figure('Name', 'Runtime Total por Orden', 'Position', [100, 100, 800, 600]);
hold on;
plot(ordenes_a_probar, tiempo_total_FT1, 'b-o', 'LineWidth', 1.5, 'MarkerSize', 6, 'DisplayName', 'FT1 (τ=1)');
plot(ordenes_a_probar, tiempo_total_FT2, 'r-s', 'LineWidth', 1.5, 'MarkerSize', 6, 'DisplayName', 'FT2 (wc=1)');
plot(ordenes_a_probar, tiempo_total_FT3, 'g-^', 'LineWidth', 1.5, 'MarkerSize', 6, 'DisplayName', 'FT3 (fc variable)');
plot(ordenes_a_probar, tiempo_total_FT4, 'm-d', 'LineWidth', 1.5, 'MarkerSize', 6, 'DisplayName', 'FT4 (τ variable)');
xlabel('Orden del filtro (n)');
ylabel('Tiempo total (ms)');
title('Runtime Total por Función de Transferencia');
legend('Location', 'northwest');
grid on;
saveas(gcf, 'graficas_runtime/01_runtime_total_por_FT.png');
fprintf('✓ Gráfica 1 guardada: runtime_total_por_FT.png\n');

%% ========================================================================
%  GRÁFICA 2: COMPARACIÓN DE TIEMPOS DE GENERACIÓN DE FTs
%  ========================================================================

figure('Name', 'Tiempos de Generación de FTs', 'Position', [100, 100, 800, 600]);
hold on;
plot(ordenes_a_probar, tiempo_gen_FT1, 'b-o', 'LineWidth', 1.5, 'MarkerSize', 6, 'DisplayName', 'FT1 (τ=1)');
plot(ordenes_a_probar, tiempo_gen_FT2, 'r-s', 'LineWidth', 1.5, 'MarkerSize', 6, 'DisplayName', 'FT2 (wc=1)');
plot(ordenes_a_probar, tiempo_gen_FT3, 'g-^', 'LineWidth', 1.5, 'MarkerSize', 6, 'DisplayName', 'FT3 (fc variable)');
plot(ordenes_a_probar, tiempo_gen_FT4, 'm-d', 'LineWidth', 1.5, 'MarkerSize', 6, 'DisplayName', 'FT4 (τ variable)');
xlabel('Orden del filtro (n)');
ylabel('Tiempo de generación (ms)');
title('Comparación de Tiempos de Generación de Funciones de Transferencia');
legend('Location', 'northwest');
grid on;
saveas(gcf, 'graficas_runtime/02_comparacion_generacion_FTs.png');
fprintf('✓ Gráfica 2 guardada: comparacion_generacion_FTs.png\n');

%% ========================================================================
%  GRÁFICA 3: COMPARACIÓN DE TIEMPOS DE SÍNTESIS DE RED
%  ========================================================================

figure('Name', 'Tiempos de Síntesis de Red', 'Position', [100, 100, 800, 600]);
hold on;
plot(ordenes_a_probar, tiempo_elem_FT1, 'b-o', 'LineWidth', 1.5, 'MarkerSize', 6, 'DisplayName', 'FT1 (τ=1)');
plot(ordenes_a_probar, tiempo_elem_FT2, 'r-s', 'LineWidth', 1.5, 'MarkerSize', 6, 'DisplayName', 'FT2 (wc=1)');
plot(ordenes_a_probar, tiempo_elem_FT3, 'g-^', 'LineWidth', 1.5, 'MarkerSize', 6, 'DisplayName', 'FT3 (fc variable)');
plot(ordenes_a_probar, tiempo_elem_FT4, 'm-d', 'LineWidth', 1.5, 'MarkerSize', 6, 'DisplayName', 'FT4 (τ variable)');
xlabel('Orden del filtro (n)');
ylabel('Tiempo de síntesis (ms)');
title('Comparación de Tiempos de Síntesis de Red por FT');
legend('Location', 'northwest');
grid on;
saveas(gcf, 'graficas_runtime/03_comparacion_sintesis_FTs.png');
fprintf('✓ Gráfica 3 guardada: comparacion_sintesis_FTs.png\n');

%% ========================================================================
%  GRÁFICA 4: TASA DE ÉXITO DE SÍNTESIS POR ORDEN
%  ========================================================================

exito_FT1_pct = (exitos_FT1 / NUM_REPETICIONES) * 100;
exito_FT2_pct = (exitos_FT2 / NUM_REPETICIONES) * 100;
exito_FT3_pct = (exitos_FT3 / (NUM_REPETICIONES * length(FRECUENCIAS_CORTE))) * 100;
exito_FT4_pct = (exitos_FT4 / (NUM_REPETICIONES * length(RETARDOS_GRUPO))) * 100;

figure('Name', 'Tasa de Éxito de Síntesis', 'Position', [100, 100, 800, 600]);
hold on;
plot(ordenes_a_probar, exito_FT1_pct, 'b-o', 'LineWidth', 1.5, 'MarkerSize', 6, 'DisplayName', 'FT1 (τ=1)');
plot(ordenes_a_probar, exito_FT2_pct, 'r-s', 'LineWidth', 1.5, 'MarkerSize', 6, 'DisplayName', 'FT2 (wc=1)');
plot(ordenes_a_probar, exito_FT3_pct, 'g-^', 'LineWidth', 1.5, 'MarkerSize', 6, 'DisplayName', 'FT3 (fc variable)');
plot(ordenes_a_probar, exito_FT4_pct, 'm-d', 'LineWidth', 1.5, 'MarkerSize', 6, 'DisplayName', 'FT4 (τ variable)');
xlabel('Orden del filtro (n)');
ylabel('Tasa de éxito (%)');
title('Tasa de Éxito de Síntesis de Red por Orden y FT');
ylim([0 105]);
legend('Location', 'best');
grid on;
saveas(gcf, 'graficas_runtime/04_tasa_exito_sintesis.png');
fprintf('✓ Gráfica 4 guardada: tasa_exito_sintesis.png\n');

%% ========================================================================
%  GRÁFICA 5: DESGLOSE DE TIEMPOS PARA UN ORDEN REPRESENTATIVO
%  ========================================================================

n_rep = 10; % Orden representativo
idx_rep = find(ordenes_a_probar == n_rep);

if ~isempty(idx_rep)
    figure('Name', 'Desglose de Tiempos', 'Position', [100, 100, 1000, 600]);
    
    etapas = {'Polinomio', 'Fcorte', 'Gen FT', 'Síntesis', 'Transform'};
    tiempos_FT1 = [tiempo_polinomio(idx_rep), tiempo_frec_corte(idx_rep), ...
                   tiempo_gen_FT1(idx_rep), tiempo_elem_FT1(idx_rep), tiempo_trans_FT1(idx_rep)];
    tiempos_FT2 = [tiempo_polinomio(idx_rep), tiempo_frec_corte(idx_rep), ...
                   tiempo_gen_FT2(idx_rep), tiempo_elem_FT2(idx_rep), tiempo_trans_FT2(idx_rep)];
    tiempos_FT3 = [tiempo_polinomio(idx_rep), tiempo_frec_corte(idx_rep), ...
                   tiempo_gen_FT3(idx_rep), tiempo_elem_FT3(idx_rep), tiempo_trans_FT3(idx_rep)];
    tiempos_FT4 = [tiempo_polinomio(idx_rep), tiempo_frec_corte(idx_rep), ...
                   tiempo_gen_FT4(idx_rep), tiempo_elem_FT4(idx_rep), tiempo_trans_FT4(idx_rep)];
    
    bar([tiempos_FT1; tiempos_FT2; tiempos_FT3; tiempos_FT4]');
    set(gca, 'XTickLabel', etapas);
    xlabel('Etapa del proceso');
    ylabel('Tiempo (ms)');
    title(sprintf('Desglose de Tiempos para n = %d', n_rep));
    legend('FT1 (τ=1)', 'FT2 (wc=1)', 'FT3 (fc var)', 'FT4 (τ var)', 'Location', 'northwest');
    grid on;
    saveas(gcf, 'graficas_runtime/05_desglose_tiempos.png');
    fprintf('✓ Gráfica 5 guardada: desglose_tiempos.png\n');
end

%% ========================================================================
%  GRÁFICA 6: TIEMPOS DE TRANSFORMACIÓN DE IMPEDANCIA
%  ========================================================================

figure('Name', 'Tiempos de Transformación', 'Position', [100, 100, 800, 600]);
hold on;
plot(ordenes_a_probar, tiempo_trans_FT1, 'b-o', 'LineWidth', 1.5, 'MarkerSize', 6, 'DisplayName', 'FT1 (τ=1)');
plot(ordenes_a_probar, tiempo_trans_FT2, 'r-s', 'LineWidth', 1.5, 'MarkerSize', 6, 'DisplayName', 'FT2 (wc=1)');
plot(ordenes_a_probar, tiempo_trans_FT3, 'g-^', 'LineWidth', 1.5, 'MarkerSize', 6, 'DisplayName', 'FT3 (fc variable)');
plot(ordenes_a_probar, tiempo_trans_FT4, 'm-d', 'LineWidth', 1.5, 'MarkerSize', 6, 'DisplayName', 'FT4 (τ variable)');
xlabel('Orden del filtro (n)');
ylabel('Tiempo de transformación (ms)');
title('Tiempos de Transformación de Impedancia por FT');
legend('Location', 'northwest');
grid on;
saveas(gcf, 'graficas_runtime/06_tiempos_transformacion.png');
fprintf('✓ Gráfica 6 guardada: tiempos_transformacion.png\n');

%% ========================================================================
%  TABLA DE RESULTADOS COMPLETA
%  ========================================================================

resultados_table = table();
resultados_table.Orden = ordenes_a_probar';

% Tiempos de generación
resultados_table.Gen_FT1_ms = tiempo_gen_FT1;
resultados_table.Gen_FT2_ms = tiempo_gen_FT2;
resultados_table.Gen_FT3_ms = tiempo_gen_FT3;
resultados_table.Gen_FT4_ms = tiempo_gen_FT4;

% Tiempos de síntesis
resultados_table.Elem_FT1_ms = tiempo_elem_FT1;
resultados_table.Elem_FT2_ms = tiempo_elem_FT2;
resultados_table.Elem_FT3_ms = tiempo_elem_FT3;
resultados_table.Elem_FT4_ms = tiempo_elem_FT4;

% Tiempos de transformación
resultados_table.Trans_FT1_ms = tiempo_trans_FT1;
resultados_table.Trans_FT2_ms = tiempo_trans_FT2;
resultados_table.Trans_FT3_ms = tiempo_trans_FT3;
resultados_table.Trans_FT4_ms = tiempo_trans_FT4;

% Tiempos totales
resultados_table.Total_FT1_ms = tiempo_total_FT1;
resultados_table.Total_FT2_ms = tiempo_total_FT2;
resultados_table.Total_FT3_ms = tiempo_total_FT3;
resultados_table.Total_FT4_ms = tiempo_total_FT4;

% Tasa de éxito
resultados_table.Exito_FT1_pct = exito_FT1_pct;
resultados_table.Exito_FT2_pct = exito_FT2_pct;
resultados_table.Exito_FT3_pct = exito_FT3_pct;
resultados_table.Exito_FT4_pct = exito_FT4_pct;

% Guardar tabla
writetable(resultados_table, 'graficas_runtime/resultados_runtime_completo.csv');
fprintf('✓ Tabla de resultados guardada: resultados_runtime_completo.csv\n');

% Mostrar tabla en consola
disp(resultados_table);

%% ========================================================================
%  RESUMEN FINAL
%  ========================================================================

fprintf('\n========================================\n');
fprintf('RESUMEN DE RUNTIME TOTAL\n');
fprintf('========================================\n');

% Tiempos máximos y mínimos
[tiempo_max, idx_max] = max(tiempo_total_FT1);
[tiempo_min, idx_min] = min(tiempo_total_FT1);

fprintf('\n--- FT1 (τ=1) ---\n');
fprintf('Tiempo mínimo: %.3f ms (n = %d)\n', tiempo_min, ordenes_a_probar(idx_min));
fprintf('Tiempo máximo: %.3f ms (n = %d)\n', tiempo_max, ordenes_a_probar(idx_max));
fprintf('Tiempo promedio: %.3f ms\n', mean(tiempo_total_FT1));

[tiempo_max, idx_max] = max(tiempo_total_FT2);
[tiempo_min, idx_min] = min(tiempo_total_FT2);
fprintf('\n--- FT2 (wc=1) ---\n');
fprintf('Tiempo mínimo: %.3f ms (n = %d)\n', tiempo_min, ordenes_a_probar(idx_min));
fprintf('Tiempo máximo: %.3f ms (n = %d)\n', tiempo_max, ordenes_a_probar(idx_max));
fprintf('Tiempo promedio: %.3f ms\n', mean(tiempo_total_FT2));

[tiempo_max, idx_max] = max(tiempo_total_FT3);
[tiempo_min, idx_min] = min(tiempo_total_FT3);
fprintf('\n--- FT3 (fc variable) ---\n');
fprintf('Tiempo mínimo: %.3f ms (n = %d)\n', tiempo_min, ordenes_a_probar(idx_min));
fprintf('Tiempo máximo: %.3f ms (n = %d)\n', tiempo_max, ordenes_a_probar(idx_max));
fprintf('Tiempo promedio: %.3f ms\n', mean(tiempo_total_FT3));

[tiempo_max, idx_max] = max(tiempo_total_FT4);
[tiempo_min, idx_min] = min(tiempo_total_FT4);
fprintf('\n--- FT4 (τ variable) ---\n');
fprintf('Tiempo mínimo: %.3f ms (n = %d)\n', tiempo_min, ordenes_a_probar(idx_min));
fprintf('Tiempo máximo: %.3f ms (n = %d)\n', tiempo_max, ordenes_a_probar(idx_max));
fprintf('Tiempo promedio: %.3f ms\n', mean(tiempo_total_FT4));

fprintf('\n--- TASA DE ÉXITO PROMEDIO ---\n');
fprintf('FT1: %.1f%%\n', mean(exito_FT1_pct));
fprintf('FT2: %.1f%%\n', mean(exito_FT2_pct));
fprintf('FT3: %.1f%%\n', mean(exito_FT3_pct));
fprintf('FT4: %.1f%%\n', mean(exito_FT4_pct));

fprintf('\n ANÁLISIS DE RUNTIME COMPLETADO\n');
fprintf('   Gráficas guardadas en carpeta "graficas_runtime"\n');
fprintf('   Tabla guardada: resultados_runtime_completo.csv\n');
fprintf('   Se evaluaron TODOS los órdenes de 2 a 21\n');

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