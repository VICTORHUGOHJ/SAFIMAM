function analizar_pascal_opt_bp()
    % =========================================================================
    % analizar_pascal_opt_bp - Análisis de escalabilidad para Pascal OPT_BP
    % =========================================================================
    
    fprintf('\n%s\n', repmat('=', 1, 70));
    fprintf('  ANÁLISIS DE ESCALABILIDAD - PASCAL OPT_BP\n');
    fprintf('%s\n', repmat('=', 1, 70));
    
    % -------------------------------------------------------------------------
    % CONFIGURACIÓN ESPECÍFICA PARA PASCAL OPT_BP
    % Pascal depende del orden de Chebyshev I (nch1)
    % -------------------------------------------------------------------------
    
    especificaciones = [
        % amax, amin, wswp
        3, 20, 3;	%2
        1, 20, 3;	%3
        1, 30, 2;	%4
        1, 20, 1.4;	%5
        1, 20, 1.3;	%6
        1, 25, 1.3;	%7
        1, 30, 1.3;	%8
        2, 30, 1.2;	%9
        1.8, 35, 1.2;	%10
        1.5, 35, 1.2;	%11
        0.7, 35, 1.2;	%12
        0.5, 40, 1.2;	%13
        1.5, 30, 1.1;	%14
        0.5, 45, 1.2;	%15
        0.5, 47, 1.2;	%16
        0.5, 51, 1.2;	%17
        1.5, 38, 1.1;	%18	
        0.5, 60, 1.2;	%19	
        1, 40, 1.1;	%20
        1, 43, 1.1;	%21
    ];
    
    % -------------------------------------------------------------------------
    % PARÁMETROS DE PRUEBA
    % -------------------------------------------------------------------------
    rs = 1;
    impedancias = [10, 25, 50, 75, 100, 150, 200, 300, 500, 1000];
    frecuencias = [100, 200, 500, 1000, 2000, 5000, 10000, 20000, 50000, 1000000];
    frecuencias_hp = frecuencias;
    bandas = [
        50, 100; 100, 200; 200, 400; 400, 800; 800, 1600;
        1600, 3200; 3200, 6400; 6400, 12800; 12800, 25600; 25600, 51200
    ];
    
    % -------------------------------------------------------------------------
    % VERIFICAR ÓRDENES REALES DE PASCAL OPT_BP
    % -------------------------------------------------------------------------
    fprintf('\n--- VERIFICANDO ÓRDENES DE PASCAL OPT_BP ---\n');
    
    wp = 1/10;
    ordenes_nch1 = zeros(size(especificaciones, 1), 1);
    ordenes_pascal = zeros(size(especificaciones, 1), 1);
    
    for i = 1:size(especificaciones, 1)
        amax = especificaciones(i, 1);
        amin = especificaciones(i, 2);
        wswp = especificaciones(i, 3);
        ws = wswp / 10;
        wsp = wswp;
        
        [nch1, ~] = cheb1ord(wp, ws, amax, amin);
        np = pasord(amax, amin, nch1, wsp);
        
        ordenes_nch1(i) = nch1;
        ordenes_pascal(i) = np;
        
        fprintf('Caso %2d: amax=%.2f, amin=%.1f, wswp=%.2f → nch1=%2d, np=%2d\n', ...
            i, amax, amin, wswp, nch1, np);
    end
    
    % -------------------------------------------------------------------------
    % MEDICIONES PARA PASCAL OPT_BP
    % -------------------------------------------------------------------------
    resultados = struct();
    resultados.info.fecha = datestr(now);
    resultados.info.especificaciones = [especificaciones, ordenes_nch1, ordenes_pascal];
    resultados.info.ordenes_nch1 = ordenes_nch1;
    resultados.info.ordenes_pascal = ordenes_pascal;
    
    % 1. Caso Ideal
    fprintf('\n--- CASO IDEAL ---\n');
    resultados.ideal = medir_pascal_opt_bp_ideal(especificaciones, ordenes_pascal, rs);
    
    % 2. Transformación de Impedancia (z)
    fprintf('\n--- TRANSFORMACIÓN DE IMPEDANCIA (z) ---\n');
    resultados.z = medir_pascal_opt_bp_z(especificaciones, ordenes_pascal, rs, impedancias);
    
    % 3. Transformación en Frecuencia (f)
    fprintf('\n--- TRANSFORMACIÓN EN FRECUENCIA (f) ---\n');
    resultados.f = medir_pascal_opt_bp_f(especificaciones, ordenes_pascal, rs, frecuencias);
    
    % 4. Frecuencia + Impedancia (fz)
    fprintf('\n--- FRECUENCIA + IMPEDANCIA (fz) ---\n');
    resultados.fz = medir_pascal_opt_bp_fz(especificaciones, ordenes_pascal, rs, frecuencias, impedancias);
    
    % 5. Pasaaltas (hp)
    fprintf('\n--- PASAALTAS (hp) ---\n');
    resultados.hp = medir_pascal_opt_bp_hp(especificaciones, ordenes_pascal, rs, frecuencias_hp);
    
    % 6. Pasaaltas + Impedancia (hpz)
    fprintf('\n--- PASAALTAS + IMPEDANCIA (hpz) ---\n');
    resultados.hpz = medir_pascal_opt_bp_hpz(especificaciones, ordenes_pascal, rs, frecuencias_hp, impedancias);
    
    % 7. Pasabanda (bp)
    fprintf('\n--- PASABANDA (bp) ---\n');
    resultados.bp = medir_pascal_opt_bp_bp(especificaciones, ordenes_pascal, rs, bandas);
    
    % 8. Pasabanda + Impedancia (bpz)
    fprintf('\n--- PASABANDA + IMPEDANCIA (bpz) ---\n');
    resultados.bpz = medir_pascal_opt_bp_bpz(especificaciones, ordenes_pascal, rs, bandas, impedancias);
    
    % 9. Banda Eliminada (bs)
    fprintf('\n--- BANDA ELIMINADA (bs) ---\n');
    resultados.bs = medir_pascal_opt_bp_bs(especificaciones, ordenes_pascal, rs, bandas);
    
    % 10. Banda Eliminada + Impedancia (bsz)
    fprintf('\n--- BANDA ELIMINADA + IMPEDANCIA (bsz) ---\n');
    resultados.bsz = medir_pascal_opt_bp_bsz(especificaciones, ordenes_pascal, rs, bandas, impedancias);
    
    % -------------------------------------------------------------------------
    % GUARDAR Y GRAFICAR
    % -------------------------------------------------------------------------
    guardar_resultados_pascal_opt_bp(resultados);
    graficar_pascal_opt_bp(resultados);
    analizar_complejidad_pascal_opt_bp(resultados);
    
    fprintf('\n%s\n', repmat('=', 1, 70));
    fprintf('  ANÁLISIS DE PASCAL OPT_BP COMPLETADO\n');
    fprintf('%s\n', repmat('=', 1, 70));
