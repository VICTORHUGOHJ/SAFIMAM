function analizar_butterworth()
    % =========================================================================
    % analizar_butterworth - Análisis de escalabilidad para Butterworth
    % =========================================================================
    
    fprintf('\n%s\n', repmat('=', 1, 70));
    fprintf('  ANÁLISIS DE ESCALABILIDAD - BUTTERWORTH\n');
    fprintf('%s\n', repmat('=', 1, 70));
    
    % -------------------------------------------------------------------------
    % CONFIGURACIÓN ESPECÍFICA PARA BUTTERWORTH
    % -------------------------------------------------------------------------
    % Estas especificaciones están calibradas para generar órdenes de
    % Butterworth desde 1 hasta 20
    % -------------------------------------------------------------------------
    
    especificaciones = [
        % amax, amin, wswp
        
        3, 20, 3;	%2
        1.5, 20, 2.5;	%3
        1, 25, 3;	%4
        1, 20, 2;	%5
        1, 20, 1.7;	%6
        0.5, 30, 1.9;	%7
        0.5, 30, 1.8;	%8
        1, 20, 1.4;	%9
        0.5, 30, 1.6;	%10
        0.5, 30, 1.5;	%11
        1, 20, 1.3;	%12
        0.5, 20, 1.3;	%13
        1, 25, 1.3;	%14
        1.5, 30, 1.3;	%15
        1, 30, 1.3;	%16
        0.5, 30, 1.3;	%17
        0.5, 31, 1.3;	%18
        0.5, 35, 1.3;	%19
        0.5, 36, 1.3;	%20
        2, 30, 1.2;	%21
    ];
    
    % -------------------------------------------------------------------------
    % PARÁMETROS DE PRUEBA
    % -------------------------------------------------------------------------
    rs = 1;
    impedancias = [10, 25, 50, 75, 100, 150, 200, 300, 500, 1000];
    frecuencias = [100, 200, 500, 1000, 2000, 5000, 10000, 20000, 50000, 1000000];
    bandas = [
        50, 100; 100, 200; 200, 400; 400, 800; 800, 1600;
        1600, 3200; 3200, 6400; 6400, 12800; 12800, 25600; 25600, 51200
    ];
    
    % -------------------------------------------------------------------------
    % VERIFICAR ÓRDENES REALES DE BUTTERWORTH
    % -------------------------------------------------------------------------
    fprintf('\n--- VERIFICANDO ÓRDENES DE BUTTERWORTH ---\n');
    
    wp = 1/10;
    ordenes_reales = zeros(size(especificaciones, 1), 1);
    
    for i = 1:size(especificaciones, 1)
        amax = especificaciones(i, 1);
        amin = especificaciones(i, 2);
        wswp = especificaciones(i, 3);
        ws = wswp / 10;
        
        [nb, ~] = buttord(wp, ws, amax, amin);
        ordenes_reales(i) = nb;
        
        fprintf('Caso %2d: amax=%.2f, amin=%.1f, wswp=%.2f → Orden Butterworth = %2d\n', ...
            i, amax, amin, wswp, nb);
    end
    
    % -------------------------------------------------------------------------
    % MEDICIONES PARA BUTTERWORTH
    % -------------------------------------------------------------------------
    resultados = struct();
    resultados.info.fecha = datestr(now);
    resultados.info.especificaciones = [especificaciones, ordenes_reales];
    resultados.info.ordenes = ordenes_reales;
    
    % 1. Transformación de Impedancia (z)
    fprintf('\n--- TRANSFORMACIÓN DE IMPEDANCIA (z) ---\n');
    resultados.z = medir_butterworth_z(especificaciones, ordenes_reales, rs, impedancias);
    
    % 2. Transformación en Frecuencia (f)
    fprintf('\n--- TRANSFORMACIÓN EN FRECUENCIA (f) ---\n');
    resultados.f = medir_butterworth_f(especificaciones, ordenes_reales, rs, frecuencias);
    
    % 3. Frecuencia + Impedancia (fz)
    fprintf('\n--- FRECUENCIA + IMPEDANCIA (fz) ---\n');
    resultados.fz = medir_butterworth_fz(especificaciones, ordenes_reales, rs, frecuencias, impedancias);
    
    % 4. Pasaaltas (hp)
    fprintf('\n--- PASAALTAS (hp) ---\n');
    resultados.hp = medir_butterworth_hp(especificaciones, ordenes_reales, rs, frecuencias);
    
    % 5. Pasaaltas + Impedancia (hpz)
    fprintf('\n--- PASAALTAS + IMPEDANCIA (hpz) ---\n');
    resultados.hpz = medir_butterworth_hpz(especificaciones, ordenes_reales, rs, frecuencias, impedancias);
    
    % 6. Pasabanda (bp)
    fprintf('\n--- PASABANDA (bp) ---\n');
    resultados.bp = medir_butterworth_bp(especificaciones, ordenes_reales, rs, bandas);
    
    % 7. Pasabanda + Impedancia (bpz)
    fprintf('\n--- PASABANDA + IMPEDANCIA (bpz) ---\n');
    resultados.bpz = medir_butterworth_bpz(especificaciones, ordenes_reales, rs, bandas, impedancias);
    
    % 8. Banda Eliminada (bs)
    fprintf('\n--- BANDA ELIMINADA (bs) ---\n');
    resultados.bs = medir_butterworth_bs(especificaciones, ordenes_reales, rs, bandas);
    
    % 9. Banda Eliminada + Impedancia (bsz)
    fprintf('\n--- BANDA ELIMINADA + IMPEDANCIA (bsz) ---\n');
    resultados.bsz = medir_butterworth_bsz(especificaciones, ordenes_reales, rs, bandas, impedancias);
    
    % -------------------------------------------------------------------------
    % GUARDAR Y GRAFICAR
    % -------------------------------------------------------------------------
    guardar_resultados_butterworth(resultados);
    graficar_butterworth(resultados);
    analizar_complejidad_butterworth(resultados);
    
    fprintf('\n%s\n', repmat('=', 1, 70));
    fprintf('  ANÁLISIS DE BUTTERWORTH COMPLETADO\n');
    fprintf('%s\n', repmat('=', 1, 70));
