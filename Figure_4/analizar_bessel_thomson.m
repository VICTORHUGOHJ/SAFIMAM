function analizar_bessel_thomson()

    clc; close all;

    fprintf('\n%s\n', repmat('=', 1, 70));
    fprintf('  ANÁLISIS DE ESCALABILIDAD - BESSEL-THOMSON\n');
    fprintf('%s\n', repmat('=', 1, 70));

    % -------------------------------------------------------------------------
    % ESTABILIDAD GRÁFICA
    % -------------------------------------------------------------------------
    opengl software
    set(0,'DefaultFigureRenderer','painters')

    % -------------------------------------------------------------------------
    % CONFIGURACIÓN
    % -------------------------------------------------------------------------
    f = 20E3;
    Desatt = 1;
    rs = 1;
    loge = 0.43429448190;

    % =========================================================================
    % RETARDOS (VECTOR COLUMNA CORRECTO)
    % =========================================================================
    retardos = [
        6.61e-6;
        8.52e-6;
        1.01e-5;
        1.14e-5;
        1.26e-5;
        1.36e-5;
        1.46e-5;
        1.55e-5;
        1.63e-5;
        1.79e-5;
        1.86e-5;
        1.92e-5;
        1.99e-5;
        2.05e-5;
        2.11e-5;
        2.17e-5;
        2.22e-5;
        2.28e-5;
        2.33e-5
    ];

    % =========================================================================
    % CÁLCULO DE ÓRDENES
    % =========================================================================
    ordenes = zeros(length(retardos),1);

    for i = 1:length(retardos)
        n_calc = round((5 * (((2*pi*f)*retardos(i))^2) * loge / Desatt) + 0.5);
        ordenes(i) = max(2, min(21, n_calc));
    end

    fprintf('\n--- VERIFICANDO ÓRDENES DE BESSEL-THOMSON ---\n');
    for i = 1:length(retardos)
        fprintf('Caso %2d: retardo = %.4e s → Orden = %2d\n', ...
            i, retardos(i), ordenes(i));
    end

    % =========================================================================
    % PARÁMETROS
    % =========================================================================
    impedancias = [10,25,50,75,100,150,200,300,500,1000];
    frecuencias = [100,200,500,1000,2000,5000,10000,20000,50000,100000];

    % =========================================================================
    % MEDICIONES
    % =========================================================================
    resultados.z = medir_bessel_z(ordenes, retardos, f, Desatt, rs, impedancias);
    resultados.f = medir_bessel_f(ordenes, retardos, f, Desatt, rs, frecuencias);
    resultados.fz = medir_bessel_fz(ordenes, retardos, f, Desatt, rs, frecuencias, impedancias);

    % =========================================================================
    % GRAFICAR (VISIBLE)
    % =========================================================================
    graficar_bessel(resultados);

    fprintf('\n%s\n', repmat('=', 1, 70));
    fprintf('ANÁLISIS COMPLETADO\n');
    fprintf('%s\n', repmat('=', 1, 70));
end

% =========================================================================
% MEDICIONES
% =========================================================================

function data = medir_bessel_z(ordenes, retardos, f, Desatt, rs, impedancias)

    tiempos = zeros(length(ordenes), length(impedancias));

    for i = 1:length(ordenes)
        for z = 1:length(impedancias)
            tiempos(i,z) = timeit(@() calcular_filtros_bessel(...
                retardos(i), f, Desatt, ordenes(i), [], [], rs, 'z', impedancias(z)));
        end
    end

    data.tiempos = tiempos;
    data.ordenes = ordenes;
end

function data = medir_bessel_f(ordenes, retardos, f, Desatt, rs, frecuencias)

    tiempos = zeros(length(ordenes), length(frecuencias));

    for i = 1:length(ordenes)
        for k = 1:length(frecuencias)
            tiempos(i,k) = timeit(@() calcular_filtros_bessel(...
                retardos(i), f, Desatt, ordenes(i), frecuencias(k), [], rs, 'f', frecuencias(k)));
        end
    end

    data.tiempos = tiempos;
    data.ordenes = ordenes;
end

function data = medir_bessel_fz(ordenes, retardos, f, Desatt, rs, frecuencias, impedancias)

    tiempos = zeros(length(ordenes), length(frecuencias), length(impedancias));

    for i = 1:length(ordenes)
        for k = 1:length(frecuencias)
            for z = 1:length(impedancias)
                tiempos(i,k,z) = timeit(@() calcular_filtros_bessel(...
                    retardos(i), f, Desatt, ordenes(i), frecuencias(k), [], rs, 'fz', [frecuencias(k), impedancias(z)]));
            end
        end
    end

    data.tiempos = tiempos;
    data.ordenes = ordenes;
end

% =========================================================================
% GRÁFICAS (VISIBLE Y ESTABLE)
% =========================================================================

function graficar_bessel(resultados)

    figure

    subplot(2,2,1)
    plot(resultados.z.ordenes, mean(resultados.z.tiempos,2),'o-','LineWidth',2)
    xlabel('Orden'); ylabel('Tiempo (s)')
    title('Impedancia (z)'), grid on

    subplot(2,2,2)
    plot(resultados.f.ordenes, mean(resultados.f.tiempos,2),'o-','LineWidth',2)
    xlabel('Orden'); ylabel('Tiempo (s)')
    title('Frecuencia (f)'), grid on

    subplot(2,2,3)
    tiempos_fz = squeeze(mean(mean(resultados.fz.tiempos,3),2));
    plot(resultados.fz.ordenes, tiempos_fz,'o-','LineWidth',2)
    xlabel('Orden'); ylabel('Tiempo (s)')
    title('Frecuencia + Impedancia'), grid on

    subplot(2,2,4)
    plot(resultados.z.ordenes, mean(resultados.z.tiempos,2),'o-'); hold on
    plot(resultados.f.ordenes, mean(resultados.f.tiempos,2),'o-')
    plot(resultados.fz.ordenes, tiempos_fz,'o-')
    legend('z','f','fz')
    xlabel('Orden'); ylabel('Tiempo (s)')
    title('Comparación'), grid on

    sgtitle('Bessel-Thomson');

end