end

% =========================================================================
% FUNCIONES DE MEDICIÓN PARA PASCAL OPT_BP
% =========================================================================

function data = medir_pascal_opt_bp_ideal(especificaciones, ordenes, rs)
    num_casos = size(especificaciones, 1);
    tiempos = zeros(num_casos, 1);
    
    for i = 1:num_casos
        amax = especificaciones(i, 1);
        amin = especificaciones(i, 2);
        wswp = especificaciones(i, 3);
        
        tiempos(i) = timeit(@() calcular_filtros(...
            amax, amin, wswp, rs, 'none', 'opt_bp', 'real', []));
        
        if mod(i, 5) == 0 || i == num_casos
            fprintf('  Orden Pascal %2d: tiempo = %.6f s\n', ordenes(i), tiempos(i));
        end
    end
    
    data.tiempos = tiempos;
    data.ordenes = ordenes;
end

function data = medir_pascal_opt_bp_z(especificaciones, ordenes, rs, impedancias)
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
                amax, amin, wswp, rs, 'z', 'opt_bp', 'real', palp_z));
        end
        
        if mod(i, 5) == 0 || i == num_casos
            fprintf('  Orden Pascal %2d: tiempo medio = %.6f s\n', ...
                ordenes(i), mean(tiempos(i, :)));
        end
    end
    
    data.tiempos = tiempos;
    data.ordenes = ordenes;
end

function data = medir_pascal_opt_bp_f(especificaciones, ordenes, rs, frecuencias)
    num_casos = size(especificaciones, 1);
    num_frecuencias = length(frecuencias);
    tiempos = zeros(num_casos, num_frecuencias);
    
    for i = 1:num_casos
        amax = especificaciones(i, 1);
        amin = especificaciones(i, 2);
        wswp = especificaciones(i, 3);
        
        for f = 1:num_frecuencias
            palp_frec = frecuencias(f);
            
            tiempos(i, f) = timeit(@() calcular_filtros(...
                amax, amin, wswp, rs, 'f', 'opt_bp', 'real', palp_frec));
        end
        
        if mod(i, 5) == 0 || i == num_casos
            fprintf('  Orden Pascal %2d: tiempo medio = %.6f s\n', ...
                ordenes(i), mean(tiempos(i, :)));
        end
    end
    
    data.tiempos = tiempos;
    data.ordenes = ordenes;
