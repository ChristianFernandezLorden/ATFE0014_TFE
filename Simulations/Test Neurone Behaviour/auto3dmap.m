
function auto3dmap(filename, params)
    if (nargin < 2)
        params = struct;
    end
    
    
    SampleTime = fieldOrDefault(params, "sampleTime", 0.0001);
    endTime = fieldOrDefault(params, "endTime", 20);
    startAnalyseTime = fieldOrDefault(params, "startAnalyseTime", 5);
    numSim = fieldOrDefault(params, "numSim", 1);
    NoisePwr = fieldOrDefault(params, "noisePwr", 0);
    nbParallelSim = fieldOrDefault(params, "nbParallelSim", 200);
    
    %Iapp_vec = -2:0.2:2;
    %gsm_vec = -7:0.1:0;
    %gup_vec = 1:0.1:9;
    Iapp_vec = fieldOrDefault(params, "Iapp_vec", -2:2:2);
    gsm_vec = fieldOrDefault(params, "gsm_vec", -6:2:-2);
    gup_vec = fieldOrDefault(params, "gup_vec", 3:2:7);

    gfm_ref = -2;
    gsp_ref = 6;
    gsm_ref = -4;
    gup_ref = 5;
    dfm_ref = 0.0;
    dsp_ref = 0.5;
    dsm_ref = -0.5;
    dup_ref = -0.5;
    
    
    model = "test_behaviour_auto_cst_current";
    
    Gfm = gfm_ref;
    Gsp = gsp_ref;
    Gsm = gsm_ref;
    Gup = gup_ref;
    Dfm = dfm_ref;
    Dsp = dsp_ref;
    Dsm = dsm_ref;
    Dup = dup_ref;
    
    
    F_Burst = zeros(length(Iapp_vec), length(gsm_vec), length(gup_vec), numSim); % Frequency of burst
    D_Burst = zeros(length(Iapp_vec), length(gsm_vec), length(gup_vec), numSim); % Duty cycle of burst


    load_system(model)
    
    i = 0;
    pos = zeros(nbParallelSim, 4);
    for x = 1:length(Iapp_vec)
        IApp = Iapp_vec(x);
        for y = 1:length(gsm_vec)
            Gsm = gsm_vec(y);
            for z = 1:length(gup_vec)
                Gup = gup_vec(z);
                for s = 1:numSim
                    i = i + 1;
                    pos(i,:) = [x, y, z, s];

                    sim_tmp = Simulink.SimulationInput(model);

                    sim_tmp = setVariable(sim_tmp, "gfm", Gfm);
                    sim_tmp = setVariable(sim_tmp, "gsp", Gsp);
                    sim_tmp = setVariable(sim_tmp, "gsm", Gsm);
                    sim_tmp = setVariable(sim_tmp, "gup", Gup);
                    sim_tmp = setVariable(sim_tmp, "dfm", Dfm);
                    sim_tmp = setVariable(sim_tmp, "dsp", Dsp);
                    sim_tmp = setVariable(sim_tmp, "dsm", Dsm);
                    sim_tmp = setVariable(sim_tmp, "dup", Dup);
                    sim_tmp = setVariable(sim_tmp, "Iapp", IApp);
                    sim_tmp = setVariable(sim_tmp, "noisePwr", NoisePwr);
                    sim_tmp = setVariable(sim_tmp, "sampleTime", SampleTime);

                    sim_tmp = setModelParameter(sim_tmp, "StopTime", num2str(endTime));

                    sim_tmp = setPostSimFcn(sim_tmp, @(o) (postProcessing(o, startAnalyseTime)));

                    %sim_in(i) = setModelParameter(sim_in(i), 'SaveOutput', 'on');

                    sim_in(i) = sim_tmp;

                    if (i == nbParallelSim)
                        i = 0;
                        out = parsim(sim_in);
                        for j = 1:nbParallelSim
                            p = pos(j,:);
                            F_Burst(p(1), p(2), p(3), p(4)) = out(j).f;
                            D_Burst(p(1), p(2), p(3), p(4)) = out(j).d;
                        end
                        clear sim_in;
                    end
                end
            end
        end
    end
    
    if i > 0
        sim_in = sim_in(1:i);
        out = parsim(sim_in);
        for j = 1:i
            p = pos(j,:);
            F_Burst(p(1), p(2), p(3), p(4)) = out(j).f;
            D_Burst(p(1), p(2), p(3), p(4)) = out(j).d;
        end
    end

    F_Burst_average = mean(F_Burst, 4);
    D_Burst_average = mean(D_Burst, 4);
    F_Burst_stddev = std(F_Burst, 0, 4);
    D_Burst_stddev = std(D_Burst, 0, 4);
    
    save(filename, "F_Burst", "D_Burst", "F_Burst_average", "D_Burst_average", "F_Burst_stddev", "D_Burst_stddev", "Iapp_vec", "gsm_vec", "gup_vec", "params");
    
    Disp3DMap(F_Burst_average, Iapp_vec, gsm_vec, gup_vec, 1);
end


function ret = fieldOrDefault(s, field, default)
    if (isfield(s, field))
        ret = getfield(s, field);
    else
        ret = default;
    end
end

function newout = postProcessing(o, startAnalyseTime)
    useful = find(o.V.time >= startAnalyseTime);
    T = o.V.time(useful);
    V = o.V.signals.values(useful, 1);
    [f, d] = compute_frequency_duty_cycle_old(T, V);
    newout = struct("f", f, "d", d);