end

% =========================================================================
% FUNCIONES DE MEDICIÓN PARA BUTTERWORTH
% =========================================================================

function data = medir_butterworth_z(especificaciones, ordenes, rs, impedancias)
    num_casos = size(especificaciones, 1);
    num_impedancias = length(impedancias);
    tiempos = zeros(num_casos, num_impedancias);
    
    for i = 1:num_casos
        amax = especificaciones(i, 1);
        amin = especificaciones(i, 2);
        wswp = especificaciones(i, 3);
        
        for z = 1:num_impedancias
            palp_z = impedancias(z);
            
            tiempos(i, z) = timeit(@() calcular_filtros(...
                amax, amin, wswp, rs, 'z', 'butter', 'none', palp_z));
        end
        
        if mod(i, 5) == 0 || i == num_casos
            fprintf('  Orden %2d: tiempo medio = %.6f s\n', ...
                ordenes(i), mean(tiempos(i, :)));
        end
    end
    
    data.tiempos = tiempos;
    data.ordenes = ordenes;
    data.impedancias = impedancias;
end

function data = medir_butterworth_f(especificaciones, ordenes, rs, frecuencias)
    num_casos = size(especificaciones, 1);
    num_frecuencias = length(frecuencias);
    tiempos = zeros(num_casos, num_frecuencias);
    
    for i = 1:num_casos
        amax = especificaciones(i, 1);
        amin = especificaciones(i, 2);
        wswp = especificaciones(i, 3);
        
        for f = 1:num_frecuencias
            butlp_frec = frecuencias(f);
            
            tiempos(i, f) = timeit(@() calcular_filtros(...
                amax, amin, wswp, rs, 'f', 'butter', 'none', butlp_frec));
        end
        
        if mod(i, 5) == 0 || i == num_casos
            fprintf('  Orden %2d: tiempo medio = %.6f s\n', ...
                ordenes(i), mean(tiempos(i, :)));
        end
    end
    
    data.tiempos = tiempos;
    data.ordenes = ordenes;
    data.frecuencias = frecuencias;
end