end

function data = medir_pascal_opt_bp_fz(especificaciones, ordenes, rs, frecuencias, impedancias)
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
                palp_frec = frecuencias(f);
                palp_z = impedancias(z);
                
                tiempos(i, f, z) = timeit(@() calcular_filtros(...
                    amax, amin, wswp, rs, 'fz', 'opt_bp', 'real', [palp_frec, palp_z]));
            end
        end
        
        if mod(i, 5) == 0 || i == num_casos
            fprintf('  Orden Pascal %2d: tiempo medio = %.6f s\n', ...
                ordenes(i), mean(tiempos(i, :, :), 'all'));
        end
    end
    
    data.tiempos = tiempos;
    data.ordenes = ordenes;
end

function data = medir_pascal_opt_bp_hp(especificaciones, ordenes, rs, frecuencias)
    num_casos = size(especificaciones, 1);
    num_frecuencias = length(frecuencias);
    tiempos = zeros(num_casos, num_frecuencias);
    
    for i = 1:num_casos
        amax = especificaciones(i, 1);
        amin = especificaciones(i, 2);
        wswp = especificaciones(i, 3);
        
        for f = 1:num_frecuencias
            pahp_frec = frecuencias(f);
            
            tiempos(i, f) = timeit(@() calcular_filtros(...
                amax, amin, wswp, rs, 'hp', 'opt_bp', 'real', pahp_frec));
        end
        
        if mod(i, 5) == 0 || i == num_casos
            fprintf('  Orden Pascal %2d: tiempo medio = %.6f s\n', ...
                ordenes(i), mean(tiempos(i, :)));
        end
    end
    
    data.tiempos = tiempos;
    data.ordenes = ordenes;
end

function data = medir_pascal_opt_bp_hpz(especificaciones, ordenes, rs, frecuencias, impedancias)
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
                pahp_frec = frecuencias(f);
                palp_z = impedancias(z);
                
                tiempos(i, f, z) = timeit(@() calcular_filtros(...
                    amax, amin, wswp, rs, 'hpz', 'opt_bp', 'real', [pahp_frec, palp_z]));
            end
        end
        
        if mod(i, 5) == 0 || i == num_casos
            fprintf('  Orden Pascal %2d: tiempo medio = %.6f s\n', ...
                ordenes(i), mean(tiempos(i, :, :), 'all'));
        end
    end
    
    data.tiempos = tiempos;
    data.ordenes = ordenes;
end

function data = medir_pascal_opt_bp_bp(especificaciones, ordenes, rs, bandas)
    num_casos = size(especificaciones, 1);
    num_bandas = size(bandas, 1);
    tiempos = zeros(num_casos, num_bandas);
    
    for i = 1:num_casos
        amax = especificaciones(i, 1);
        amin = especificaciones(i, 2);
        wswp = especificaciones(i, 3);
        
        for b = 1:num_bandas
            pabp_frec = bandas(b, 1);
            pabp_bw = bandas(b, 2);
            
            tiempos(i, b) = timeit(@() calcular_filtros(...
                amax, amin, wswp, rs, 'bp', 'opt_bp', 'real', [pabp_frec, pabp_bw]));
        end
        
        if mod(i, 5) == 0 || i == num_casos
            fprintf('  Orden Pascal %2d: tiempo medio = %.6f s\n', ...
                ordenes(i), mean(tiempos(i, :)));
        end
    end
    
    data.tiempos = tiempos;
    data.ordenes = ordenes;
end

function data = medir_pascal_opt_bp_bpz(especificaciones, ordenes, rs, bandas, impedancias)
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
                pabp_frec = bandas(b, 1);
                pabp_bw = bandas(b, 2);
                palp_z = impedancias(z);
                
                tiempos(i, b, z) = timeit(@() calcular_filtros(...
                    amax, amin, wswp, rs, 'bpz', 'opt_bp', 'real', [pabp_frec, pabp_bw, palp_z]));
            end
        end
        
        if mod(i, 5) == 0 || i == num_casos
            fprintf('  Orden Pascal %2d: tiempo medio = %.6f s\n', ...
                ordenes(i), mean(tiempos(i, :, :), 'all'));
        end
    end
    
    data.tiempos = tiempos;
    data.ordenes = ordenes;
