%% ========================================================================
%  MEDICIÓN DE RUNTIME TOTAL - CLÁSICOS Y PASCAL
%  CON DESGLOSE POR TRANSFORMACIÓN (9/10 transformaciones)
%  ========================================================================
%  GRÁFICA GENERADA: Runtime total por transformación (estilo Bessel)
%  - Subplot 1: Filtros Clásicos (9 transformaciones)
%  - Subplot 2: Filtros Pascal (10 transformaciones)
%  ========================================================================

function resultados = medir_runtime_clasicos_pascal_completo_ultm(modo_ejecucion)
    
    if nargin < 1
        modo_ejecucion = 'completo';
    end
    
    % =================================================================
    % INICIO DE LA MEDICIÓN
    % =================================================================
    fprintf('\n%s\n', repmat('=', 1, 80));
    fprintf('  MEDICIÓN DE RUNTIME - CLÁSICOS Y PASCAL\n');
    fprintf('  Transformaciones: z, f, fz, hp, hpz, bp, bpz, bs, bsz (+ none para Pascal)\n');
    fprintf('%s\n', repmat('=', 1, 80));
    fprintf('  Modo: %s\n', upper(modo_ejecucion));
    fprintf('  Inicio: %s\n', datestr(now));
    fprintf('%s\n', repmat('=', 1, 80));
    
    tic_total = tic;
    
    % =================================================================
    % CONFIGURACIÓN SEGÚN MODO
    % =================================================================
    switch lower(modo_ejecucion)
        case 'rapido'
            config = configuracion_rapida();
        case 'completo'
            config = configuracion_completa();
        case 'personalizado'
            config = configuracion_personalizada();
        otherwise
            error('Modo no reconocido: %s', modo_ejecucion);
    end
    
    % =================================================================
    % INICIALIZACIÓN DE TABLA DE RESULTADOS
    % =================================================================
    tabla_tiempos = table();
    resultados = struct();
    resultados.info.fecha = datestr(now);
    resultados.info.modo = modo_ejecucion;
    resultados.info.config = config;
    
    % =================================================================
    % DEFINICIÓN DE TRANSFORMACIONES
    % =================================================================
    transformaciones_clasicos = {'z', 'f', 'fz', 'hp', 'hpz', 'bp', 'bpz', 'bs', 'bsz'};
    transformaciones_pascal = {'none', 'z', 'f', 'fz', 'hp', 'hpz', 'bp', 'bpz', 'bs', 'bsz'};
    
    % Tipos de filtros
    tipos_clasicos = {'butter', 'cheby1', 'cheby2', 'ellip'};
    tipos_pascal = {'opt_bp', 'opt_br'};
    
    % =================================================================
    % MEDICIÓN - FILTROS CLÁSICOS (9 transformaciones)
    % =================================================================
    fprintf('\n%s\n', repmat('=', 1, 80));
    fprintf('  MEDICIÓN - FILTROS CLÁSICOS (9 transformaciones)\n');
    fprintf('%s\n', repmat('=', 1, 80));
    
    tic_clasicos = tic;
    
    for t = 1:length(tipos_clasicos)
        tipo = tipos_clasicos{t};
        fprintf('\n Procesando %s...\n', upper(tipo));
        
        for tr = 1:length(transformaciones_clasicos)
            transf = transformaciones_clasicos{tr};
            
            switch transf
                case 'z'
                    for z = 1:length(config.impedancias)
                        Zn = config.impedancias(z);
                        t_start = tic;
                        [exito, ~, mensaje] = ejecutar_filtro_seguro(...
                            config, tipo, transf, 'none', Zn);
                        tiempo_ms = toc(t_start) * 1000;
                        
                        nueva_fila = table(...
                            {tipo}, {transf}, {''}, Zn, NaN, NaN, ...
                            tiempo_ms, exito, {mensaje}, ...
                            'VariableNames', {'Tipo', 'Transformacion', 'Caso', 'Valor1', 'Valor2', 'Valor3', 'Tiempo_ms', 'Exito', 'Mensaje'});
                        tabla_tiempos = [tabla_tiempos; nueva_fila];
                    end
                    
                case 'f'
                    for f = 1:length(config.frecuencias)
                        fc = config.frecuencias(f);
                        t_start = tic;
                        [exito, ~, mensaje] = ejecutar_filtro_seguro(...
                            config, tipo, transf, 'none', fc);
                        tiempo_ms = toc(t_start) * 1000;
                        
                        nueva_fila = table(...
                            {tipo}, {transf}, {''}, fc, NaN, NaN, ...
                            tiempo_ms, exito, {mensaje}, ...
                            'VariableNames', {'Tipo', 'Transformacion', 'Caso', 'Valor1', 'Valor2', 'Valor3', 'Tiempo_ms', 'Exito', 'Mensaje'});
                        tabla_tiempos = [tabla_tiempos; nueva_fila];
                    end
                    
                case 'fz'
                    for f = 1:length(config.frecuencias)
                        for z = 1:length(config.impedancias)
                            fc = config.frecuencias(f);
                            Zn = config.impedancias(z);
                            t_start = tic;
                            [exito, ~, mensaje] = ejecutar_filtro_seguro(...
                                config, tipo, transf, 'none', [fc, Zn]);
                            tiempo_ms = toc(t_start) * 1000;
                            
                            nueva_fila = table(...
                                {tipo}, {transf}, {''}, fc, Zn, NaN, ...
                                tiempo_ms, exito, {mensaje}, ...
                                'VariableNames', {'Tipo', 'Transformacion', 'Caso', 'Valor1', 'Valor2', 'Valor3', 'Tiempo_ms', 'Exito', 'Mensaje'});
                            tabla_tiempos = [tabla_tiempos; nueva_fila];
                        end
                    end
                    
                case 'hp'
                    % hp usa frecuencias (un solo valor por llamada)
                    parametros = config.frecuencias;
                    for p = 1:length(parametros)
                        valor = parametros(p);  % Escalar: 100, 200, 500, ...
                        t_start = tic;
                        [exito, ~, mensaje] = ejecutar_filtro_seguro(...
                            config, tipo, transf, 'none', valor);
                        tiempo_ms = toc(t_start) * 1000;
                        
                        nueva_fila = table(...
                            {tipo}, {transf}, {''}, valor, NaN, NaN, ...
                            tiempo_ms, exito, {mensaje}, ...
                            'VariableNames', {'Tipo', 'Transformacion', 'Caso', 'Valor1', 'Valor2', 'Valor3', 'Tiempo_ms', 'Exito', 'Mensaje'});
                        tabla_tiempos = [tabla_tiempos; nueva_fila];
                    end
                    
                case {'bp', 'bs'}
                    % bp y bs usan bandas (dos valores por llamada)
                    parametros = config.bandas;
                    for p = 1:size(parametros, 1)
                        valor1 = parametros(p, 1);
                        valor2 = parametros(p, 2);
                        t_start = tic;
                        [exito, ~, mensaje] = ejecutar_filtro_seguro(...
                            config, tipo, transf, 'none', [valor1, valor2]);
                        tiempo_ms = toc(t_start) * 1000;
                        
                        nueva_fila = table(...
                            {tipo}, {transf}, {''}, valor1, valor2, NaN, ...
                            tiempo_ms, exito, {mensaje}, ...
                            'VariableNames', {'Tipo', 'Transformacion', 'Caso', 'Valor1', 'Valor2', 'Valor3', 'Tiempo_ms', 'Exito', 'Mensaje'});
                        tabla_tiempos = [tabla_tiempos; nueva_fila];
                    end
                    
                case {'hpz', 'bpz', 'bsz'}
                    if strcmp(transf, 'hpz')
                        parametros = config.frecuencias;
                    else
                        parametros = config.bandas;
                    end
                    
                    for p = 1:size(parametros, 1)
                        for z = 1:length(config.impedancias)
                            Zn = config.impedancias(z);
                            if size(parametros, 2) == 1
                                valor = parametros(p);
                                t_start = tic;
                                [exito, ~, mensaje] = ejecutar_filtro_seguro(...
                                    config, tipo, transf, 'none', [valor, Zn]);
                                tiempo_ms = toc(t_start) * 1000;
                                
                                nueva_fila = table(...
                                    {tipo}, {transf}, {''}, valor, Zn, NaN, ...
                                    tiempo_ms, exito, {mensaje}, ...
                                    'VariableNames', {'Tipo', 'Transformacion', 'Caso', 'Valor1', 'Valor2', 'Valor3', 'Tiempo_ms', 'Exito', 'Mensaje'});
                            else
                                valor1 = parametros(p, 1);
                                valor2 = parametros(p, 2);
                                t_start = tic;
                                [exito, ~, mensaje] = ejecutar_filtro_seguro(...
                                    config, tipo, transf, 'none', [valor1, valor2, Zn]);
                                tiempo_ms = toc(t_start) * 1000;
                                
                                nueva_fila = table(...
                                    {tipo}, {transf}, {''}, valor1, valor2, Zn, ...
                                    tiempo_ms, exito, {mensaje}, ...
                                    'VariableNames', {'Tipo', 'Transformacion', 'Caso', 'Valor1', 'Valor2', 'Valor3', 'Tiempo_ms', 'Exito', 'Mensaje'});
                            end
                            tabla_tiempos = [tabla_tiempos; nueva_fila];
                        end
                    end
            end
        end
        fprintf('   %s completado\n', upper(tipo));
    end
    
    tiempo_clasicos = toc(tic_clasicos);
    fprintf('\n Tiempo total clásicos: %.2f segundos (%.2f minutos)\n', ...
        tiempo_clasicos, tiempo_clasicos/60);
    
    % =================================================================
    % MEDICIÓN - FILTROS PASCAL (10 transformaciones)
    % =================================================================
    fprintf('\n%s\n', repmat('=', 1, 80));
    fprintf('  MEDICIÓN - FILTROS PASCAL (10 transformaciones)\n');
    fprintf('%s\n', repmat('=', 1, 80));
    
    tic_pascal = tic;
    
    for t = 1:length(tipos_pascal)
        tipo = tipos_pascal{t};
        fprintf('\n Procesando %s...\n', upper(tipo));
        
        for tr = 1:length(transformaciones_pascal)
            transf = transformaciones_pascal{tr};
            
            if strcmp(transf, 'none')
                t_start = tic;
                [exito, ~, mensaje] = ejecutar_filtro_seguro(...
                    config, tipo, transf, 'ideal', []);
                tiempo_ms = toc(t_start) * 1000;
                
                nueva_fila = table(...
                    {tipo}, {transf}, {'ideal'}, NaN, NaN, NaN, ...
                    tiempo_ms, exito, {mensaje}, ...
                    'VariableNames', {'Tipo', 'Transformacion', 'Caso', 'Valor1', 'Valor2', 'Valor3', 'Tiempo_ms', 'Exito', 'Mensaje'});
                tabla_tiempos = [tabla_tiempos; nueva_fila];
                continue;
            end
            
            switch transf
                case 'z'
                    for z = 1:length(config.impedancias)
                        Zn = config.impedancias(z);
                        t_start = tic;
                        [exito, ~, mensaje] = ejecutar_filtro_seguro(...
                            config, tipo, transf, 'real', Zn);
                        tiempo_ms = toc(t_start) * 1000;
                        
                        nueva_fila = table(...
                            {tipo}, {transf}, {'real'}, Zn, NaN, NaN, ...
                            tiempo_ms, exito, {mensaje}, ...
                            'VariableNames', {'Tipo', 'Transformacion', 'Caso', 'Valor1', 'Valor2', 'Valor3', 'Tiempo_ms', 'Exito', 'Mensaje'});
                        tabla_tiempos = [tabla_tiempos; nueva_fila];
                    end
                    
                case 'f'
                    for f = 1:length(config.frecuencias)
                        fc = config.frecuencias(f);
                        t_start = tic;
                        [exito, ~, mensaje] = ejecutar_filtro_seguro(...
                            config, tipo, transf, 'real', fc);
                        tiempo_ms = toc(t_start) * 1000;
                        
                        nueva_fila = table(...
                            {tipo}, {transf}, {'real'}, fc, NaN, NaN, ...
                            tiempo_ms, exito, {mensaje}, ...
                            'VariableNames', {'Tipo', 'Transformacion', 'Caso', 'Valor1', 'Valor2', 'Valor3', 'Tiempo_ms', 'Exito', 'Mensaje'});
                        tabla_tiempos = [tabla_tiempos; nueva_fila];
                    end
                    
                case 'fz'
                    for f = 1:length(config.frecuencias)
                        for z = 1:length(config.impedancias)
                            fc = config.frecuencias(f);
                            Zn = config.impedancias(z);
                            t_start = tic;
                            [exito, ~, mensaje] = ejecutar_filtro_seguro(...
                                config, tipo, transf, 'real', [fc, Zn]);
                            tiempo_ms = toc(t_start) * 1000;
                            
                            nueva_fila = table(...
                                {tipo}, {transf}, {'real'}, fc, Zn, NaN, ...
                                tiempo_ms, exito, {mensaje}, ...
                                'VariableNames', {'Tipo', 'Transformacion', 'Caso', 'Valor1', 'Valor2', 'Valor3', 'Tiempo_ms', 'Exito', 'Mensaje'});
                            tabla_tiempos = [tabla_tiempos; nueva_fila];
                        end
                    end
                    
                case 'hp'
                    % hp usa frecuencias (un solo valor por llamada)
                    parametros = config.frecuencias;
                    for p = 1:length(parametros)
                        valor = parametros(p);  % Escalar: 100, 200, 500, ...
                        t_start = tic;
                        [exito, ~, mensaje] = ejecutar_filtro_seguro(...
                            config, tipo, transf, 'real', valor);
                        tiempo_ms = toc(t_start) * 1000;
                        
                        nueva_fila = table(...
                            {tipo}, {transf}, {'real'}, valor, NaN, NaN, ...
                            tiempo_ms, exito, {mensaje}, ...
                            'VariableNames', {'Tipo', 'Transformacion', 'Caso', 'Valor1', 'Valor2', 'Valor3', 'Tiempo_ms', 'Exito', 'Mensaje'});
                        tabla_tiempos = [tabla_tiempos; nueva_fila];
                    end
                    
                case {'bp', 'bs'}
                    % bp y bs usan bandas (dos valores por llamada)
                    parametros = config.bandas;
                    for p = 1:size(parametros, 1)
                        valor1 = parametros(p, 1);
                        valor2 = parametros(p, 2);
                        t_start = tic;
                        [exito, ~, mensaje] = ejecutar_filtro_seguro(...
                            config, tipo, transf, 'real', [valor1, valor2]);
                        tiempo_ms = toc(t_start) * 1000;
                        
                        nueva_fila = table(...
                            {tipo}, {transf}, {'real'}, valor1, valor2, NaN, ...
                            tiempo_ms, exito, {mensaje}, ...
                            'VariableNames', {'Tipo', 'Transformacion', 'Caso', 'Valor1', 'Valor2', 'Valor3', 'Tiempo_ms', 'Exito', 'Mensaje'});
                        tabla_tiempos = [tabla_tiempos; nueva_fila];
                    end
                    
                case {'hpz', 'bpz', 'bsz'}
                    if strcmp(transf, 'hpz')
                        parametros = config.frecuencias;
                    else
                        parametros = config.bandas;
                    end
                    
                    for p = 1:size(parametros, 1)
                        for z = 1:length(config.impedancias)
                            Zn = config.impedancias(z);
                            if size(parametros, 2) == 1
                                valor = parametros(p);
                                t_start = tic;
                                [exito, ~, mensaje] = ejecutar_filtro_seguro(...
                                    config, tipo, transf, 'real', [valor, Zn]);
                                tiempo_ms = toc(t_start) * 1000;
                                
                                nueva_fila = table(...
                                    {tipo}, {transf}, {'real'}, valor, Zn, NaN, ...
                                    tiempo_ms, exito, {mensaje}, ...
                                    'VariableNames', {'Tipo', 'Transformacion', 'Caso', 'Valor1', 'Valor2', 'Valor3', 'Tiempo_ms', 'Exito', 'Mensaje'});
                            else
                                valor1 = parametros(p, 1);
                                valor2 = parametros(p, 2);
                                t_start = tic;
                                [exito, ~, mensaje] = ejecutar_filtro_seguro(...
                                    config, tipo, transf, 'real', [valor1, valor2, Zn]);
                                tiempo_ms = toc(t_start) * 1000;
                                
                                nueva_fila = table(...
                                    {tipo}, {transf}, {'real'}, valor1, valor2, Zn, ...
                                    tiempo_ms, exito, {mensaje}, ...
                                    'VariableNames', {'Tipo', 'Transformacion', 'Caso', 'Valor1', 'Valor2', 'Valor3', 'Tiempo_ms', 'Exito', 'Mensaje'});
                            end
                            tabla_tiempos = [tabla_tiempos; nueva_fila];
                        end
                    end
            end
        end
        fprintf('   %s completado\n', upper(tipo));
    end
    
    tiempo_pascal = toc(tic_pascal);
    fprintf('\n Tiempo total Pascal: %.2f segundos (%.2f minutos)\n', ...
        tiempo_pascal, tiempo_pascal/60);
    
    % =================================================================
    % TIEMPO TOTAL
    % =================================================================
    tiempo_total = toc(tic_total);
    
    % =================================================================
    % CREAR CARPETA DE RESULTADOS
    % =================================================================
    if ~exist('resultados_runtime_clasicos_pascal', 'dir')
        mkdir('resultados_runtime_clasicos_pascal');
        mkdir('resultados_runtime_clasicos_pascal/graficas');
        mkdir('resultados_runtime_clasicos_pascal/datos');
    end
    
    % =================================================================
    % TABLA DE VALIDACIÓN - TIEMPOS POR TRANSFORMACIÓN
    % =================================================================
    fprintf('\n========================================\n');
    fprintf('  TABLA DE VALIDACIÓN - TIEMPOS POR TRANSFORMACIÓN\n');
    fprintf('========================================\n');
    
    % ========== CLÁSICOS ==========
    fprintf('\n FILTROS CLÁSICOS:\n');
    fprintf('%-12s | %-15s | %-15s | %-10s\n', 'Transformación', 'Media (ms)', 'Desv. Est. (ms)', 'N ejecuciones');
    fprintf('----------------------------------------------------------------\n');
    
    for i = 1:length(transformaciones_clasicos)
        transf = transformaciones_clasicos{i};
        
        idx_transf = strcmp(tabla_tiempos.Transformacion, transf);
        idx_clasico = strcmp(tabla_tiempos.Tipo, 'butter') | ...
                      strcmp(tabla_tiempos.Tipo, 'cheby1') | ...
                      strcmp(tabla_tiempos.Tipo, 'cheby2') | ...
                      strcmp(tabla_tiempos.Tipo, 'ellip');
        idx_exito = tabla_tiempos.Exito == true;
        
        tiempos = tabla_tiempos.Tiempo_ms(idx_transf & idx_clasico & idx_exito);
        
        if ~isempty(tiempos)
            fprintf('%-12s | %-15.2f | %-15.2f | %-10d\n', ...
                transf, mean(tiempos), std(tiempos), length(tiempos));
        else
            fprintf('%-12s | %-15s | %-15s | %-10s\n', transf, 'N/A', 'N/A', '0');
        end
    end
    
    % ========== PASCAL ==========
    fprintf('\n FILTROS PASCAL:\n');
    fprintf('%-12s | %-15s | %-15s | %-10s\n', 'Transformación', 'Media (ms)', 'Desv. Est. (ms)', 'N ejecuciones');
    fprintf('----------------------------------------------------------------\n');
    
    for i = 1:length(transformaciones_pascal)
        transf = transformaciones_pascal{i};
        
        idx_transf = strcmp(tabla_tiempos.Transformacion, transf);
        idx_pascal = strcmp(tabla_tiempos.Tipo, 'opt_bp') | ...
                     strcmp(tabla_tiempos.Tipo, 'opt_br');
        idx_exito = tabla_tiempos.Exito == true;
        
        tiempos = tabla_tiempos.Tiempo_ms(idx_transf & idx_pascal & idx_exito);
        
        if ~isempty(tiempos)
            fprintf('%-12s | %-15.2f | %-15.2f | %-10d\n', ...
                transf, mean(tiempos), std(tiempos), length(tiempos));
        else
            fprintf('%-12s | %-15s | %-15s | %-10s\n', transf, 'N/A', 'N/A', '0');
        end
    end
    
    % =================================================================
    % GRÁFICA ESTILO BESSEL - RUNTIME ACUMULADO POR TRANSFORMACIÓN
    % =================================================================
    fprintf('\n========================================\n');
    fprintf('GENERANDO GRÁFICA ESTILO BESSEL\n');
    fprintf('========================================\n');
    
    n_frec = length(config.frecuencias);
    n_imp = length(config.impedancias);
    n_bandas = size(config.bandas, 1);
    
    n_puntos_clasicos = n_frec + n_imp + n_bandas;
    n_puntos_pascal = n_frec + n_imp + n_bandas;
    
    x_clasicos = 1:n_puntos_clasicos;
    x_pascal = 1:n_puntos_pascal;
    
    % Inicializar matrices
    tiempos_clasicos_acum = zeros(length(transformaciones_clasicos), n_puntos_clasicos);
    tiempos_pascal_acum = zeros(length(transformaciones_pascal), n_puntos_pascal);
    
    % ========== PROCESAR CLÁSICOS ==========
    for t = 1:length(transformaciones_clasicos)
        transf = transformaciones_clasicos{t};
        
        idx_transf = strcmp(tabla_tiempos.Transformacion, transf);
        idx_clasico = strcmp(tabla_tiempos.Tipo, 'butter') | ...
                      strcmp(tabla_tiempos.Tipo, 'cheby1') | ...
                      strcmp(tabla_tiempos.Tipo, 'cheby2') | ...
                      strcmp(tabla_tiempos.Tipo, 'ellip');
        idx_exito = tabla_tiempos.Exito == true;
        
        datos = tabla_tiempos(idx_transf & idx_clasico & idx_exito, :);
        
        if height(datos) > 0
            tiempos_ordenados = datos.Tiempo_ms;
            tiempos_acum = cumsum(tiempos_ordenados);
            n_datos = length(tiempos_acum);
            n_asignar = min(n_datos, n_puntos_clasicos);
            tiempos_clasicos_acum(t, 1:n_asignar) = tiempos_acum(1:n_asignar);
            
            if n_asignar < n_puntos_clasicos
                tiempos_clasicos_acum(t, n_asignar+1:end) = tiempos_acum(end);
            end
            
            fprintf('  Clásicos %s: %d ejecuciones\n', transf, n_datos);
        end
    end
    
    % ========== PROCESAR PASCAL ==========
    for t = 1:length(transformaciones_pascal)
        transf = transformaciones_pascal{t};
        
        idx_transf = strcmp(tabla_tiempos.Transformacion, transf);
        idx_pascal = strcmp(tabla_tiempos.Tipo, 'opt_bp') | ...
                     strcmp(tabla_tiempos.Tipo, 'opt_br');
        idx_exito = tabla_tiempos.Exito == true;
        
        datos = tabla_tiempos(idx_transf & idx_pascal & idx_exito, :);
        
        if height(datos) > 0
            tiempos_ordenados = datos.Tiempo_ms;
            tiempos_acum = cumsum(tiempos_ordenados);
            n_datos = length(tiempos_acum);
            n_asignar = min(n_datos, n_puntos_pascal);
            tiempos_pascal_acum(t, 1:n_asignar) = tiempos_acum(1:n_asignar);
            
            if n_asignar < n_puntos_pascal
                tiempos_pascal_acum(t, n_asignar+1:end) = tiempos_acum(end);
            end
            
            fprintf('  Pascal %s: %d ejecuciones\n', transf, n_datos);
        end
    end
    
    % ========== CREAR FIGURA ==========
    figure('Name', 'Runtime por Transformación', 'Position', [100, 100, 1400, 600]);
    
    colores_clasicos = lines(length(transformaciones_clasicos));
    colores_pascal = lines(length(transformaciones_pascal));
    
    % Subplot 1: Clásicos
    subplot(1,2,1);
    hold on;
    
    for t = 1:length(transformaciones_clasicos)
        transf = transformaciones_clasicos{t};
        tiempos = tiempos_clasicos_acum(t, :) / 1000;
        if any(tiempos > 0)
            plot(x_clasicos, tiempos, 'LineWidth', 1.5, 'MarkerSize', 4, ...
                'Color', colores_clasicos(t,:), 'DisplayName', transf);
        end
    end
    
    xlabel('Índice de especificación (frecuencias → impedancias → bandas)');
    ylabel('Tiempo acumulado (segundos)');
    title('Filtros Clásicos - Runtime por Transformación');
    legend('Location', 'northwest', 'FontSize', 8);
    grid on;
    
    % Líneas verticales para segmentos
    xline(n_frec + 0.5, 'k--', 'LineWidth', 1);
    xline(n_frec + n_imp + 0.5, 'k--', 'LineWidth', 1);
    ylims = ylim;
    text(n_frec/2, ylims(2)*0.95, 'Frecuencias', 'HorizontalAlignment', 'center', 'FontSize', 9);
    text(n_frec + n_imp/2, ylims(2)*0.95, 'Impedancias', 'HorizontalAlignment', 'center', 'FontSize', 9);
    text(n_frec + n_imp + n_bandas/2, ylims(2)*0.95, 'Bandas', 'HorizontalAlignment', 'center', 'FontSize', 9);
    
    % Subplot 2: Pascal
    subplot(1,2,2);
    hold on;
    
    for t = 1:length(transformaciones_pascal)
        transf = transformaciones_pascal{t};
        tiempos = tiempos_pascal_acum(t, :) / 1000;
        if any(tiempos > 0)
            plot(x_pascal, tiempos, 'LineWidth', 1.5, 'MarkerSize', 4, ...
                'Color', colores_pascal(t,:), 'DisplayName', transf);
        end
    end
    
    xlabel('Índice de especificación (frecuencias → impedancias → bandas)');
    ylabel('Tiempo acumulado (segundos)');
    title('Filtros Pascal - Runtime por Transformación');
    legend('Location', 'northwest', 'FontSize', 8);
    grid on;
    
    xline(n_frec + 0.5, 'k--', 'LineWidth', 1);
    xline(n_frec + n_imp + 0.5, 'k--', 'LineWidth', 1);
    ylims = ylim;
    text(n_frec/2, ylims(2)*0.95, 'Frecuencias', 'HorizontalAlignment', 'center', 'FontSize', 9);
    text(n_frec + n_imp/2, ylims(2)*0.95, 'Impedancias', 'HorizontalAlignment', 'center', 'FontSize', 9);
    text(n_frec + n_imp + n_bandas/2, ylims(2)*0.95, 'Bandas', 'HorizontalAlignment', 'center', 'FontSize', 9);
    
    sgtitle('Runtime Total por Transformación (Estilo Bessel)', 'FontSize', 14, 'FontWeight', 'bold');
    
    saveas(gcf, 'resultados_runtime_clasicos_pascal/graficas/runtime_por_transformacion_estilo_bessel.png');
    fprintf(' Gráfica guardada: resultados_runtime_clasicos_pascal/graficas/runtime_por_transformacion_estilo_bessel.png\n');
    
    % =================================================================
    % TABLA DE RESULTADOS DETALLADA (TIEMPOS TOTALES POR TRANSFORMACIÓN)
    % =================================================================
    fprintf('\n========================================\n');
    fprintf('  TABLA DE RESULTADOS DETALLADA\n');
    fprintf('========================================\n');
    
    transformaciones_orden = {'z', 'f', 'fz', 'hp', 'hpz', 'bp', 'bpz', 'bs', 'bsz'};
    n_transf = length(transformaciones_orden);
    
    tiempo_clasicos_por_transf = zeros(n_transf, 1);
    tiempo_pascal_por_transf = zeros(n_transf, 1);
    tiempo_total_por_transf = zeros(n_transf, 1);
    
    for i = 1:n_transf
        transf = transformaciones_orden{i};
        
        idx_clasicos = strcmp(tabla_tiempos.Tipo, 'butter') | ...
                       strcmp(tabla_tiempos.Tipo, 'cheby1') | ...
                       strcmp(tabla_tiempos.Tipo, 'cheby2') | ...
                       strcmp(tabla_tiempos.Tipo, 'ellip');
        idx_transf = strcmp(tabla_tiempos.Transformacion, transf);
        idx_valido = tabla_tiempos.Exito == true;
        
        tiempos_clasicos = tabla_tiempos.Tiempo_ms(idx_clasicos & idx_transf & idx_valido);
        if ~isempty(tiempos_clasicos)
            tiempo_clasicos_por_transf(i) = sum(tiempos_clasicos);
        end
        
        idx_pascal = strcmp(tabla_tiempos.Tipo, 'opt_bp') | ...
                     strcmp(tabla_tiempos.Tipo, 'opt_br');
        tiempos_pascal = tabla_tiempos.Tiempo_ms(idx_pascal & idx_transf & idx_valido);
        if ~isempty(tiempos_pascal)
            tiempo_pascal_por_transf(i) = sum(tiempos_pascal);
        end
        
        tiempo_total_por_transf(i) = tiempo_clasicos_por_transf(i) + tiempo_pascal_por_transf(i);
    end
    
    fprintf('\n TIEMPOS POR TRANSFORMACIÓN (segundos):\n');
    fprintf('%-8s | %-15s | %-15s | %-15s\n', 'Transform', 'Clásicos', 'Pascal', 'TOTAL');
    fprintf('--------------------------------------------------------------\n');
    for i = 1:n_transf
        fprintf('%-8s | %-15.2f | %-15.2f | %-15.2f\n', ...
            transformaciones_orden{i}, ...
            tiempo_clasicos_por_transf(i)/1000, ...
            tiempo_pascal_por_transf(i)/1000, ...
            tiempo_total_por_transf(i)/1000);
    end
    
    % =================================================================
    % GUARDAR TABLA DE RESULTADOS
    % =================================================================
    writetable(tabla_tiempos, 'resultados_runtime_clasicos_pascal/datos/tiempos_detallados.csv');
    fprintf('\n Tabla guardada: resultados_runtime_clasicos_pascal/datos/tiempos_detallados.csv\n');
    
    % =================================================================
    % RESUMEN FINAL
    % =================================================================
    fprintf('\n%s\n', repmat('=', 1, 80));
    fprintf('  RESUMEN FINAL - RUNTIME TOTAL\n');
    fprintf('%s\n', repmat('=', 1, 80));
    
    fprintf('\n TIEMPOS TOTALES:\n');
    fprintf('   Clásicos: %.2f segundos (%.2f minutos)\n', tiempo_clasicos, tiempo_clasicos/60);
    fprintf('   Pascal: %.2f segundos (%.2f minutos)\n', tiempo_pascal, tiempo_pascal/60);
    fprintf('   TOTAL: %.2f segundos (%.2f minutos)\n', tiempo_total, tiempo_total/60);
    
    resultados.tiempo_total = tiempo_total;
    resultados.tiempo_clasicos = tiempo_clasicos;
    resultados.tiempo_pascal = tiempo_pascal;
    resultados.tiempo_por_transformacion = table(...
        transformaciones_orden', ...
        tiempo_clasicos_por_transf/1000, ...
        tiempo_pascal_por_transf/1000, ...
        tiempo_total_por_transf/1000, ...
        'VariableNames', {'Transformacion', 'Clasicos_s', 'Pascal_s', 'Total_s'});
    resultados.tabla_tiempos = tabla_tiempos;
    
    timestamp = datestr(now, 'yyyymmdd_HHMMSS');
    archivo_mat = sprintf('resultados_runtime_clasicos_pascal/datos/runtime_%s.mat', timestamp);
    save(archivo_mat, 'resultados', '-v7.3');
    fprintf('\n Resultados guardados en: %s\n', archivo_mat);
    
    fprintf('\n%s\n', repmat('=', 1, 80));
    fprintf('  MEDICIÓN COMPLETADA EXITOSAMENTE\n');
    fprintf('%s\n', repmat('=', 1, 80));