function data = medir_butterworth_fz(especificaciones, ordenes, rs, frecuencias, impedancias)
    num_casos = size(especificaciones, 1);
    num_frecuencias = length(frecuencias);
    num_impedancias = length(impedancias);
    tiempos = zeros(num_casos, num_frecuencias, num_impedancias);
    
    for i = 1:num_casos
        amax = especificaciones(i, 1);
        amin = especificaciones(i, 2);
        wswp = especificaciones(i, 3);
        
        for f = 1:num_frecuencias
            for z = 1:num_impedancias
                butlp_frec = frecuencias(f);
                palp_z = impedancias(z);
                
                tiempos(i, f, z) = timeit(@() calcular_filtros(...
                    amax, amin, wswp, rs, 'fz', 'butter', 'none', [butlp_frec, palp_z]));
            end
        end
        
        if mod(i, 5) == 0 || i == num_casos
            fprintf('  Orden %2d: tiempo medio = %.6f s\n', ...
                ordenes(i), mean(tiempos(i, :, :), 'all'));
        end
    end
    
    data.tiempos = tiempos;
    data.ordenes = ordenes;
end

function data = medir_butterworth_hp(especificaciones, ordenes, rs, frecuencias)
    num_casos = size(especificaciones, 1);
    num_frecuencias = length(frecuencias);
    tiempos = zeros(num_casos, num_frecuencias);
    
    for i = 1:num_casos
        amax = especificaciones(i, 1);
        amin = especificaciones(i, 2);
        wswp = especificaciones(i, 3);
        
        for f = 1:num_frecuencias
            buthp_frec = frecuencias(f);
            
            tiempos(i, f) = timeit(@() calcular_filtros(...
                amax, amin, wswp, rs, 'hp', 'butter', 'none', buthp_frec));
        end
        
        if mod(i, 5) == 0 || i == num_casos
            fprintf('  Orden %2d: tiempo medio = %.6f s\n', ...
                ordenes(i), mean(tiempos(i, :)));
        end
    end
    
    data.tiempos = tiempos;
    data.ordenes = ordenes;
end

function data = medir_butterworth_hpz(especificaciones, ordenes, rs, frecuencias, impedancias)
    num_casos = size(especificaciones, 1);
    num_frecuencias = length(frecuencias);
    num_impedancias = length(impedancias);
    tiempos = zeros(num_casos, num_frecuencias, num_impedancias);
    
    for i = 1:num_casos
        amax = especificaciones(i, 1);
        amin = especificaciones(i, 2);
        wswp = especificaciones(i, 3);
        
        for f = 1:num_frecuencias
            for z = 1:num_impedancias
                buthp_frec = frecuencias(f);
                palp_z = impedancias(z);
                
                tiempos(i, f, z) = timeit(@() calcular_filtros(...
                    amax, amin, wswp, rs, 'hpz', 'butter', 'none', [buthp_frec, palp_z]));
            end
        end
        
        if mod(i, 5) == 0 || i == num_casos
            fprintf('  Orden %2d: tiempo medio = %.6f s\n', ...
                ordenes(i), mean(tiempos(i, :, :), 'all'));
        end
    end
    
    data.tiempos = tiempos;
    data.ordenes = ordenes;
end

function data = medir_butterworth_bp(especificaciones, ordenes, rs, bandas)
    num_casos = size(especificaciones, 1);
    num_bandas = size(bandas, 1);
    tiempos = zeros(num_casos, num_bandas);
    
    for i = 1:num_casos
        amax = especificaciones(i, 1);
        amin = especificaciones(i, 2);
        wswp = especificaciones(i, 3);
        
        for b = 1:num_bandas
            butbp_frec = bandas(b, 1);
            butbp_bw = bandas(b, 2);
            
            tiempos(i, b) = timeit(@() calcular_filtros(...
                amax, amin, wswp, rs, 'bp', 'butter', 'none', [butbp_frec, butbp_bw]));
        end
        
        if mod(i, 5) == 0 || i == num_casos
            fprintf('  Orden %2d: tiempo medio = %.6f s\n', ...
                ordenes(i), mean(tiempos(i, :)));
        end
    end
    
    data.tiempos = tiempos;
    data.ordenes = ordenes;
end

function data = medir_butterworth_bpz(especificaciones, ordenes, rs, bandas, impedancias)
    num_casos = size(especificaciones, 1);
    num_bandas = size(bandas, 1);
    num_impedancias = length(impedancias);
    tiempos = zeros(num_casos, num_bandas, num_impedancias);
    
    for i = 1:num_casos
        amax = especificaciones(i, 1);
        amin = especificaciones(i, 2);
        wswp = especificaciones(i, 3);
        
        for b = 1:num_bandas
            for z = 1:num_impedancias
                butbp_frec = bandas(b, 1);
                butbp_bw = bandas(b, 2);
                palp_z = impedancias(z);
                
                tiempos(i, b, z) = timeit(@() calcular_filtros(...
                    amax, amin, wswp, rs, 'bpz', 'butter', 'none', [butbp_frec, butbp_bw, palp_z]));
            end
        end
        
        if mod(i, 5) == 0 || i == num_casos
            fprintf('  Orden %2d: tiempo medio = %.6f s\n', ...
                ordenes(i), mean(tiempos(i, :, :), 'all'));
        end
    end
    
    data.tiempos = tiempos;
    data.ordenes = ordenes;