end



function [F, D] = compute_frequency_duty_cycle(T, V)
    %%% Compute crossing times

    prev = V(1);
    crossings = zeros(length(T), 1);
    c_index = 1;
    for i = 2:length(T)
        curr = V(i);
        if prev*curr < 0
            % Linear interpolation
            t_prev = T(i-1);
            t_curr = T(i);
            t_inter = (t_prev*curr - t_curr*prev) / (curr - prev);
            crossings(c_index) = t_inter;
            c_index = c_index + 1;
        end
        prev = curr;
    end
    crossings = crossings(1:c_index-1);

    
    %%% If not enough crossings, no freq nor duty cycle
    if (~isempty(crossings) && length(crossings) > 2)
        cross_sep = zeros(length(crossings)-1, 1);
        prev = crossings(1);
        for i = 1:length(cross_sep)
            curr = crossings(i+1);
            cross_sep(i) = curr - prev;
            prev = curr;
        end

        id = kmeans(cross_sep, 2);

        if mean(cross_sep(id == 1)) > mean(cross_sep(id == 2)) 
            inter_bursts = id==1;
        else
            inter_bursts = id==2;
        end
        
        l_cross_sep = length(inter_bursts);

        i = 1;
        invalid = 0;
        curr_num = 0;
        num = -1;
        first_num = 0;
        while i <= l_cross_sep && inter_bursts(i)
            i = i + 1;
            first_num = first_num + 1;
        end
        while i <= l_cross_sep
            if inter_bursts(i)
                curr_num = curr_num + 1;
            elseif curr_num > 0
                if num < 0
                    num = curr_num;
                elseif num ~= curr_num
                    invalid = 1;
                end
                curr_num = 0;
            end
            i = i + 1;
        end
        
        i = 1;
        if first_num > 0 && first_num ~= num
            while i<= l_cross_sep && inter_bursts(i)
                i = i + 1;
            end
        end
        
        while i <= l_cross_sep && ~inter_bursts(i)
            i = i + 1;
        end

        if (i > length(cross_sep)-num || (invalid == 1) || num < 0)
            D = nan;
            F = nan;
        else
            d = zeros(length(cross_sep)-i+1, 1);
            f = zeros(length(cross_sep)-i+1, 1);
            
            inter_time =  cross_sep(i);
            total_time = inter_time;
            while i <= l_cross_sep && inter_bursts(i) 
                total_time = total_time + cross_sep(i);
                i = i+1;
            end

            index = 1;
            j = i+1;
            while j <= l_cross_sep
                if inter_bursts(j)
                    d(index) = (total_time - inter_time)/total_time;
                    f(index) = 1/total_time;
                    index = index + 1;
                    
                    inter_time = cross_sep(j);
                    total_time = inter_time;
                    j = j+1;
                    while j <= l_cross_sep && inter_bursts(j)
                        total_time = total_time + cross_sep(j);
                        j = j+1;
                    end
                else
                    total_time = total_time + cross_sep(j);
                    j = j+1;
                end
            end
            
            d = d(1:index-1);
            f = f(1:index-1);
            D = mean(d);
            F = mean(f); 
        end
    else
        D = nan;
        F = nan;
    end
end


function [F, D] = compute_frequency_duty_cycle_old(T, V)
    prev = V(1);
    crossings = zeros(length(T), 1);
    c_index = 1;
    for i = 2:length(T)
        curr = V(i);
        if prev*curr < 0
            % Linear interpolation
            t_prev = T(i-1);
            t_curr = T(i);
            t_inter = (t_prev*curr - t_curr*prev) / (curr - prev);
            crossings(c_index) = t_inter;
            c_index = c_index + 1;
        end
        prev = curr;
    end
    crossings = crossings(1:c_index-1);

    if (~isempty(crossings) && length(crossings) > 2)
        cross_sep = zeros(length(crossings)-1, 1);
        prev = crossings(1);
        for i = 1:length(cross_sep)
            curr = crossings(i+1);
            cross_sep(i) = curr - prev;
            prev = curr;
        end
        
        id = kmeans(cross_sep, 2);

        if mean(cross_sep(find(id == 1))) > mean(cross_sep(find(id == 2))) 
            inter_bursts = id==1;
        else
            inter_bursts = id==2;
        end

        i = 1;

        if ~inter_bursts(1) && ~inter_bursts(2)
        end

        while ~inter_bursts(i) && i <= length(cross_sep) 
            i = i + 1;
        end

        if (i > length(cross_sep))
            D = nan;
            F = nan;
        else
            d = zeros(length(cross_sep)-i+1, 1);
            f = zeros(length(cross_sep)-i+1, 1);

            inter_time = cross_sep(i);
            total_time = cross_sep(i);
            index = 1;

            for j = i+1:length(cross_sep)
                if inter_bursts(j)
                    d(index) = (total_time - inter_time)/total_time;
                    f(index) = 1/total_time;
                    index = index + 1;

                    inter_time = cross_sep(j);
                    total_time = inter_time;
                else
                    total_time = total_time + cross_sep(j);
                end
            end
            
            d = d(1:index-1);
            f = f(1:index-1);
            D = mean(d);
            F = mean(f); 
        end
    else
        D = nan;
        F = nan;
    end
end