end

function data = medir_pascal_opt_bp_bs(especificaciones, ordenes, rs, bandas)
    num_casos = size(especificaciones, 1);
    num_bandas = size(bandas, 1);
    tiempos = zeros(num_casos, num_bandas);
    
    for i = 1:num_casos
        amax = especificaciones(i, 1);
        amin = especificaciones(i, 2);
        wswp = especificaciones(i, 3);
        
        for b = 1:num_bandas
            pabs_frec = bandas(b, 1);
            pabs_bw = bandas(b, 2);
            
            tiempos(i, b) = timeit(@() calcular_filtros(...
                amax, amin, wswp, rs, 'bs', 'opt_bp', 'real', [pabs_frec, pabs_bw]));
        end
        
        if mod(i, 5) == 0 || i == num_casos
            fprintf('  Orden Pascal %2d: tiempo medio = %.6f s\n', ...
                ordenes(i), mean(tiempos(i, :)));
        end
    end
    
    data.tiempos = tiempos;
    data.ordenes = ordenes;
end

function data = medir_pascal_opt_bp_bsz(especificaciones, ordenes, rs, bandas, impedancias)
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
                pabs_frec = bandas(b, 1);
                pabs_bw = bandas(b, 2);
                palp_z = impedancias(z);
                
                tiempos(i, b, z) = timeit(@() calcular_filtros(...
                    amax, amin, wswp, rs, 'bsz', 'opt_bp', 'real', [pabs_frec, pabs_bw, palp_z]));
            end
        end
        
        if mod(i, 5) == 0 || i == num_casos
            fprintf('  Orden Pascal %2d: tiempo medio = %.6f s\n', ...
                ordenes(i), mean(tiempos(i, :, :), 'all'));
        end
    end
    
    data.tiempos = tiempos;
    data.ordenes = ordenes;
end

% =========================================================================
% FUNCIONES DE UTILIDAD PARA PASCAL OPT_BP
% =========================================================================

function guardar_resultados_pascal_opt_bp(resultados)

    mkdir('resultados_pascal_opt_bp');
    mkdir('resultados_pascal_opt_bp/graficas');
    mkdir('resultados_pascal_opt_bp/datos');

    timestamp = datestr(now, 'yyyymmdd_HHMMSS');

    archivo = sprintf('resultados_pascal_opt_bp/datos/pascal_opt_bp_%s.mat', timestamp);

    save(archivo, 'resultados', '-v7.3');
    save('resultados_pascal_opt_bp/ultimo_analisis.mat', 'resultados', '-v7.3');

    fprintf('  Resultados guardados en: %s\n', archivo);
end

function graficar_pascal_opt_bp(resultados)
    figure('Position', [100, 100, 1400, 900]);
    
    subplot(2,3,1);
    plot(resultados.ideal.ordenes, resultados.ideal.tiempos, 'bo-', 'LineWidth', 2, 'MarkerSize', 8);
    xlabel('Orden Pascal');
    ylabel('Tiempo (s)');
    title('Pascal OPT\_BP - Caso Ideal');
    grid on;
    
    subplot(2,3,2);
    tiempos_medios = mean(resultados.z.tiempos, 2);
    plot(resultados.z.ordenes, tiempos_medios, 'ro-', 'LineWidth', 2, 'MarkerSize', 8);
    xlabel('Orden Pascal');
    ylabel('Tiempo (s)');
    title('Pascal OPT\_BP - Impedancia (z)');
    grid on;
    
    subplot(2,3,3);
    tiempos_medios = mean(resultados.f.tiempos, 2);
    plot(resultados.f.ordenes, tiempos_medios, 'go-', 'LineWidth', 2, 'MarkerSize', 8);
    xlabel('Orden Pascal');
    ylabel('Tiempo (s)');
    title('Pascal OPT\_BP - Frecuencia (f)');
    grid on;
    
    subplot(2,3,4);
    tiempos_medios = mean(resultados.hp.tiempos, 2);
    plot(resultados.hp.ordenes, tiempos_medios, 'mo-', 'LineWidth', 2, 'MarkerSize', 8);
    xlabel('Orden Pascal');
    ylabel('Tiempo (s)');
    title('Pascal OPT\_BP - Pasaaltas (hp)');
    grid on;
    
    subplot(2,3,5);
    tiempos_medios = mean(resultados.bp.tiempos, 2);
    plot(resultados.bp.ordenes, tiempos_medios, 'ko-', 'LineWidth', 2, 'MarkerSize', 8);
    xlabel('Orden Pascal');
    ylabel('Tiempo (s)');
    title('Pascal OPT\_BP - Pasabanda (bp)');
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
    xlabel('Orden Pascal');
    ylabel('Tiempo (s)');
    title('Pascal OPT\_BP - Dobles Transformaciones');
    legend('fz', 'hpz', 'bpz', 'bsz', 'Location', 'best');
    grid on;
    
    sgtitle('Análisis de Escalabilidad - Pascal OPT\_BP');
    saveas(gcf, 'resultados_pascal_opt_bp/graficas/pascal_opt_bp_completo.png');