end

function data = medir_butterworth_bs(especificaciones, ordenes, rs, bandas)
    num_casos = size(especificaciones, 1);
    num_bandas = size(bandas, 1);
    tiempos = zeros(num_casos, num_bandas);
    
    for i = 1:num_casos
        amax = especificaciones(i, 1);
        amin = especificaciones(i, 2);
        wswp = especificaciones(i, 3);
        
        for b = 1:num_bandas
            butbs_frec = bandas(b, 1);
            butbs_bw = bandas(b, 2);
            
            tiempos(i, b) = timeit(@() calcular_filtros(...
                amax, amin, wswp, rs, 'bs', 'butter', 'none', [butbs_frec, butbs_bw]));
        end
        
        if mod(i, 5) == 0 || i == num_casos
            fprintf('  Orden %2d: tiempo medio = %.6f s\n', ...
                ordenes(i), mean(tiempos(i, :)));
        end
    end
    
    data.tiempos = tiempos;
    data.ordenes = ordenes;
end

function data = medir_butterworth_bsz(especificaciones, ordenes, rs, bandas, impedancias)
    num_casos = size(especificaciones, 1);
    num_bandas = size(bandas, 1);
    num_impedancias = length(impedancias);
    tiempos = zeros(num_casos, num_bandas, num_impedancias);
    
    for i = 1:num_casos
        amax = especificaciones(i, 1);
        amin = especificaciones(i, 2);
        wswp = especificaciones(i, 3);
        
        for b = 1:num_bandas
            for z = 1:num_impedancias
                butbs_frec = bandas(b, 1);
                butbs_bw = bandas(b, 2);
                palp_z = impedancias(z);
                
                tiempos(i, b, z) = timeit(@() calcular_filtros(...
                    amax, amin, wswp, rs, 'bsz', 'butter', 'none', [butbs_frec, butbs_bw, palp_z]));
            end
        end
        
        if mod(i, 5) == 0 || i == num_casos
            fprintf('  Orden %2d: tiempo medio = %.6f s\n', ...
                ordenes(i), mean(tiempos(i, :, :), 'all'));
        end
    end
    
    data.tiempos = tiempos;
    data.ordenes = ordenes;
end

% =========================================================================
% FUNCIONES DE UTILIDAD PARA BUTTERWORTH
% =========================================================================

function guardar_resultados_butterworth(resultados)

    mkdir('resultados_butterworth');
    mkdir('resultados_butterworth/graficas');
    mkdir('resultados_butterworth/datos');

    timestamp = datestr(now, 'yyyymmdd_HHMMSS');

    archivo = sprintf('resultados_butterworth/datos/butterworth_%s.mat', timestamp);

    save(archivo, 'resultados', '-v7.3');
    save('resultados_butterworth/ultimo_analisis.mat', 'resultados', '-v7.3');

    fprintf('  Resultados guardados en: %s\n', archivo);
end

