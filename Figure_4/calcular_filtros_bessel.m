function resultados = calcular_filtros_bessel(retardo, f, Desatt, n, fc, tg, rs, tipo_transformacion, param)
    % =========================================================================
    % calcular_filtros_bessel - Función para cálculo y transformación de filtros
    %                          Bessel-Thomson (VERSIÓN CORREGIDA)
    % =========================================================================
    
    % =========================================
    % PARTE 1: PARÁMETROS INICIALES
    % =========================================
    loge = 0.43429448190;
    RL = 1;
    
    % =========================================
    % PARTE 2: DETERMINAR EL ORDEN
    % =========================================
    if nargin < 4 || isempty(n)
        n_calc = round((5 * (((2*pi*f)*retardo)^2) * loge / Desatt) + 0.5);
        n = max(2, min(21, n_calc));
    end
    
    % =========================================
    % PARTE 3: GENERAR FUNCIÓN DE TRANSFERENCIA
    % =========================================
    
    % 3.1 Calcular polinomio de Bessel usando función nativa de MATLAB si está disponible
    if exist('besselap', 'file')
        % Usar función nativa de MATLAB (Signal Processing Toolbox)
        [z, p, k] = besselap(n);
        sys = zpk(z, p, k);
        sys = tf(sys);
        
        % Obtener numerador y denominador
        [num, den] = tfdata(sys, 'v');
        
        % Guardar para elementos de red
        num_norm = num;
        den_norm = den;
        
    else
        % Método alternativo: usar polinomios de Bessel
        syms s
        
        % Calcular polinomio de Bessel
        num = factorial(2*n) / ((2^n) * factorial(n));
        yn = 0;
        for k = 0:n
            yn = yn + (factorial(2*n - k) * s^k) / ((2^(n - k)) * factorial(k) * factorial(n - k));
        end
        den = sym2poly(yn);
        
        % Encontrar frecuencia de corte -3 dB
        % Método numérico en lugar de simbólico
        w_test = logspace(-2, 2, 1000);
        H = zeros(size(w_test));
        
        for i = 1:length(w_test)
            s_val = 1j * w_test(i);
            den_val = polyval(den, s_val);
            H(i) = abs(num / den_val);
        end
        
        % Encontrar w donde |H| = 0.7077 (-3 dB)
        idx = find(H <= 0.7077, 1, 'first');
        if isempty(idx)
            wc = 1;
        else
            wc = w_test(idx);
        end
        
        % Escalar frecuencia
        den_scaled = den;
        for k = 1:length(den)
            den_scaled(k) = den(k) * (wc)^(length(den)-k);
        end
        
        num_norm = num;
        den_norm = den_scaled;
        
        sys = tf(num_norm, den_norm);
    end
    
    % 3.2 Aplicar frecuencia de corte específica si se proporciona
    if nargin >= 5 && ~isempty(fc)
        Wn = 2 * pi * fc;
        % Escalamiento en frecuencia: s -> s/Wn
        den_fc = den_norm;
        for k = 1:length(den_norm)
            den_fc(k) = den_norm(k) * (Wn)^(length(den_norm)-k);
        end
        sys = tf(num_norm, den_fc);
    end
    
    % 3.3 Aplicar retardo específico si se proporciona (requiere BESSEL_POLES)
    if nargin >= 6 && ~isempty(tg)
        if exist('BESSEL_POLES', 'file')
            [k, z, p] = BESSEL_POLES(tg, n);
            sys = zpk(z, p, k);
            sys = tf(sys);
        end
    end
    
    % =========================================
    % PARTE 4: CÁLCULO DE ELEMENTOS DE RED (L y C)
    % =========================================
    % Inicializar
    L_t = []; C_t = []; L_pi = []; C_pi = [];
    
    % Obtener numerador y denominador actual
    [num_curr, den_curr] = tfdata(sys, 'v');
    
    if exist('elementosbesselthomson', 'file')
        try
            [L_t, C_t, L_pi, C_pi] = elementosbesselthomson(den_curr, num_curr, n, RL, rs);
        catch
            % Si falla, continuar sin elementos de red
        end
    end
    
    % =========================================
    % PARTE 5: RESULTADOS BASE
    % =========================================
    resultados = struct();
    resultados.orden = n;
    resultados.sys_original = sys;
    resultados.L_t_original = L_t;
    resultados.C_t_original = C_t;
    resultados.L_pi_original = L_pi;
    resultados.C_pi_original = C_pi;
    resultados.rs = rs;
    resultados.RL = RL;
    
    % Si no hay transformación, retornar
    if nargin < 8 || isempty(tipo_transformacion) || strcmp(tipo_transformacion, 'none')
        return;
    end
    
    % =========================================
    % PARTE 6: APLICAR TRANSFORMACIONES
    % =========================================
    switch lower(tipo_transformacion)
        case 'z'  % Transformación de impedancia
            Z_new = param;
            factor = Z_new;
            
            % Resistencias escaladas
            Rs_new = rs * factor;
            RL_new = RL * factor;
            
            % Elementos de red escalados
            if ~isempty(L_t)
                L_t_z = factor * L_t;
                C_t_z = (1/factor) * C_t;
                L_pi_z = factor * L_pi;
                C_pi_z = (1/factor) * C_pi;
            else
                L_t_z = []; C_t_z = []; L_pi_z = []; C_pi_z = [];
            end
            
            resultados.transformacion.tipo = 'impedancia';
            resultados.transformacion.factor = factor;
            resultados.transformacion.Rs = Rs_new;
            resultados.transformacion.RL = RL_new;
            resultados.transformacion.L_t = L_t_z;
            resultados.transformacion.C_t = C_t_z;
            resultados.transformacion.L_pi = L_pi_z;
            resultados.transformacion.C_pi = C_pi_z;
            resultados.transformacion.sys = sys;
            
        case 'f'  % Transformación en frecuencia
            fc_new = param;
            Wn_new = 2 * pi * fc_new;
            
            % Escalamiento en frecuencia de la FT
            [num_curr, den_curr] = tfdata(sys, 'v');
            den_f = den_curr;
            for k = 1:length(den_curr)
                den_f(k) = den_curr(k) * (Wn_new)^(length(den_curr)-k);
            end
            sys_f = tf(num_curr, den_f);
            
            % Escalamiento de elementos de red
            if ~isempty(L_t)
                L_t_f = L_t / Wn_new;
                C_t_f = C_t / Wn_new;
                L_pi_f = L_pi / Wn_new;
                C_pi_f = C_pi / Wn_new;
            else
                L_t_f = []; C_t_f = []; L_pi_f = []; C_pi_f = [];
            end
            
            resultados.transformacion.tipo = 'frecuencia';
            resultados.transformacion.fc = fc_new;
            resultados.transformacion.Wn = Wn_new;
            resultados.transformacion.sys = sys_f;
            resultados.transformacion.L_t = L_t_f;
            resultados.transformacion.C_t = C_t_f;
            resultados.transformacion.L_pi = L_pi_f;
            resultados.transformacion.C_pi = C_pi_f;
            
        case 'fz'  % Frecuencia + Impedancia
            fc_new = param(1);
            Z_new = param(2);
            Wn_new = 2 * pi * fc_new;
            factor = Z_new;
            
            % Paso 1: Escalamiento en frecuencia
            [num_curr, den_curr] = tfdata(sys, 'v');
            den_f = den_curr;
            for k = 1:length(den_curr)
                den_f(k) = den_curr(k) * (Wn_new)^(length(den_curr)-k);
            end
            sys_f = tf(num_curr, den_f);
            
            % Paso 2: Escalamiento de elementos (frecuencia)
            if ~isempty(L_t)
                L_t_f = L_t / Wn_new;
                C_t_f = C_t / Wn_new;
                L_pi_f = L_pi / Wn_new;
                C_pi_f = C_pi / Wn_new;
            else
                L_t_f = []; C_t_f = []; L_pi_f = []; C_pi_f = [];
            end
            
            % Paso 3: Escalamiento de impedancia
            L_t_fz = factor * L_t_f;
            C_t_fz = (1/factor) * C_t_f;
            L_pi_fz = factor * L_pi_f;
            C_pi_fz = (1/factor) * C_pi_f;
            
            Rs_new = rs * factor;
            RL_new = RL * factor;
            
            resultados.transformacion.tipo = 'frecuencia+impedancia';
            resultados.transformacion.fc = fc_new;
            resultados.transformacion.factor = factor;
            resultados.transformacion.Rs = Rs_new;
            resultados.transformacion.RL = RL_new;
            resultados.transformacion.sys = sys_f;
            resultados.transformacion.L_t = L_t_fz;
            resultados.transformacion.C_t = C_t_fz;
            resultados.transformacion.L_pi = L_pi_fz;
            resultados.transformacion.C_pi = C_pi_fz;
            
        otherwise
            resultados.transformacion = [];
    end
end