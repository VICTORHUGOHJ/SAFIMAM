function resultados = calcular_filtros(amax, amin, wswp, rs, tipo_transformacion, tipo_filtro, caso_pascal, param_adicional)
    % =========================================================================
    % calcular_filtros - Función principal para cálculo y transformación de filtros
    % 
    % Entradas:
    %   amax: Atenuación en banda de paso (dB)
    %   amin: Atenuación en banda de rechazo (dB)
    %   wswp: Relación de frecuencias
    %   rs: Resistencia de fuente (ohmios)
    %   tipo_transformacion: 'z','f','fz','hp','hpz','bp','bpz','bs','bsz','none'
    %   tipo_filtro: 'butter','cheby1','cheby2','ellip','todos' (clásicos)
    %                'opt_bp','opt_br' (Pascal real)
    %   caso_pascal: 'ideal' o 'real' (solo para Pascal)
    %   param_adicional: Parámetros según transformación
    %
    % Salidas:
    %   resultados: Estructura con todos los resultados
    % =========================================================================
    
    % =========================================
    % PARTE 1: PARÁMETROS INICIALES (siempre)
    % =========================================
    ws = wswp/10;
    wp = 1/10;
    wc = wp*10;
    wsp = ws*10;
    RL = 1;
    
    % =========================================
    % PARTE 2: CÁLCULOS COMUNES A TODOS
    % =========================================
    % nch1 lo necesitan TODOS (clásicos y Pascal)
    [nch1, ~] = cheb1ord(wp, ws, amax, amin);
    
    % =========================================
    % INICIALIZAR VARIABLES
    % =========================================
    % Clásicos - se inicializan vacíos
    nb = []; nch2 = []; ne = [];
    sys_b = []; sys_c1 = []; sys_c2 = []; sys_e = [];
    Lbu_t = []; Cbu_t = []; Lbu_pi = []; Cbu_pi = [];
    Lch1_t = []; Cch1_t = []; Lch1_pi = []; Cch1_pi = [];
    Lch2_t = []; Cch2_t = []; Lch2_pi = []; Cch2_pi = [];
    Le_t = []; Ce_t = []; Le_pi = []; Ce_pi = [];
    
    % Pascal - se inicializan vacíos
    resultados_pascal = struct();
    resultados_pascal_transform = struct();
    npa = []; indpa = []; capa = []; indpa_pi = []; capa_pi = [];
    indpabr = []; capabr = []; indpa_pibr = []; capa_pibr = [];
    
    % =========================================
    % PARTE 3: CÁLCULOS SEGÚN TIPO DE FILTRO
    % =========================================
    
    % ----- FILTROS CLÁSICOS -----
    if any(strcmp(tipo_filtro, {'butter', 'cheby1', 'cheby2', 'ellip', 'todos'}))
        
        % Calcular órdenes faltantes
        [nb, ~] = buttord(wp, ws, amax, amin);
        [nch2, ~] = cheb2ord(wp, ws, amax, amin);
        [ne, ~] = ellipord(wp, ws, amax, amin);
        
        % Funciones de transferencia clásicas
        % Butterworth
        [zb, pb, kb] = buttap(nb);
        num_b = poly(zb) * kb;
        den_b = poly(pb);
        sys_b = tf(num_b, den_b);
        
        % Chebyshev I
        [zc1, pc1, kc1] = cheb1ap(nch1, amax);
        num_c1 = poly(zc1) * kc1;
        den_c1 = poly(pc1);
        sys_c1 = tf(num_c1, den_c1);
        
        % Chebyshev II
        [zc2, pc2, kc2] = cheb2ap(nch2, amin);
        num_c2 = poly(zc2) * kc2;
        den_c2 = poly(pc2);
        sys_c2 = tf(num_c2, den_c2);
        
        % Elíptico
        [ze, pe, ke] = ellipap(ne, amax, amin);
        num_e = poly(ze) * ke;
        den_e = poly(pe);
        sys_e = tf(num_e, den_e);
        
        % Redes pasivas clásicas
        % ---- Butterworth ----
        try
            [Lbu_t, Cbu_t, ~] = BW_LADDER(wc, wsp, amax, amin, nb, rs, RL, 1);
            [Lbu_pi, Cbu_pi, ~] = BW_LADDER(wc, wsp, amax, amin, nb, rs, RL, 2);
        catch
            Lbu_t = 0; Cbu_t = 0; Lbu_pi = 0; Cbu_pi = 0;
        end
        
        % ---- Chebyshev I ----
        try
            [Lch1_t, Cch1_t, ~] = CH_I_LADDER(wc, wsp, amax, amin, nch1, rs, RL, 1);
            [Lch1_pi, Cch1_pi, ~] = CH_I_LADDER(wc, wsp, amax, amin, nch1, rs, RL, 0);
        catch
            Lch1_t = 0; Cch1_t = 0; Lch1_pi = 0; Cch1_pi = 0;
        end
        
        % ---- Chebyshev II ----
        try
            [Gch2, Zch2, Pch2] = CH_II_POLES(wc, wsp, amax, amin, nch2);
            [Lch2_t, Cch2_t, ~] = CH_II_LADDER(Gch2, Zch2, Pch2, wc, wsp, rs, RL, 1);
            [Lch2_pi, Cch2_pi, ~] = CH_II_LADDER(Gch2, Zch2, Pch2, wc, wsp, rs, RL, 0);
        catch
            Lch2_t = 0; Cch2_t = 0; Lch2_pi = 0; Cch2_pi = 0;
        end
        
        % ---- Elíptico ----
        try
            [Ge, Ze, R_ZEROSe, Pe, ~] = CA_POLES(wc, wsp, amax, amin, ne);
            [Le_t, Ce_t, ~, ~, ~, ~] = CA_LADDER(Ge, Ze, R_ZEROSe, Pe, wc, wsp, rs, RL, 1);
            [Le_pi, Ce_pi, ~, ~, ~, ~] = CA_LADDER(Ge, Ze, R_ZEROSe, Pe, wc, wsp, rs, RL, 0);
        catch
            Le_t = 0; Ce_t = 0; Le_pi = 0; Ce_pi = 0;
        end
    end
    
    % ----- FILTROS PASCAL -----
    if any(strcmp(tipo_filtro, {'opt_bp', 'opt_br', 'ideal'}))
        
        % Calcular orden Pascal base
        np_original = pasord(amax, amin, nch1, wsp);
        
        % ---- CASO IDEAL PASCAL ----
        if strcmp(caso_pascal, 'ideal')
            sysp_ideal = funpas_optbandstop(np_original, amax);
            syspmin_ideal = funpas_optbandpas(np_original, wsp, amin);
            
            resultados_pascal.caso = 'ideal';
            resultados_pascal.np = np_original;
            resultados_pascal.sysp_opt_bp = sysp_ideal;
            resultados_pascal.sysp_opt_br = syspmin_ideal;
            
        % ---- CASO REAL PASCAL ----
        else % 'real'
            % 5.1 Ajuste por Rs
            [amax_pascal, amin_pascal, np_pascal, OmegaD, pmax] = ...
                rawsrsnp(amax, amin, ws, rs, np_original);
            
            % 5.2 Funciones de transferencia con Rs
            [sysprs, syspminrs, npa, denparcial, numerador, denminparcial, numin, ...
             nump_max, denp_max, nump_min, denp_min] = ...
                tfrs(ws, amax, amin, np_original, rs);
            
            % 5.3 Cálculo de elementos de red Pascal originales
            [indpa, capa, capa_pi, indpa_pi, num1, den1] = ...
                elementospascal(numerador, denparcial, 1, rs, npa);
            
            [indpabr, capabr, capa_pibr, indpa_pibr, num2, den2] = ...
                elementospascal(numin, denminparcial, 1, rs, npa);
            
            resultados_pascal.caso = 'real';
            resultados_pascal.np_original = np_original;
            resultados_pascal.np_pascal = np_pascal;
            resultados_pascal.amax_pascal = amax_pascal;
            resultados_pascal.amin_pascal = amin_pascal;
            resultados_pascal.npa = npa;
            resultados_pascal.sysprs = sysprs;
            resultados_pascal.syspminrs = syspminrs;
            resultados_pascal.Lpabp_t = indpa;
            resultados_pascal.Cpabp_t = capa;
            resultados_pascal.Lpabp_pi = indpa_pi;
            resultados_pascal.Cpabp_pi = capa_pi;
            resultados_pascal.Lpabr_t = indpabr;
            resultados_pascal.Cpabr_t = capabr;
            resultados_pascal.Lpabr_pi = indpa_pibr;
            resultados_pascal.Cpabr_pi = capa_pibr;
        end
    end
    
    % =========================================
    % PARTE 4: TRANSFORMACIONES PARA FILTROS CLÁSICOS
    % =========================================
    resultados_clasicos = struct();
    
    if any(strcmp(tipo_filtro, {'butter', 'cheby1', 'cheby2', 'ellip', 'todos'})) && ...
       ~isempty(nb)  % Solo si hay datos clásicos
        
        switch lower(tipo_transformacion)
            % ----- IMPEDANCIA -----
            case 'z'
                palp_z = param_adicional;
                resultados_clasicos.tipo = 'impedancia';
                resultados_clasicos.palp_z = palp_z;
                resultados_clasicos.Rs = rs * palp_z;
                resultados_clasicos.RL = RL * palp_z;
                
                % Butterworth
                resultados_clasicos.butter.L_t = round(palp_z * Lbu_t, 6);
                resultados_clasicos.butter.C_t = round((1/palp_z) * Cbu_t, 6);
                resultados_clasicos.butter.L_pi = round(palp_z * Lbu_pi, 6);
                resultados_clasicos.butter.C_pi = round((1/palp_z) * Cbu_pi, 6);
                
                % Chebyshev I
                resultados_clasicos.cheby1.L_t = round(palp_z * Lch1_t, 6);
                resultados_clasicos.cheby1.C_t = round((1/palp_z) * Cch1_t, 6);
                resultados_clasicos.cheby1.L_pi = round(palp_z * Lch1_pi, 6);
                resultados_clasicos.cheby1.C_pi = round((1/palp_z) * Cch1_pi, 6);
                
                % Chebyshev II
                resultados_clasicos.cheby2.L_t = round(palp_z * Lch2_t, 6);
                resultados_clasicos.cheby2.C_t = round((1/palp_z) * Cch2_t, 6);
                resultados_clasicos.cheby2.L_pi = round(palp_z * Lch2_pi, 6);
                resultados_clasicos.cheby2.C_pi = round((1/palp_z) * Cch2_pi, 6);
                
                % Elíptico
                resultados_clasicos.ellip.L_t = round(palp_z * Le_t, 6);
                resultados_clasicos.ellip.C_t = round((1/palp_z) * Ce_t, 6);
                resultados_clasicos.ellip.L_pi = round(palp_z * Le_pi, 6);
                resultados_clasicos.ellip.C_pi = round((1/palp_z) * Ce_pi, 6);
                
            % ----- FRECUENCIA -----
            case 'f'
                butlp_frec = param_adicional;
                Wn = 2 * pi * butlp_frec;
                resultados_clasicos.tipo = 'frecuencia';
                resultados_clasicos.butlp_frec = butlp_frec;
                resultados_clasicos.Wn = Wn;
                resultados_clasicos.Rs = rs;
                resultados_clasicos.RL = RL;
                
                % Butterworth
                resultados_clasicos.butter.L_t = round(Lbu_t / Wn, 6);
                resultados_clasicos.butter.C_t = round(Cbu_t / Wn, 6);
                resultados_clasicos.butter.L_pi = round(Lbu_pi / Wn, 6);
                resultados_clasicos.butter.C_pi = round(Cbu_pi / Wn, 6);
                
                % Chebyshev I
                resultados_clasicos.cheby1.L_t = round(Lch1_t / Wn, 6);
                resultados_clasicos.cheby1.C_t = round(Cch1_t / Wn, 6);
                resultados_clasicos.cheby1.L_pi = round(Lch1_pi / Wn, 6);
                resultados_clasicos.cheby1.C_pi = round(Cch1_pi / Wn, 6);
                
                % Chebyshev II
                resultados_clasicos.cheby2.L_t = round(Lch2_t / Wn, 6);
                resultados_clasicos.cheby2.C_t = round(Cch2_t / Wn, 6);
                resultados_clasicos.cheby2.L_pi = round(Lch2_pi / Wn, 6);
                resultados_clasicos.cheby2.C_pi = round(Cch2_pi / Wn, 6);
                
                % Elíptico
                resultados_clasicos.ellip.L_t = round(Le_t / Wn, 6);
                resultados_clasicos.ellip.C_t = round(Ce_t / Wn, 6);
                resultados_clasicos.ellip.L_pi = round(Le_pi / Wn, 6);
                resultados_clasicos.ellip.C_pi = round(Ce_pi / Wn, 6);
                
            % ----- FRECUENCIA + IMPEDANCIA -----
            case 'fz'
                butlp_frec = param_adicional(1);
                palp_z = param_adicional(2);
                Wn = 2 * pi * butlp_frec;
                resultados_clasicos.tipo = 'frecuencia+impedancia';
                resultados_clasicos.butlp_frec = butlp_frec;
                resultados_clasicos.palp_z = palp_z;
                resultados_clasicos.Wn = Wn;
                resultados_clasicos.Rs = rs * palp_z;
                resultados_clasicos.RL = RL * palp_z;
                
                % Butterworth
                Lbu_t_f = Lbu_t / Wn; Cbu_t_f = Cbu_t / Wn;
                Lbu_pi_f = Lbu_pi / Wn; Cbu_pi_f = Cbu_pi / Wn;
                resultados_clasicos.butter.L_t = round(palp_z * Lbu_t_f, 6);
                resultados_clasicos.butter.C_t = round((1/palp_z) * Cbu_t_f, 6);
                resultados_clasicos.butter.L_pi = round(palp_z * Lbu_pi_f, 6);
                resultados_clasicos.butter.C_pi = round((1/palp_z) * Cbu_pi_f, 6);
                
                % Chebyshev I
                Lch1_t_f = Lch1_t / Wn; Cch1_t_f = Cch1_t / Wn;
                Lch1_pi_f = Lch1_pi / Wn; Cch1_pi_f = Cch1_pi / Wn;
                resultados_clasicos.cheby1.L_t = round(palp_z * Lch1_t_f, 6);
                resultados_clasicos.cheby1.C_t = round((1/palp_z) * Cch1_t_f, 6);
                resultados_clasicos.cheby1.L_pi = round(palp_z * Lch1_pi_f, 6);
                resultados_clasicos.cheby1.C_pi = round((1/palp_z) * Cch1_pi_f, 6);
                
                % Chebyshev II
                Lch2_t_f = Lch2_t / Wn; Cch2_t_f = Cch2_t / Wn;
                Lch2_pi_f = Lch2_pi / Wn; Cch2_pi_f = Cch2_pi / Wn;
                resultados_clasicos.cheby2.L_t = round(palp_z * Lch2_t_f, 6);
                resultados_clasicos.cheby2.C_t = round((1/palp_z) * Cch2_t_f, 6);
                resultados_clasicos.cheby2.L_pi = round(palp_z * Lch2_pi_f, 6);
                resultados_clasicos.cheby2.C_pi = round((1/palp_z) * Cch2_pi_f, 6);
                
                % Elíptico
                Le_t_f = Le_t / Wn; Ce_t_f = Ce_t / Wn;
                Le_pi_f = Le_pi / Wn; Ce_pi_f = Ce_pi / Wn;
                resultados_clasicos.ellip.L_t = round(palp_z * Le_t_f, 6);
                resultados_clasicos.ellip.C_t = round((1/palp_z) * Ce_t_f, 6);
                resultados_clasicos.ellip.L_pi = round(palp_z * Le_pi_f, 6);
                resultados_clasicos.ellip.C_pi = round((1/palp_z) * Ce_pi_f, 6);
                
            % ----- PASAALTAS -----
            case 'hp'

                %fprintf('DEBUG hp: param_adicional = ');
                %disp(param_adicional);
                %fprintf('DEBUG hp: tipo = %s\n', class(param_adicional));
                %fprintf('DEBUG hp: tamaño = %s\n', mat2str(size(param_adicional)));


                buthp_frec = param_adicional;
                Wc_hp = 2 * pi * buthp_frec;
                resultados_clasicos.tipo = 'pasaaltas';
                resultados_clasicos.buthp_frec = buthp_frec;
                resultados_clasicos.Wc_hp = Wc_hp;
                resultados_clasicos.Rs = rs;
                resultados_clasicos.RL = RL;
                
                % Butterworth
                resultados_clasicos.butter.C_t = round(1 ./ (Lbu_t * Wc_hp), 6);
                resultados_clasicos.butter.L_t = round(1 ./ (Cbu_t * Wc_hp), 6);
                resultados_clasicos.butter.C_pi = round(1 ./ (Lbu_pi * Wc_hp), 6);
                resultados_clasicos.butter.L_pi = round(1 ./ (Cbu_pi * Wc_hp), 6);
                
                % Chebyshev I
                resultados_clasicos.cheby1.C_t = round(1 ./ (Lch1_t * Wc_hp), 6);
                resultados_clasicos.cheby1.L_t = round(1 ./ (Cch1_t * Wc_hp), 6);
                resultados_clasicos.cheby1.C_pi = round(1 ./ (Lch1_pi * Wc_hp), 6);
                resultados_clasicos.cheby1.L_pi = round(1 ./ (Cch1_pi * Wc_hp), 6);
                
                % Chebyshev II
                resultados_clasicos.cheby2.C_t = round(1 ./ (Lch2_t * Wc_hp), 6);
                resultados_clasicos.cheby2.L_t = round(1 ./ (Cch2_t * Wc_hp), 6);
                resultados_clasicos.cheby2.C_pi = round(1 ./ (Lch2_pi * Wc_hp), 6);
                resultados_clasicos.cheby2.L_pi = round(1 ./ (Cch2_pi * Wc_hp), 6);
                
                % Elíptico
                resultados_clasicos.ellip.C_t = round(1 ./ (Le_t * Wc_hp), 6);
                resultados_clasicos.ellip.L_t = round(1 ./ (Ce_t * Wc_hp), 6);
                resultados_clasicos.ellip.C_pi = round(1 ./ (Le_pi * Wc_hp), 6);
                resultados_clasicos.ellip.L_pi = round(1 ./ (Ce_pi * Wc_hp), 6);
                
            % ----- PASAALTAS + IMPEDANCIA -----
            case 'hpz'
                buthp_frec = param_adicional(1);
                palp_z = param_adicional(2);
                Wc_hp = 2 * pi * buthp_frec;
                resultados_clasicos.tipo = 'pasaaltas+impedancia';
                resultados_clasicos.buthp_frec = buthp_frec;
                resultados_clasicos.palp_z = palp_z;
                resultados_clasicos.Wc_hp = Wc_hp;
                resultados_clasicos.Rs = rs * palp_z;
                resultados_clasicos.RL = RL * palp_z;
                
                % Butterworth
                C_b_t_hp = 1 ./ (Lbu_t * Wc_hp); L_b_t_hp = 1 ./ (Cbu_t * Wc_hp);
                C_b_pi_hp = 1 ./ (Lbu_pi * Wc_hp); L_b_pi_hp = 1 ./ (Cbu_pi * Wc_hp);
                resultados_clasicos.butter.C_t = round(palp_z * C_b_t_hp, 6);
                resultados_clasicos.butter.L_t = round(palp_z * L_b_t_hp, 6);
                resultados_clasicos.butter.C_pi = round(palp_z * C_b_pi_hp, 6);
                resultados_clasicos.butter.L_pi = round(palp_z * L_b_pi_hp, 6);
                
                % Chebyshev I
                C_c1_t_hp = 1 ./ (Lch1_t * Wc_hp); L_c1_t_hp = 1 ./ (Cch1_t * Wc_hp);
                C_c1_pi_hp = 1 ./ (Lch1_pi * Wc_hp); L_c1_pi_hp = 1 ./ (Cch1_pi * Wc_hp);
                resultados_clasicos.cheby1.C_t = round(palp_z * C_c1_t_hp, 6);
                resultados_clasicos.cheby1.L_t = round(palp_z * L_c1_t_hp, 6);
                resultados_clasicos.cheby1.C_pi = round(palp_z * C_c1_pi_hp, 6);
                resultados_clasicos.cheby1.L_pi = round(palp_z * L_c1_pi_hp, 6);
                
                % Chebyshev II
                C_c2_t_hp = 1 ./ (Lch2_t * Wc_hp); L_c2_t_hp = 1 ./ (Cch2_t * Wc_hp);
                C_c2_pi_hp = 1 ./ (Lch2_pi * Wc_hp); L_c2_pi_hp = 1 ./ (Cch2_pi * Wc_hp);
                resultados_clasicos.cheby2.C_t = round(palp_z * C_c2_t_hp, 6);
                resultados_clasicos.cheby2.L_t = round(palp_z * L_c2_t_hp, 6);
                resultados_clasicos.cheby2.C_pi = round(palp_z * C_c2_pi_hp, 6);
                resultados_clasicos.cheby2.L_pi = round(palp_z * L_c2_pi_hp, 6);
                
                % Elíptico
                C_e_t_hp = 1 ./ (Le_t * Wc_hp); L_e_t_hp = 1 ./ (Ce_t * Wc_hp);
                C_e_pi_hp = 1 ./ (Le_pi * Wc_hp); L_e_pi_hp = 1 ./ (Ce_pi * Wc_hp);
                resultados_clasicos.ellip.C_t = round(palp_z * C_e_t_hp, 6);
                resultados_clasicos.ellip.L_t = round(palp_z * L_e_t_hp, 6);
                resultados_clasicos.ellip.C_pi = round(palp_z * C_e_pi_hp, 6);
                resultados_clasicos.ellip.L_pi = round(palp_z * L_e_pi_hp, 6);
                
            % ----- PASABANDA -----
            case 'bp'
                butbp_frec = param_adicional(1);
                butbp_bw = param_adicional(2);
                Wc_bp = sqrt((2*pi*butbp_frec) * (2*pi*butbp_bw));
                Bw_bp = (2*pi*butbp_bw) - (2*pi*butbp_frec);
                resultados_clasicos.tipo = 'pasabanda';
                resultados_clasicos.butbp_frec = butbp_frec;
                resultados_clasicos.butbp_bw = butbp_bw;
                resultados_clasicos.Wc_bp = Wc_bp;
                resultados_clasicos.Bw_bp = Bw_bp;
                resultados_clasicos.Rs = rs;
                resultados_clasicos.RL = RL;
                
                % Butterworth
                resultados_clasicos.butter.L_serie_t = round(Lbu_t / Bw_bp, 6);
                resultados_clasicos.butter.C_serie_t = round(Bw_bp ./ (Lbu_t * Wc_bp^2), 6);
                resultados_clasicos.butter.L_paralelo_t = round(Bw_bp ./ (Cbu_t * Wc_bp^2), 6);
                resultados_clasicos.butter.C_paralelo_t = round(Cbu_t / Bw_bp, 6);
                resultados_clasicos.butter.L_serie_pi = round(Lbu_pi / Bw_bp, 6);
                resultados_clasicos.butter.C_serie_pi = round(Bw_bp ./ (Lbu_pi * Wc_bp^2), 6);
                resultados_clasicos.butter.L_paralelo_pi = round(Bw_bp ./ (Cbu_pi * Wc_bp^2), 6);
                resultados_clasicos.butter.C_paralelo_pi = round(Cbu_pi / Bw_bp, 6);
                
                % Chebyshev I
                resultados_clasicos.cheby1.L_serie_t = round(Lch1_t / Bw_bp, 6);
                resultados_clasicos.cheby1.C_serie_t = round(Bw_bp ./ (Lch1_t * Wc_bp^2), 6);
                resultados_clasicos.cheby1.L_paralelo_t = round(Bw_bp ./ (Cch1_t * Wc_bp^2), 6);
                resultados_clasicos.cheby1.C_paralelo_t = round(Cch1_t / Bw_bp, 6);
                resultados_clasicos.cheby1.L_serie_pi = round(Lch1_pi / Bw_bp, 6);
                resultados_clasicos.cheby1.C_serie_pi = round(Bw_bp ./ (Lch1_pi * Wc_bp^2), 6);
                resultados_clasicos.cheby1.L_paralelo_pi = round(Bw_bp ./ (Cch1_pi * Wc_bp^2), 6);
                resultados_clasicos.cheby1.C_paralelo_pi = round(Cch1_pi / Bw_bp, 6);
                
                % Chebyshev II
                resultados_clasicos.cheby2.L_serie_t = round(Lch2_t / Bw_bp, 6);
                resultados_clasicos.cheby2.C_serie_t = round(Bw_bp ./ (Lch2_t * Wc_bp^2), 6);
                resultados_clasicos.cheby2.L_paralelo_t = round(Bw_bp ./ (Cch2_t * Wc_bp^2), 6);
                resultados_clasicos.cheby2.C_paralelo_t = round(Cch2_t / Bw_bp, 6);
                resultados_clasicos.cheby2.L_serie_pi = round(Lch2_pi / Bw_bp, 6);
                resultados_clasicos.cheby2.C_serie_pi = round(Bw_bp ./ (Lch2_pi * Wc_bp^2), 6);
                resultados_clasicos.cheby2.L_paralelo_pi = round(Bw_bp ./ (Cch2_pi * Wc_bp^2), 6);
                resultados_clasicos.cheby2.C_paralelo_pi = round(Cch2_pi / Bw_bp, 6);
                
                % Elíptico
                resultados_clasicos.ellip.L_serie_t = round(Le_t / Bw_bp, 6);
                resultados_clasicos.ellip.C_serie_t = round(Bw_bp ./ (Le_t * Wc_bp^2), 6);
                resultados_clasicos.ellip.L_paralelo_t = round(Bw_bp ./ (Ce_t * Wc_bp^2), 6);
                resultados_clasicos.ellip.C_paralelo_t = round(Ce_t / Bw_bp, 6);
                resultados_clasicos.ellip.L_serie_pi = round(Le_pi / Bw_bp, 6);
                resultados_clasicos.ellip.C_serie_pi = round(Bw_bp ./ (Le_pi * Wc_bp^2), 6);
                resultados_clasicos.ellip.L_paralelo_pi = round(Bw_bp ./ (Ce_pi * Wc_bp^2), 6);
                resultados_clasicos.ellip.C_paralelo_pi = round(Ce_pi / Bw_bp, 6);
                
            % ----- PASABANDA + IMPEDANCIA -----
            case 'bpz'
                butbp_frec = param_adicional(1);
                butbp_bw = param_adicional(2);
                palp_z = param_adicional(3);
                Wc_bp = sqrt((2*pi*butbp_frec) * (2*pi*butbp_bw));
                Bw_bp = (2*pi*butbp_bw) - (2*pi*butbp_frec);
                resultados_clasicos.tipo = 'pasabanda+impedancia';
                resultados_clasicos.butbp_frec = butbp_frec;
                resultados_clasicos.butbp_bw = butbp_bw;
                resultados_clasicos.palp_z = palp_z;
                resultados_clasicos.Wc_bp = Wc_bp;
                resultados_clasicos.Bw_bp = Bw_bp;
                resultados_clasicos.Rs = rs * palp_z;
                resultados_clasicos.RL = RL * palp_z;
                
                % Butterworth
                Lbu_serie_t_bp = Lbu_t / Bw_bp; Cbu_serie_t_bp = Bw_bp ./ (Lbu_t * Wc_bp^2);
                Lbu_paralelo_t_bp = Bw_bp ./ (Cbu_t * Wc_bp^2); Cbu_paralelo_t_bp = Cbu_t / Bw_bp;
                Lbu_serie_pi_bp = Lbu_pi / Bw_bp; Cbu_serie_pi_bp = Bw_bp ./ (Lbu_pi * Wc_bp^2);
                Lbu_paralelo_pi_bp = Bw_bp ./ (Cbu_pi * Wc_bp^2); Cbu_paralelo_pi_bp = Cbu_pi / Bw_bp;
                
                resultados_clasicos.butter.L_serie_t = round(palp_z * Lbu_serie_t_bp, 6);
                resultados_clasicos.butter.C_serie_t = round((1/palp_z) * Cbu_serie_t_bp, 6);
                resultados_clasicos.butter.L_paralelo_t = round(palp_z * Lbu_paralelo_t_bp, 6);
                resultados_clasicos.butter.C_paralelo_t = round((1/palp_z) * Cbu_paralelo_t_bp, 6);
                resultados_clasicos.butter.L_serie_pi = round(palp_z * Lbu_serie_pi_bp, 6);
                resultados_clasicos.butter.C_serie_pi = round((1/palp_z) * Cbu_serie_pi_bp, 6);
                resultados_clasicos.butter.L_paralelo_pi = round(palp_z * Lbu_paralelo_pi_bp, 6);
                resultados_clasicos.butter.C_paralelo_pi = round((1/palp_z) * Cbu_paralelo_pi_bp, 6);
                
                % Chebyshev I
                Lch1_serie_t_bp = Lch1_t / Bw_bp; Cch1_serie_t_bp = Bw_bp ./ (Lch1_t * Wc_bp^2);
                Lch1_paralelo_t_bp = Bw_bp ./ (Cch1_t * Wc_bp^2); Cch1_paralelo_t_bp = Cch1_t / Bw_bp;
                Lch1_serie_pi_bp = Lch1_pi / Bw_bp; Cch1_serie_pi_bp = Bw_bp ./ (Lch1_pi * Wc_bp^2);
                Lch1_paralelo_pi_bp = Bw_bp ./ (Cch1_pi * Wc_bp^2); Cch1_paralelo_pi_bp = Cch1_pi / Bw_bp;
                
                resultados_clasicos.cheby1.L_serie_t = round(palp_z * Lch1_serie_t_bp, 6);
                resultados_clasicos.cheby1.C_serie_t = round((1/palp_z) * Cch1_serie_t_bp, 6);
                resultados_clasicos.cheby1.L_paralelo_t = round(palp_z * Lch1_paralelo_t_bp, 6);
                resultados_clasicos.cheby1.C_paralelo_t = round((1/palp_z) * Cch1_paralelo_t_bp, 6);
                resultados_clasicos.cheby1.L_serie_pi = round(palp_z * Lch1_serie_pi_bp, 6);
                resultados_clasicos.cheby1.C_serie_pi = round((1/palp_z) * Cch1_serie_pi_bp, 6);
                resultados_clasicos.cheby1.L_paralelo_pi = round(palp_z * Lch1_paralelo_pi_bp, 6);
                resultados_clasicos.cheby1.C_paralelo_pi = round((1/palp_z) * Cch1_paralelo_pi_bp, 6);
                
                % Chebyshev II
                Lch2_serie_t_bp = Lch2_t / Bw_bp; Cch2_serie_t_bp = Bw_bp ./ (Lch2_t * Wc_bp^2);
                Lch2_paralelo_t_bp = Bw_bp ./ (Cch2_t * Wc_bp^2); Cch2_paralelo_t_bp = Cch2_t / Bw_bp;
                Lch2_serie_pi_bp = Lch2_pi / Bw_bp; Cch2_serie_pi_bp = Bw_bp ./ (Lch2_pi * Wc_bp^2);
                Lch2_paralelo_pi_bp = Bw_bp ./ (Cch2_pi * Wc_bp^2); Cch2_paralelo_pi_bp = Cch2_pi / Bw_bp;
                
                resultados_clasicos.cheby2.L_serie_t = round(palp_z * Lch2_serie_t_bp, 6);
                resultados_clasicos.cheby2.C_serie_t = round((1/palp_z) * Cch2_serie_t_bp, 6);
                resultados_clasicos.cheby2.L_paralelo_t = round(palp_z * Lch2_paralelo_t_bp, 6);
                resultados_clasicos.cheby2.C_paralelo_t = round((1/palp_z) * Cch2_paralelo_t_bp, 6);
                resultados_clasicos.cheby2.L_serie_pi = round(palp_z * Lch2_serie_pi_bp, 6);
                resultados_clasicos.cheby2.C_serie_pi = round((1/palp_z) * Cch2_serie_pi_bp, 6);
                resultados_clasicos.cheby2.L_paralelo_pi = round(palp_z * Lch2_paralelo_pi_bp, 6);
                resultados_clasicos.cheby2.C_paralelo_pi = round((1/palp_z) * Cch2_paralelo_pi_bp, 6);
                
                % Elíptico
                Le_serie_t_bp = Le_t / Bw_bp; Ce_serie_t_bp = Bw_bp ./ (Le_t * Wc_bp^2);
                Le_paralelo_t_bp = Bw_bp ./ (Ce_t * Wc_bp^2); Ce_paralelo_t_bp = Ce_t / Bw_bp;
                Le_serie_pi_bp = Le_pi / Bw_bp; Ce_serie_pi_bp = Bw_bp ./ (Le_pi * Wc_bp^2);
                Le_paralelo_pi_bp = Bw_bp ./ (Ce_pi * Wc_bp^2); Ce_paralelo_pi_bp = Ce_pi / Bw_bp;
                
                resultados_clasicos.ellip.L_serie_t = round(palp_z * Le_serie_t_bp, 6);
                resultados_clasicos.ellip.C_serie_t = round((1/palp_z) * Ce_serie_t_bp, 6);
                resultados_clasicos.ellip.L_paralelo_t = round(palp_z * Le_paralelo_t_bp, 6);
                resultados_clasicos.ellip.C_paralelo_t = round((1/palp_z) * Ce_paralelo_t_bp, 6);
                resultados_clasicos.ellip.L_serie_pi = round(palp_z * Le_serie_pi_bp, 6);
                resultados_clasicos.ellip.C_serie_pi = round((1/palp_z) * Ce_serie_pi_bp, 6);
                resultados_clasicos.ellip.L_paralelo_pi = round(palp_z * Le_paralelo_pi_bp, 6);
                resultados_clasicos.ellip.C_paralelo_pi = round((1/palp_z) * Ce_paralelo_pi_bp, 6);
                
            % ----- BANDA ELIMINADA -----
            case 'bs'
                butbs_frec = param_adicional(1);
                butbs_bw = param_adicional(2);
                Wc_bs = sqrt((2*pi*butbs_frec) * (2*pi*butbs_bw));
                Bw_bs = (2*pi*butbs_bw) - (2*pi*butbs_frec);
                resultados_clasicos.tipo = 'banda_eliminada';
                resultados_clasicos.butbs_frec = butbs_frec;
                resultados_clasicos.butbs_bw = butbs_bw;
                resultados_clasicos.Wc_bs = Wc_bs;
                resultados_clasicos.Bw_bs = Bw_bs;
                resultados_clasicos.Rs = rs;
                resultados_clasicos.RL = RL;
                
                % Butterworth
                resultados_clasicos.butter.L_paralelo_t = round(Lbu_t * (Bw_bs / (Wc_bs^2)), 6);
                resultados_clasicos.butter.C_paralelo_t = round(1 ./ (Lbu_t * Bw_bs), 6);
                resultados_clasicos.butter.L_serie_t = round(1 ./ (Cbu_t * Bw_bs), 6);
                resultados_clasicos.butter.C_serie_t = round(Cbu_t * (Bw_bs / (Wc_bs^2)), 6);
                resultados_clasicos.butter.L_paralelo_pi = round(Lbu_pi * (Bw_bs / (Wc_bs^2)), 6);
                resultados_clasicos.butter.C_paralelo_pi = round(1 ./ (Lbu_pi * Bw_bs), 6);
                resultados_clasicos.butter.L_serie_pi = round(1 ./ (Cbu_pi * Bw_bs), 6);
                resultados_clasicos.butter.C_serie_pi = round(Cbu_pi * (Bw_bs / (Wc_bs^2)), 6);
                
                % Chebyshev I
                resultados_clasicos.cheby1.L_paralelo_t = round(Lch1_t * (Bw_bs / (Wc_bs^2)), 6);
                resultados_clasicos.cheby1.C_paralelo_t = round(1 ./ (Lch1_t * Bw_bs), 6);
                resultados_clasicos.cheby1.L_serie_t = round(1 ./ (Cch1_t * Bw_bs), 6);
                resultados_clasicos.cheby1.C_serie_t = round(Cch1_t * (Bw_bs / (Wc_bs^2)), 6);
                resultados_clasicos.cheby1.L_paralelo_pi = round(Lch1_pi * (Bw_bs / (Wc_bs^2)), 6);
                resultados_clasicos.cheby1.C_paralelo_pi = round(1 ./ (Lch1_pi * Bw_bs), 6);
                resultados_clasicos.cheby1.L_serie_pi = round(1 ./ (Cch1_pi * Bw_bs), 6);
                resultados_clasicos.cheby1.C_serie_pi = round(Cch1_pi * (Bw_bs / (Wc_bs^2)), 6);
                
                % Chebyshev II
                resultados_clasicos.cheby2.L_paralelo_t = round(Lch2_t * (Bw_bs / (Wc_bs^2)), 6);
                resultados_clasicos.cheby2.C_paralelo_t = round(1 ./ (Lch2_t * Bw_bs), 6);
                resultados_clasicos.cheby2.L_serie_t = round(1 ./ (Cch2_t * Bw_bs), 6);
                resultados_clasicos.cheby2.C_serie_t = round(Cch2_t * (Bw_bs / (Wc_bs^2)), 6);
                resultados_clasicos.cheby2.L_paralelo_pi = round(Lch2_pi * (Bw_bs / (Wc_bs^2)), 6);
                resultados_clasicos.cheby2.C_paralelo_pi = round(1 ./ (Lch2_pi * Bw_bs), 6);
                resultados_clasicos.cheby2.L_serie_pi = round(1 ./ (Cch2_pi * Bw_bs), 6);
                resultados_clasicos.cheby2.C_serie_pi = round(Cch2_pi * (Bw_bs / (Wc_bs^2)), 6);
                
                % Elíptico
                resultados_clasicos.ellip.L_paralelo_t = round(Le_t * (Bw_bs / (Wc_bs^2)), 6);
                resultados_clasicos.ellip.C_paralelo_t = round(1 ./ (Le_t * Bw_bs), 6);
                resultados_clasicos.ellip.L_serie_t = round(1 ./ (Ce_t * Bw_bs), 6);
                resultados_clasicos.ellip.C_serie_t = round(Ce_t * (Bw_bs / (Wc_bs^2)), 6);
                resultados_clasicos.ellip.L_paralelo_pi = round(Le_pi * (Bw_bs / (Wc_bs^2)), 6);
                resultados_clasicos.ellip.C_paralelo_pi = round(1 ./ (Le_pi * Bw_bs), 6);
                resultados_clasicos.ellip.L_serie_pi = round(1 ./ (Ce_pi * Bw_bs), 6);
                resultados_clasicos.ellip.C_serie_pi = round(Ce_pi * (Bw_bs / (Wc_bs^2)), 6);
                
            % ----- BANDA ELIMINADA + IMPEDANCIA -----
            case 'bsz'
                butbs_frec = param_adicional(1);
                butbs_bw = param_adicional(2);
                palp_z = param_adicional(3);
                Wc_bs = sqrt((2*pi*butbs_frec) * (2*pi*butbs_bw));
                Bw_bs = (2*pi*butbs_bw) - (2*pi*butbs_frec);
                resultados_clasicos.tipo = 'banda_eliminada+impedancia';
                resultados_clasicos.butbs_frec = butbs_frec;
                resultados_clasicos.butbs_bw = butbs_bw;
                resultados_clasicos.palp_z = palp_z;
                resultados_clasicos.Wc_bs = Wc_bs;
                resultados_clasicos.Bw_bs = Bw_bs;
                resultados_clasicos.Rs = rs * palp_z;
                resultados_clasicos.RL = RL * palp_z;
                
                % Butterworth
                Lbu_paralelo_t_bs = Lbu_t * (Bw_bs / (Wc_bs^2));
                Cbu_paralelo_t_bs = 1 ./ (Lbu_t * Bw_bs);
                Lbu_serie_t_bs = 1 ./ (Cbu_t * Bw_bs);
                Cbu_serie_t_bs = Cbu_t * (Bw_bs / (Wc_bs^2));
                Lbu_paralelo_pi_bs = Lbu_pi * (Bw_bs / (Wc_bs^2));
                Cbu_paralelo_pi_bs = 1 ./ (Lbu_pi * Bw_bs);
                Lbu_serie_pi_bs = 1 ./ (Cbu_pi * Bw_bs);
                Cbu_serie_pi_bs = Cbu_pi * (Bw_bs / (Wc_bs^2));
                
                resultados_clasicos.butter.L_paralelo_t = round(palp_z * Lbu_paralelo_t_bs, 6);
                resultados_clasicos.butter.C_paralelo_t = round((1/palp_z) * Cbu_paralelo_t_bs, 6);
                resultados_clasicos.butter.L_serie_t = round(palp_z * Lbu_serie_t_bs, 6);
                resultados_clasicos.butter.C_serie_t = round((1/palp_z) * Cbu_serie_t_bs, 6);
                resultados_clasicos.butter.L_paralelo_pi = round(palp_z * Lbu_paralelo_pi_bs, 6);
                resultados_clasicos.butter.C_paralelo_pi = round((1/palp_z) * Cbu_paralelo_pi_bs, 6);
                resultados_clasicos.butter.L_serie_pi = round(palp_z * Lbu_serie_pi_bs, 6);
                resultados_clasicos.butter.C_serie_pi = round((1/palp_z) * Cbu_serie_pi_bs, 6);
                
                % Chebyshev I
                Lch1_paralelo_t_bs = Lch1_t * (Bw_bs / (Wc_bs^2));
                Cch1_paralelo_t_bs = 1 ./ (Lch1_t * Bw_bs);
                Lch1_serie_t_bs = 1 ./ (Cch1_t * Bw_bs);
                Cch1_serie_t_bs = Cch1_t * (Bw_bs / (Wc_bs^2));
                Lch1_paralelo_pi_bs = Lch1_pi * (Bw_bs / (Wc_bs^2));
                Cch1_paralelo_pi_bs = 1 ./ (Lch1_pi * Bw_bs);
                Lch1_serie_pi_bs = 1 ./ (Cch1_pi * Bw_bs);
                Cch1_serie_pi_bs = Cch1_pi * (Bw_bs / (Wc_bs^2));
                
                resultados_clasicos.cheby1.L_paralelo_t = round(palp_z * Lch1_paralelo_t_bs, 6);
                resultados_clasicos.cheby1.C_paralelo_t = round((1/palp_z) * Cch1_paralelo_t_bs, 6);
                resultados_clasicos.cheby1.L_serie_t = round(palp_z * Lch1_serie_t_bs, 6);
                resultados_clasicos.cheby1.C_serie_t = round((1/palp_z) * Cch1_serie_t_bs, 6);
                resultados_clasicos.cheby1.L_paralelo_pi = round(palp_z * Lch1_paralelo_pi_bs, 6);
                resultados_clasicos.cheby1.C_paralelo_pi = round((1/palp_z) * Cch1_paralelo_pi_bs, 6);
                resultados_clasicos.cheby1.L_serie_pi = round(palp_z * Lch1_serie_pi_bs, 6);
                resultados_clasicos.cheby1.C_serie_pi = round((1/palp_z) * Cch1_serie_pi_bs, 6);
                
                % Chebyshev II
                Lch2_paralelo_t_bs = Lch2_t * (Bw_bs / (Wc_bs^2));
                Cch2_paralelo_t_bs = 1 ./ (Lch2_t * Bw_bs);
                Lch2_serie_t_bs = 1 ./ (Cch2_t * Bw_bs);
                Cch2_serie_t_bs = Cch2_t * (Bw_bs / (Wc_bs^2));
                Lch2_paralelo_pi_bs = Lch2_pi * (Bw_bs / (Wc_bs^2));
                Cch2_paralelo_pi_bs = 1 ./ (Lch2_pi * Bw_bs);
                Lch2_serie_pi_bs = 1 ./ (Cch2_pi * Bw_bs);
                Cch2_serie_pi_bs = Cch2_pi * (Bw_bs / (Wc_bs^2));
                
                resultados_clasicos.cheby2.L_paralelo_t = round(palp_z * Lch2_paralelo_t_bs, 6);
                resultados_clasicos.cheby2.C_paralelo_t = round((1/palp_z) * Cch2_paralelo_t_bs, 6);
                resultados_clasicos.cheby2.L_serie_t = round(palp_z * Lch2_serie_t_bs, 6);
                resultados_clasicos.cheby2.C_serie_t = round((1/palp_z) * Cch2_serie_t_bs, 6);
                resultados_clasicos.cheby2.L_paralelo_pi = round(palp_z * Lch2_paralelo_pi_bs, 6);
                resultados_clasicos.cheby2.C_paralelo_pi = round((1/palp_z) * Cch2_paralelo_pi_bs, 6);
                resultados_clasicos.cheby2.L_serie_pi = round(palp_z * Lch2_serie_pi_bs, 6);
                resultados_clasicos.cheby2.C_serie_pi = round((1/palp_z) * Cch2_serie_pi_bs, 6);
                
                % Elíptico
                Le_paralelo_t_bs = Le_t * (Bw_bs / (Wc_bs^2));
                Ce_paralelo_t_bs = 1 ./ (Le_t * Bw_bs);
                Le_serie_t_bs = 1 ./ (Ce_t * Bw_bs);
                Ce_serie_t_bs = Ce_t * (Bw_bs / (Wc_bs^2));
                Le_paralelo_pi_bs = Le_pi * (Bw_bs / (Wc_bs^2));
                Ce_paralelo_pi_bs = 1 ./ (Le_pi * Bw_bs);
                Le_serie_pi_bs = 1 ./ (Ce_pi * Bw_bs);
                Ce_serie_pi_bs = Ce_pi * (Bw_bs / (Wc_bs^2));
                
                resultados_clasicos.ellip.L_paralelo_t = round(palp_z * Le_paralelo_t_bs, 6);
                resultados_clasicos.ellip.C_paralelo_t = round((1/palp_z) * Ce_paralelo_t_bs, 6);
                resultados_clasicos.ellip.L_serie_t = round(palp_z * Le_serie_t_bs, 6);
                resultados_clasicos.ellip.C_serie_t = round((1/palp_z) * Ce_serie_t_bs, 6);
                resultados_clasicos.ellip.L_paralelo_pi = round(palp_z * Le_paralelo_pi_bs, 6);
                resultados_clasicos.ellip.C_paralelo_pi = round((1/palp_z) * Ce_paralelo_pi_bs, 6);
                resultados_clasicos.ellip.L_serie_pi = round(palp_z * Le_serie_pi_bs, 6);
                resultados_clasicos.ellip.C_serie_pi = round((1/palp_z) * Ce_serie_pi_bs, 6);
        end
    end
    
    % =========================================
    % PARTE 5: TRANSFORMACIONES PARA FILTROS PASCAL REAL
    % =========================================
    
    if strcmp(caso_pascal, 'real') && any(strcmp(tipo_filtro, {'opt_bp', 'opt_br'})) && ~isempty(npa)
        
        switch lower(tipo_transformacion)
            % ----- FRECUENCIA PASCAL -----
            case 'f'
                palp_frec = param_adicional;
                Wn = 2 * pi * palp_frec;
                resultados_pascal_transform.tipo = 'frecuencia';
                resultados_pascal_transform.palp_frec = palp_frec;
                resultados_pascal_transform.Wn = Wn;
                resultados_pascal_transform.Rs = rs;
                resultados_pascal_transform.RL = RL;
                
                if strcmp(tipo_filtro, 'opt_bp')
                    L_t_f = indpa / Wn; C_t_f = capa / Wn;
                    L_pi_f = indpa_pi / Wn; C_pi_f = capa_pi / Wn;
                else
                    L_t_f = indpabr / Wn; C_t_f = capabr / Wn;
                    L_pi_f = indpa_pibr / Wn; C_pi_f = capa_pibr / Wn;
                end
                resultados_pascal_transform.L_t = round(L_t_f, 6);
                resultados_pascal_transform.C_t = round(C_t_f, 6);
                resultados_pascal_transform.L_pi = round(L_pi_f, 6);
                resultados_pascal_transform.C_pi = round(C_pi_f, 6);
                resultados_pascal_transform.orden_red = npa;
                
            % ----- IMPEDANCIA PASCAL -----
            case 'z'
                palp_z = param_adicional;
                resultados_pascal_transform.tipo = 'impedancia';
                resultados_pascal_transform.palp_z = palp_z;
                resultados_pascal_transform.Rs = rs * palp_z;
                resultados_pascal_transform.RL = RL * palp_z;
                
                if strcmp(tipo_filtro, 'opt_bp')
                    L_t_z = palp_z * indpa; C_t_z = (1/palp_z) * capa;
                    L_pi_z = palp_z * indpa_pi; C_pi_z = (1/palp_z) * capa_pi;
                else
                    L_t_z = palp_z * indpabr; C_t_z = (1/palp_z) * capabr;
                    L_pi_z = palp_z * indpa_pibr; C_pi_z = (1/palp_z) * capa_pibr;
                end
                resultados_pascal_transform.L_t = round(L_t_z, 6);
                resultados_pascal_transform.C_t = round(C_t_z, 6);
                resultados_pascal_transform.L_pi = round(L_pi_z, 6);
                resultados_pascal_transform.C_pi = round(C_pi_z, 6);
                resultados_pascal_transform.orden_red = npa;
                
            % ----- FRECUENCIA + IMPEDANCIA PASCAL -----
            case 'fz'
                palp_frec = param_adicional(1);
                palp_z = param_adicional(2);
                Wn = 2 * pi * palp_frec;
                resultados_pascal_transform.tipo = 'frecuencia+impedancia';
                resultados_pascal_transform.palp_frec = palp_frec;
                resultados_pascal_transform.palp_z = palp_z;
                resultados_pascal_transform.Wn = Wn;
                resultados_pascal_transform.Rs = rs * palp_z;
                resultados_pascal_transform.RL = RL * palp_z;
                
                if strcmp(tipo_filtro, 'opt_bp')
                    L_t_f = indpa / Wn; C_t_f = capa / Wn;
                    L_pi_f = indpa_pi / Wn; C_pi_f = capa_pi / Wn;
                else
                    L_t_f = indpabr / Wn; C_t_f = capabr / Wn;
                    L_pi_f = indpa_pibr / Wn; C_pi_f = capa_pibr / Wn;
                end
                resultados_pascal_transform.L_t = round(palp_z * L_t_f, 6);
                resultados_pascal_transform.C_t = round((1/palp_z) * C_t_f, 6);
                resultados_pascal_transform.L_pi = round(palp_z * L_pi_f, 6);
                resultados_pascal_transform.C_pi = round((1/palp_z) * C_pi_f, 6);
                resultados_pascal_transform.orden_red = npa;
                
            % ----- PASAALTAS PASCAL -----
            case 'hp'
                pahp_frec = param_adicional;
                Wc_hp = 2 * pi * pahp_frec;
                resultados_pascal_transform.tipo = 'pasaaltas';
                resultados_pascal_transform.pahp_frec = pahp_frec;
                resultados_pascal_transform.Wc_hp = Wc_hp;
                resultados_pascal_transform.Rs = rs;
                resultados_pascal_transform.RL = RL;
                
                if strcmp(tipo_filtro, 'opt_bp')
                    C_t_hp = 1 ./ (indpa * Wc_hp); L_t_hp = 1 ./ (capa * Wc_hp);
                    C_pi_hp = 1 ./ (indpa_pi * Wc_hp); L_pi_hp = 1 ./ (capa_pi * Wc_hp);
                else
                    C_t_hp = 1 ./ (indpabr * Wc_hp); L_t_hp = 1 ./ (capabr * Wc_hp);
                    C_pi_hp = 1 ./ (indpa_pibr * Wc_hp); L_pi_hp = 1 ./ (capa_pibr * Wc_hp);
                end
                resultados_pascal_transform.C_t = round(C_t_hp, 6);
                resultados_pascal_transform.L_t = round(L_t_hp, 6);
                resultados_pascal_transform.C_pi = round(C_pi_hp, 6);
                resultados_pascal_transform.L_pi = round(L_pi_hp, 6);
                resultados_pascal_transform.orden_red = npa;
                
            % ----- PASAALTAS + IMPEDANCIA PASCAL -----
            case 'hpz'
                pahp_frec = param_adicional(1);
                palp_z = param_adicional(2);
                Wc_hp = 2 * pi * pahp_frec;
                resultados_pascal_transform.tipo = 'pasaaltas+impedancia';
                resultados_pascal_transform.pahp_frec = pahp_frec;
                resultados_pascal_transform.palp_z = palp_z;
                resultados_pascal_transform.Wc_hp = Wc_hp;
                resultados_pascal_transform.Rs = rs * palp_z;
                resultados_pascal_transform.RL = RL * palp_z;
                
                if strcmp(tipo_filtro, 'opt_bp')
                    C_t_hp = 1 ./ (indpa * Wc_hp); L_t_hp = 1 ./ (capa * Wc_hp);
                    C_pi_hp = 1 ./ (indpa_pi * Wc_hp); L_pi_hp = 1 ./ (capa_pi * Wc_hp);
                else
                    C_t_hp = 1 ./ (indpabr * Wc_hp); L_t_hp = 1 ./ (capabr * Wc_hp);
                    C_pi_hp = 1 ./ (indpa_pibr * Wc_hp); L_pi_hp = 1 ./ (capa_pibr * Wc_hp);
                end
                resultados_pascal_transform.C_t = round(palp_z * C_t_hp, 6);
                resultados_pascal_transform.L_t = round(palp_z * L_t_hp, 6);
                resultados_pascal_transform.C_pi = round(palp_z * C_pi_hp, 6);
                resultados_pascal_transform.L_pi = round(palp_z * L_pi_hp, 6);
                resultados_pascal_transform.orden_red = npa;
                
            % ----- PASABANDA PASCAL -----
            case 'bp'
                pabp_frec = param_adicional(1);
                pabp_bw = param_adicional(2);
                Wc_bp = sqrt((2*pi*pabp_frec) * (2*pi*pabp_bw));
                Bw_bp = (2*pi*pabp_bw) - (2*pi*pabp_frec);
                resultados_pascal_transform.tipo = 'pasabanda';
                resultados_pascal_transform.pabp_frec = pabp_frec;
                resultados_pascal_transform.pabp_bw = pabp_bw;
                resultados_pascal_transform.Wc_bp = Wc_bp;
                resultados_pascal_transform.Bw_bp = Bw_bp;
                resultados_pascal_transform.Rs = rs;
                resultados_pascal_transform.RL = RL;
                
                if strcmp(tipo_filtro, 'opt_bp')
                    L_serie_t_bp = indpa / Bw_bp; C_serie_t_bp = Bw_bp ./ (indpa * Wc_bp^2);
                    L_paralelo_t_bp = Bw_bp ./ (capa * Wc_bp^2); C_paralelo_t_bp = capa / Bw_bp;
                    L_serie_pi_bp = indpa_pi / Bw_bp; C_serie_pi_bp = Bw_bp ./ (indpa_pi * Wc_bp^2);
                    L_paralelo_pi_bp = Bw_bp ./ (capa_pi * Wc_bp^2); C_paralelo_pi_bp = capa_pi / Bw_bp;
                else
                    L_serie_t_bp = indpabr / Bw_bp; C_serie_t_bp = Bw_bp ./ (indpabr * Wc_bp^2);
                    L_paralelo_t_bp = Bw_bp ./ (capabr * Wc_bp^2); C_paralelo_t_bp = capabr / Bw_bp;
                    L_serie_pi_bp = indpa_pibr / Bw_bp; C_serie_pi_bp = Bw_bp ./ (indpa_pibr * Wc_bp^2);
                    L_paralelo_pi_bp = Bw_bp ./ (capa_pibr * Wc_bp^2); C_paralelo_pi_bp = capa_pibr / Bw_bp;
                end
                resultados_pascal_transform.L_serie_t = round(L_serie_t_bp, 6);
                resultados_pascal_transform.C_serie_t = round(C_serie_t_bp, 6);
                resultados_pascal_transform.L_paralelo_t = round(L_paralelo_t_bp, 6);
                resultados_pascal_transform.C_paralelo_t = round(C_paralelo_t_bp, 6);
                resultados_pascal_transform.L_serie_pi = round(L_serie_pi_bp, 6);
                resultados_pascal_transform.C_serie_pi = round(C_serie_pi_bp, 6);
                resultados_pascal_transform.L_paralelo_pi = round(L_paralelo_pi_bp, 6);
                resultados_pascal_transform.C_paralelo_pi = round(C_paralelo_pi_bp, 6);
                resultados_pascal_transform.orden_red = npa;
                
            % ----- PASABANDA + IMPEDANCIA PASCAL -----
            case 'bpz'
                pabp_frec = param_adicional(1);
                pabp_bw = param_adicional(2);
                palp_z = param_adicional(3);
                Wc_bp = sqrt((2*pi*pabp_frec) * (2*pi*pabp_bw));
                Bw_bp = (2*pi*pabp_bw) - (2*pi*pabp_frec);
                resultados_pascal_transform.tipo = 'pasabanda+impedancia';
                resultados_pascal_transform.pabp_frec = pabp_frec;
                resultados_pascal_transform.pabp_bw = pabp_bw;
                resultados_pascal_transform.palp_z = palp_z;
                resultados_pascal_transform.Wc_bp = Wc_bp;
                resultados_pascal_transform.Bw_bp = Bw_bp;
                resultados_pascal_transform.Rs = rs * palp_z;
                resultados_pascal_transform.RL = RL * palp_z;
                
                if strcmp(tipo_filtro, 'opt_bp')
                    L_serie_t_bp = indpa / Bw_bp; C_serie_t_bp = Bw_bp ./ (indpa * Wc_bp^2);
                    L_paralelo_t_bp = Bw_bp ./ (capa * Wc_bp^2); C_paralelo_t_bp = capa / Bw_bp;
                    L_serie_pi_bp = indpa_pi / Bw_bp; C_serie_pi_bp = Bw_bp ./ (indpa_pi * Wc_bp^2);
                    L_paralelo_pi_bp = Bw_bp ./ (capa_pi * Wc_bp^2); C_paralelo_pi_bp = capa_pi / Bw_bp;
                else
                    L_serie_t_bp = indpabr / Bw_bp; C_serie_t_bp = Bw_bp ./ (indpabr * Wc_bp^2);
                    L_paralelo_t_bp = Bw_bp ./ (capabr * Wc_bp^2); C_paralelo_t_bp = capabr / Bw_bp;
                    L_serie_pi_bp = indpa_pibr / Bw_bp; C_serie_pi_bp = Bw_bp ./ (indpa_pibr * Wc_bp^2);
                    L_paralelo_pi_bp = Bw_bp ./ (capa_pibr * Wc_bp^2); C_paralelo_pi_bp = capa_pibr / Bw_bp;
                end
                resultados_pascal_transform.L_serie_t = round(palp_z * L_serie_t_bp, 6);
                resultados_pascal_transform.C_serie_t = round((1/palp_z) * C_serie_t_bp, 6);
                resultados_pascal_transform.L_paralelo_t = round(palp_z * L_paralelo_t_bp, 6);
                resultados_pascal_transform.C_paralelo_t = round((1/palp_z) * C_paralelo_t_bp, 6);
                resultados_pascal_transform.L_serie_pi = round(palp_z * L_serie_pi_bp, 6);
                resultados_pascal_transform.C_serie_pi = round((1/palp_z) * C_serie_pi_bp, 6);
                resultados_pascal_transform.L_paralelo_pi = round(palp_z * L_paralelo_pi_bp, 6);
                resultados_pascal_transform.C_paralelo_pi = round((1/palp_z) * C_paralelo_pi_bp, 6);
                resultados_pascal_transform.orden_red = npa;
                
            % ----- BANDA ELIMINADA PASCAL -----
            case 'bs'
                pabs_frec = param_adicional(1);
                pabs_bw = param_adicional(2);
                Wc_bs = sqrt((2*pi*pabs_frec) * (2*pi*pabs_bw));
                Bw_bs = (2*pi*pabs_bw) - (2*pi*pabs_frec);
                resultados_pascal_transform.tipo = 'banda_eliminada';
                resultados_pascal_transform.pabs_frec = pabs_frec;
                resultados_pascal_transform.pabs_bw = pabs_bw;
                resultados_pascal_transform.Wc_bs = Wc_bs;
                resultados_pascal_transform.Bw_bs = Bw_bs;
                resultados_pascal_transform.Rs = rs;
                resultados_pascal_transform.RL = RL;
                
                if strcmp(tipo_filtro, 'opt_bp')
                    L_paralelo_t_bs = indpa * (Bw_bs / (Wc_bs^2));
                    C_paralelo_t_bs = 1 ./ (indpa * Bw_bs);
                    L_serie_t_bs = 1 ./ (capa * Bw_bs);
                    C_serie_t_bs = capa * (Bw_bs / (Wc_bs^2));
                    L_paralelo_pi_bs = indpa_pi * (Bw_bs / (Wc_bs^2));
                    C_paralelo_pi_bs = 1 ./ (indpa_pi * Bw_bs);
                    L_serie_pi_bs = 1 ./ (capa_pi * Bw_bs);
                    C_serie_pi_bs = capa_pi * (Bw_bs / (Wc_bs^2));
                else
                    L_paralelo_t_bs = indpabr * (Bw_bs / (Wc_bs^2));
                    C_paralelo_t_bs = 1 ./ (indpabr * Bw_bs);
                    L_serie_t_bs = 1 ./ (capabr * Bw_bs);
                    C_serie_t_bs = capabr * (Bw_bs / (Wc_bs^2));
                    L_paralelo_pi_bs = indpa_pibr * (Bw_bs / (Wc_bs^2));
                    C_paralelo_pi_bs = 1 ./ (indpa_pibr * Bw_bs);
                    L_serie_pi_bs = 1 ./ (capa_pibr * Bw_bs);
                    C_serie_pi_bs = capa_pibr * (Bw_bs / (Wc_bs^2));
                end
                resultados_pascal_transform.L_paralelo_t = round(L_paralelo_t_bs, 6);
                resultados_pascal_transform.C_paralelo_t = round(C_paralelo_t_bs, 6);
                resultados_pascal_transform.L_serie_t = round(L_serie_t_bs, 6);
                resultados_pascal_transform.C_serie_t = round(C_serie_t_bs, 6);
                resultados_pascal_transform.L_paralelo_pi = round(L_paralelo_pi_bs, 6);
                resultados_pascal_transform.C_paralelo_pi = round(C_paralelo_pi_bs, 6);
                resultados_pascal_transform.L_serie_pi = round(L_serie_pi_bs, 6);
                resultados_pascal_transform.C_serie_pi = round(C_serie_pi_bs, 6);
                resultados_pascal_transform.orden_red = npa;
                
            % ----- BANDA ELIMINADA + IMPEDANCIA PASCAL -----
            case 'bsz'
                pabs_frec = param_adicional(1);
                pabs_bw = param_adicional(2);
                palp_z = param_adicional(3);
                Wc_bs = sqrt((2*pi*pabs_frec) * (2*pi*pabs_bw));
                Bw_bs = (2*pi*pabs_bw) - (2*pi*pabs_frec);
                resultados_pascal_transform.tipo = 'banda_eliminada+impedancia';
                resultados_pascal_transform.pabs_frec = pabs_frec;
                resultados_pascal_transform.pabs_bw = pabs_bw;
                resultados_pascal_transform.palp_z = palp_z;
                resultados_pascal_transform.Wc_bs = Wc_bs;
                resultados_pascal_transform.Bw_bs = Bw_bs;
                resultados_pascal_transform.Rs = rs * palp_z;
                resultados_pascal_transform.RL = RL * palp_z;
                
                if strcmp(tipo_filtro, 'opt_bp')
                    L_paralelo_t_bs = indpa * (Bw_bs / (Wc_bs^2));
                    C_paralelo_t_bs = 1 ./ (indpa * Bw_bs);
                    L_serie_t_bs = 1 ./ (capa * Bw_bs);
                    C_serie_t_bs = capa * (Bw_bs / (Wc_bs^2));
                    L_paralelo_pi_bs = indpa_pi * (Bw_bs / (Wc_bs^2));
                    C_paralelo_pi_bs = 1 ./ (indpa_pi * Bw_bs);
                    L_serie_pi_bs = 1 ./ (capa_pi * Bw_bs);
                    C_serie_pi_bs = capa_pi * (Bw_bs / (Wc_bs^2));
                else
                    L_paralelo_t_bs = indpabr * (Bw_bs / (Wc_bs^2));
                    C_paralelo_t_bs = 1 ./ (indpabr * Bw_bs);
                    L_serie_t_bs = 1 ./ (capabr * Bw_bs);
                    C_serie_t_bs = capabr * (Bw_bs / (Wc_bs^2));
                    L_paralelo_pi_bs = indpa_pibr * (Bw_bs / (Wc_bs^2));
                    C_paralelo_pi_bs = 1 ./ (indpa_pibr * Bw_bs);
                    L_serie_pi_bs = 1 ./ (capa_pibr * Bw_bs);
                    C_serie_pi_bs = capa_pibr * (Bw_bs / (Wc_bs^2));
                end
                resultados_pascal_transform.L_paralelo_t = round(palp_z * L_paralelo_t_bs, 6);
                resultados_pascal_transform.C_paralelo_t = round((1/palp_z) * C_paralelo_t_bs, 6);
                resultados_pascal_transform.L_serie_t = round(palp_z * L_serie_t_bs, 6);
                resultados_pascal_transform.C_serie_t = round((1/palp_z) * C_serie_t_bs, 6);
                resultados_pascal_transform.L_paralelo_pi = round(palp_z * L_paralelo_pi_bs, 6);
                resultados_pascal_transform.C_paralelo_pi = round((1/palp_z) * C_paralelo_pi_bs, 6);
                resultados_pascal_transform.L_serie_pi = round(palp_z * L_serie_pi_bs, 6);
                resultados_pascal_transform.C_serie_pi = round((1/palp_z) * C_serie_pi_bs, 6);
                resultados_pascal_transform.orden_red = npa;
        end
    end
    
    % =========================================
    % PARTE 6: RESULTADOS COMPLETOS
    % =========================================
    resultados = struct();
    
    % Órdenes clásicos (solo si existen)
    if ~isempty(nb), resultados.nb = nb; end
    if ~isempty(nch1), resultados.nch1 = nch1; end
    if ~isempty(nch2), resultados.nch2 = nch2; end
    if ~isempty(ne), resultados.ne = ne; end
    
    % Funciones de transferencia clásicas (solo si existen)
    if ~isempty(sys_b), resultados.sys_b = sys_b; end
    if ~isempty(sys_c1), resultados.sys_c1 = sys_c1; end
    if ~isempty(sys_c2), resultados.sys_c2 = sys_c2; end
    if ~isempty(sys_e), resultados.sys_e = sys_e; end
    
    % Redes clásicas originales (solo si existen)
    if ~isempty(Lbu_t), resultados.Lbu_t = Lbu_t; end
    if ~isempty(Cbu_t), resultados.Cbu_t = Cbu_t; end
    if ~isempty(Lbu_pi), resultados.Lbu_pi = Lbu_pi; end
    if ~isempty(Cbu_pi), resultados.Cbu_pi = Cbu_pi; end
    if ~isempty(Lch1_t), resultados.Lch1_t = Lch1_t; end
    if ~isempty(Cch1_t), resultados.Cch1_t = Cch1_t; end
    if ~isempty(Lch1_pi), resultados.Lch1_pi = Lch1_pi; end
    if ~isempty(Cch1_pi), resultados.Cch1_pi = Cch1_pi; end
    if ~isempty(Lch2_t), resultados.Lch2_t = Lch2_t; end
    if ~isempty(Cch2_t), resultados.Cch2_t = Cch2_t; end
    if ~isempty(Lch2_pi), resultados.Lch2_pi = Lch2_pi; end
    if ~isempty(Cch2_pi), resultados.Cch2_pi = Cch2_pi; end
    if ~isempty(Le_t), resultados.Le_t = Le_t; end
    if ~isempty(Ce_t), resultados.Ce_t = Ce_t; end
    if ~isempty(Le_pi), resultados.Le_pi = Le_pi; end
    if ~isempty(Ce_pi), resultados.Ce_pi = Ce_pi; end
    
    % Resultados de transformaciones clásicas
    if ~isempty(fieldnames(resultados_clasicos))
        resultados.transformaciones_clasicas = resultados_clasicos;
    end
    
    % Resultados Pascal base
    if ~isempty(fieldnames(resultados_pascal))
        resultados.pascal = resultados_pascal;
    end
    
    % Resultados de transformaciones Pascal
    if ~isempty(fieldnames(resultados_pascal_transform))
        resultados.pascal_transform = resultados_pascal_transform;
    end
end