function graficar_butterworth(resultados)
    % Gráfica 1: Tiempo vs Orden (Impedancia)
    figure('Position', [100, 100, 1200, 800]);
    
    subplot(2,3,1);
    tiempos_medios = mean(resultados.z.tiempos, 2);
    plot(resultados.z.ordenes, tiempos_medios, 'bo-', 'LineWidth', 2, 'MarkerSize', 8);
    xlabel('Orden del filtro');
    ylabel('Tiempo (s)');
    title('Butterworth - Impedancia (z)');
    grid on;
    
    subplot(2,3,2);
    tiempos_medios = mean(resultados.f.tiempos, 2);
    plot(resultados.f.ordenes, tiempos_medios, 'ro-', 'LineWidth', 2, 'MarkerSize', 8);
    xlabel('Orden del filtro');
    ylabel('Tiempo (s)');
    title('Butterworth - Frecuencia (f)');
    grid on;
    
    subplot(2,3,3);
    tiempos_medios = mean(resultados.hp.tiempos, 2);
    plot(resultados.hp.ordenes, tiempos_medios, 'go-', 'LineWidth', 2, 'MarkerSize', 8);
    xlabel('Orden del filtro');
    ylabel('Tiempo (s)');
    title('Butterworth - Pasaaltas (hp)');
    grid on;
    
    subplot(2,3,4);
    tiempos_medios = mean(resultados.bp.tiempos, 2);
    plot(resultados.bp.ordenes, tiempos_medios, 'mo-', 'LineWidth', 2, 'MarkerSize', 8);
    xlabel('Orden del filtro');
    ylabel('Tiempo (s)');
    title('Butterworth - Pasabanda (bp)');
    grid on;
    
    subplot(2,3,5);
    tiempos_medios = mean(resultados.bs.tiempos, 2);
    plot(resultados.bs.ordenes, tiempos_medios, 'ko-', 'LineWidth', 2, 'MarkerSize', 8);
    xlabel('Orden del filtro');
    ylabel('Tiempo (s)');
    title('Butterworth - Banda Eliminada (bs)');
    grid on;
    
    subplot(2,3,6);
    tiempos_medios_fz = mean(resultados.fz.tiempos, [2,3]);
    tiempos_medios_hpz = mean(resultados.hpz.tiempos, [2,3]);
    tiempos_medios_bpz = mean(resultados.bpz.tiempos, [2,3]);
    tiempos_medios_bsz = mean(resultados.bsz.tiempos, [2,3]);
    
    plot(resultados.fz.ordenes, tiempos_medios_fz, 'b-', 'LineWidth', 2); hold on;
    plot(resultados.hpz.ordenes, tiempos_medios_hpz, 'r-', 'LineWidth', 2);
    plot(resultados.bpz.ordenes, tiempos_medios_bpz, 'g-', 'LineWidth', 2);
    plot(resultados.bsz.ordenes, tiempos_medios_bsz, 'm-', 'LineWidth', 2);
    xlabel('Orden del filtro');
    ylabel('Tiempo (s)');
    title('Butterworth - Dobles Transformaciones');
    legend('fz', 'hpz', 'bpz', 'bsz', 'Location', 'best');
    grid on;
    
    sgtitle('Análisis de Escalabilidad - Butterworth');
    saveas(gcf, 'resultados_butterworth/graficas/butterworth_completo.png');
end