end

function analizar_complejidad_pascal_opt_bp(resultados)
    % =========================================================================
    % analizar_complejidad_pascal_opt_bp - Analiza complejidad de TODAS las
    % transformaciones para Pascal OPT_BP
    % =========================================================================
    
    fid = fopen('resultados_pascal_opt_bp/analisis_complejidad.txt', 'w');
    fprintf(fid, 'ANÁLISIS DE COMPLEJIDAD - PASCAL OPT_BP\n');
    fprintf(fid, '======================================\n\n');
    fprintf(fid, 'Fecha: %s\n\n', datestr(now));
    
    % Lista de todas las transformaciones a analizar (incluyendo ideal)
    transformaciones = {'ideal', 'z', 'f', 'fz', 'hp', 'hpz', 'bp', 'bpz', 'bs', 'bsz'};
    nombres = {
        'Caso Ideal', 
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
        if strcmp(transf, 'ideal')
            tiempos = resultados.(transf).tiempos;
        else
            switch transf
                case {'z', 'f', 'hp', 'bp', 'bs'}
                    tiempos = mean(resultados.(transf).tiempos, 2);
                case {'fz', 'hpz', 'bpz', 'bsz'}
                    tiempos = mean(resultados.(transf).tiempos, [2,3]);
            end
        end
        
        ordenes = resultados.(transf).ordenes;
        
        % Modelo lineal
        p_lin = polyfit(ordenes, tiempos, 1);
        tiempos_est_lin = polyval(p_lin, ordenes);
        
        % Modelo cuadrático
        p_cuad = polyfit(ordenes, tiempos, 2);
        tiempos_est_cuad = polyval(p_cuad, ordenes);
        
        % Calcular R²
        ss_res_lin = sum((tiempos - tiempos_est_lin).^2);
        ss_res_cuad = sum((tiempos - tiempos_est_cuad).^2);
        ss_tot = sum((tiempos - mean(tiempos)).^2);
        
        r2_lin = 1 - ss_res_lin/ss_tot;
        r2_cuad = 1 - ss_res_cuad/ss_tot;
        
        % Mostrar resultados
        fprintf(fid, '\n  Modelo lineal:\n');
        fprintf(fid, '    t = %.4e * n + %.4e\n', p_lin(1), p_lin(2));
        fprintf(fid, '    R² = %.6f\n', r2_lin);
        
        fprintf(fid, '\n  Modelo cuadrático:\n');
        fprintf(fid, '    t = %.4e * n² + %.4e * n + %.4e\n', p_cuad(1), p_cuad(2), p_cuad(3));
        fprintf(fid, '    R² = %.6f\n', r2_cuad);
        
        % Determinar mejor modelo
        fprintf(fid, '\n MEJOR MODELO: ');
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
        
        % Estadísticas
        fprintf(fid, '\n Estadísticas:\n');
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
        
        if strcmp(transf, 'ideal')
            tiempos = resultados.(transf).tiempos;
        else
            switch transf
                case {'z', 'f', 'hp', 'bp', 'bs'}
                    tiempos = mean(resultados.(transf).tiempos, 2);
                case {'fz', 'hpz', 'bpz', 'bsz'}
                    tiempos = mean(resultados.(transf).tiempos, [2,3]);
            end
        end
        ordenes = resultados.(transf).ordenes;
        
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
    fprintf(' Análisis de complejidad completado para TODAS las transformaciones\n');
    fprintf(' Resultados guardados en: resultados_pascal_opt_bp/analisis_complejidad.txt\n');
end