end

%% ========================================================================
%  FUNCIÓN SEGURA PARA EJECUTAR FILTROS
%  ========================================================================

function [exito, orden, mensaje] = ejecutar_filtro_seguro(config, tipo_filtro, transformacion, caso_pascal, valores)
    exito = false;
    orden = 0;
    mensaje = '';
    
    amax = config.amax;
    amin = config.amin;
    wswp = config.wswp;
    rs = config.rs;
    
    try
        resultados = calcular_filtros(amax, amin, wswp, rs, transformacion, tipo_filtro, caso_pascal, valores);
        exito = true;
        mensaje = 'OK';
        
        if isfield(resultados, 'nb')
            orden = resultados.nb;
        elseif isfield(resultados, 'nch1')
            orden = resultados.nch1;
        elseif isfield(resultados, 'nch2')
            orden = resultados.nch2;
        elseif isfield(resultados, 'ne')
            orden = resultados.ne;
        elseif isfield(resultados, 'pascal') && isfield(resultados.pascal, 'npa')
            orden = resultados.pascal.npa;
        end
    catch ME
        mensaje = ME.message;
        exito = false;
    end
end

%% ========================================================================
%  FUNCIONES DE CONFIGURACIÓN
%  ========================================================================

function config = configuracion_rapida()
    config.amax = 3;
    config.amin = 20;
    config.wswp = 2;
    config.rs = 1;
    config.frecuencias = [100];
    config.impedancias = [50];
    config.bandas = [100, 200];
    config.tipos_pascal = {'opt_bp'};
    config.tipos_clasicos = {'butter', 'cheby1'};
end

function config = configuracion_completa()
    config.amax = 3;
    config.amin = 20;
    config.wswp = 2;
    config.rs = 1;
    
    config.frecuencias = [100, 200, 500, 1000, 2000, 5000, 10000, 20000, 50000, 1000000];
    config.impedancias = [10, 25, 50, 75, 100, 150, 200, 300, 500, 1000];
    config.bandas = [
        50, 100; 100, 200; 200, 400; 400, 800; 800, 1600;
        1600, 3200; 3200, 6400; 6400, 12800; 12800, 25600; 25600, 51200
    ];
    
    config.tipos_pascal = {'opt_bp', 'opt_br'};
    config.tipos_clasicos = {'butter', 'cheby1', 'cheby2', 'ellip'};
end

function config = configuracion_personalizada()
    config.amax = 1;
    config.amin = 20;
    config.wswp = 2;
    config.rs = 1;
    config.frecuencias = [100, 500];
    config.impedancias = [50, 100];
    config.bandas = [100, 200; 400, 800];
    config.tipos_pascal = {'opt_bp'};
    config.tipos_clasicos = {'butter', 'cheby1'};
end