function analizar_complejidad_butterworth(resultados)
    % =========================================================================
    % analizar_complejidad_butterworth - Analiza complejidad de TODAS las
    % transformaciones para Butterworth
    % =========================================================================
    
    fid = fopen('resultados_butterworth/analisis_complejidad.txt', 'w');
    fprintf(fid, 'ANÁLISIS DE COMPLEJIDAD - BUTTERWORTH\n');
    fprintf(fid, '=====================================\n\n');
    fprintf(fid, 'Fecha: %s\n\n', datestr(now));
    
    % Lista de todas las transformaciones a analizar
    transformaciones = {'z', 'f', 'fz', 'hp', 'hpz', 'bp', 'bpz', 'bs', 'bsz'};
    nombres = {
        'Impedancia (z)', 
        'Frecuencia (f)', 
        'Frecuencia + Impedancia (fz)',
        'Pasaaltas (hp)', 
        'Pasaaltas + Impedancia (hpz)',
        'Pasabanda (bp)', 
        'Pasabanda + Impedancia (bpz)',
        'Banda Eliminada (bs)', 
        'Banda Eliminada + Impedancia (bsz)'
    };
    
    for t = 1:length(transformaciones)
        transf = transformaciones{t};
        nombre = nombres{t};
        
        fprintf(fid, '\n%s\n', repmat('-', 1, 50));
        fprintf(fid, 'TRANSFORMACIÓN: %s\n', nombre);
        fprintf(fid, '%s\n', repmat('-', 1, 50));
        
        % Obtener datos según el tipo de transformación
        switch transf
            case {'z', 'f', 'hp', 'bp', 'bs'}
                % Transformaciones simples (matriz 2D: órdenes × parámetros)
                tiempos = mean(resultados.(transf).tiempos, 2);
                
            case {'fz', 'hpz', 'bpz', 'bsz'}
                % Transformaciones dobles (matriz 3D: órdenes × par1 × par2)
                tiempos = mean(resultados.(transf).tiempos, [2,3]);
        end
        
        ordenes = resultados.(transf).ordenes;
        
        % Modelo lineal
        p_lin = polyfit(ordenes, tiempos, 1);
        tiempos_est_lin = polyval(p_lin, ordenes);
        
        % Modelo cuadrático
        p_cuad = polyfit(ordenes, tiempos, 2);
        tiempos_est_cuad = polyval(p_cuad, ordenes);
        
        % Calcular R² para modelo lineal
        ss_res_lin = sum((tiempos - tiempos_est_lin).^2);
        ss_tot = sum((tiempos - mean(tiempos)).^2);
        r2_lin = 1 - ss_res_lin/ss_tot;
        
        % Calcular R² para modelo cuadrático
        ss_res_cuad = sum((tiempos - tiempos_est_cuad).^2);
        r2_cuad = 1 - ss_res_cuad/ss_tot;
        
        % Mostrar resultados
        fprintf(fid, '\n  Modelo lineal:\n');
        fprintf(fid, '    t = %.4e * n + %.4e\n', p_lin(1), p_lin(2));
        fprintf(fid, '    R² = %.6f\n', r2_lin);
        
        fprintf(fid, '\n  Modelo cuadrático:\n');
        fprintf(fid, '    t = %.4e * n² + %.4e * n + %.4e\n', p_cuad(1), p_cuad(2), p_cuad(3));
        fprintf(fid, '    R² = %.6f\n', r2_cuad);
        
        % Determinar mejor modelo
        fprintf(fid, '\n  MEJOR MODELO: ');
        if r2_lin > r2_cuad
            if r2_lin > 0.95
                fprintf('LINEAL (O(n)) - Excelente ajuste\n');
            elseif r2_lin > 0.85
                fprintf('LINEAL (O(n)) - Buen ajuste\n');
            else
                fprintf('LINEAL (O(n)) - Ajuste moderado\n');
            end
        else
            if r2_cuad > 0.95
                fprintf('CUADRÁTICO (O(n²)) - Excelente ajuste\n');
            elseif r2_cuad > 0.85
                fprintf('CUADRÁTICO (O(n²)) - Buen ajuste\n');
            else
                fprintf('CUADRÁTICO (O(n²)) - Ajuste moderado\n');
            end
        end
        
        % Tiempo promedio
        fprintf(fid, '\n   Estadísticas:\n');
        fprintf(fid, '    Tiempo mínimo: %.6f s\n', min(tiempos));
        fprintf(fid, '    Tiempo máximo: %.6f s\n', max(tiempos));
        fprintf(fid, '    Tiempo promedio: %.6f s\n', mean(tiempos));
        fprintf(fid, '    Desviación: %.6f s\n', std(tiempos));
    end
    
    % Resumen comparativo
    fprintf(fid, '\n%s\n', repmat('=', 1, 60));
    fprintf(fid, 'RESUMEN COMPARATIVO DE COMPLEJIDAD\n');
    fprintf(fid, '%s\n', repmat('=', 1, 60));
    fprintf(fid, '\nTransformación\t\tModelo\t\tR²\n');
    fprintf(fid, '%s\n', repmat('-', 1, 50));
    
    for t = 1:length(transformaciones)
        transf = transformaciones{t};
        
        switch transf
            case {'z', 'f', 'hp', 'bp', 'bs'}
                tiempos = mean(resultados.(transf).tiempos, 2);
            case {'fz', 'hpz', 'bpz', 'bsz'}
                tiempos = mean(resultados.(transf).tiempos, [2,3]);
        end
        ordenes = resultados.(transf).ordenes;
        
        % Calcular R² para ambos modelos
        p_lin = polyfit(ordenes, tiempos, 1);
        p_cuad = polyfit(ordenes, tiempos, 2);
        
        r2_lin = 1 - sum((tiempos - polyval(p_lin, ordenes)).^2) / sum((tiempos - mean(tiempos)).^2);
        r2_cuad = 1 - sum((tiempos - polyval(p_cuad, ordenes)).^2) / sum((tiempos - mean(tiempos)).^2);
        
        if r2_lin > r2_cuad
            fprintf(fid, '%s\t\tLINEAL\t\t%.4f\n', transf, r2_lin);
        else
            fprintf(fid, '%s\t\tCUAD\t\t%.4f\n', transf, r2_cuad);
        end
    end
    
    fclose(fid);
    fprintf('   Análisis de complejidad completado para TODAS las transformaciones\n');
    fprintf('   Resultados guardados en: resultados_butterworth/analisis_complejidad.txt\n');
end