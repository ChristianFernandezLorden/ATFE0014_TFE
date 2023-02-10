
function auto3dmap(filename, map_params)
    if (nargin < 2)
        map_params = struct;
    end
    
    sampleTime = fieldOrDefault(map_params, "sampleTime", 0.0001);
    endTime = fieldOrDefault(map_params, "endTime", 20);
    startAnalyseTime = fieldOrDefault(map_params, "startAnalyseTime", 5);
    numSim = fieldOrDefault(map_params, "numSim", 1);
    noisePwr = fieldOrDefault(map_params, "noisePwr", 0);

    nbParallelSim = fieldOrDefault(map_params, "nbParallelSim", 200);
    
    %Iapp_vec = -2:0.2:2;
    %gsm_vec = -7:0.1:0;
    %gup_vec = 1:0.1:9;
    Iapp_vec = fieldOrDefault(map_params, "Iapp_vec", -2:2:2);
    gsm_vec = fieldOrDefault(map_params, "gsm_vec", -6:2:-2);
    gup_vec = fieldOrDefault(map_params, "gsm_vec", 3:2:7);

    gfm_ref = -2;
    gsp_ref = 6;
    gsm_ref = -4;
    gup_ref = 5;
    dfm_ref = 0.0;
    dsp_ref = 0.5;
    dsm_ref = -0.5;
    dup_ref = -0.5;
    
    % Start of code
    time = 0:sampleTime:endTime;
    time = time';
    
    model = "test_behaviour_auto";
    
    gfm = gfm_ref;
    gsp = gsp_ref;
    gsm = gsm_ref;
    gup = gup_ref;
    dfm = dfm_ref;
    dsp = dsp_ref;
    dsm = dsm_ref;
    dup = dup_ref;
    
    
    F_Burst = zeros(length(Iapp_vec), length(gsm_vec), length(gup_vec)); % Frequency of burst
    D_Burst = zeros(length(Iapp_vec), length(gsm_vec), length(gup_vec)); % Duty cycle of burst


    load_system(model)
    
    i = 0;
    pos = zeros(nbParallelSim, 3);
    for x = 1:length(Iapp_vec)
        Iapp = timeseries(Iapp_vec(x), time);
        for y = 1:length(gsm_vec)
            
            gsm = gsm_vec(y);
            for z = 1:length(gup_vec)
                gup = gup_vec(z);
                for s = 1:numSim
                    i = i + 1;
                    sim_in(i) = Simulink.SimulationInput(model);
                    sim_in(i) = setVariable(sim_in(i), "gfm", gfm);
                    sim_in(i) = setVariable(sim_in(i), "gsp", gsp);
                    sim_in(i) = setVariable(sim_in(i), "gsm", gsm);
                    sim_in(i) = setVariable(sim_in(i), "gup", gup);
                    sim_in(i) = setVariable(sim_in(i), "dfm", dfm);
                    sim_in(i) = setVariable(sim_in(i), "dsp", dsp);
                    sim_in(i) = setVariable(sim_in(i), "dsm", dsm);
                    sim_in(i) = setVariable(sim_in(i), "dup", dup);
                    sim_in(i) = setVariable(sim_in(i), "noisePwr", noisePwr);
                    sim_in(i) = setExternalInput(sim_in(i), Iapp);
                    sim_in(i) = setPostSimFcn(sim_in(i), @(o) (postProcessing(o, startAnalyseTime)));
                    sim_in(i) = setModelParameter(sim_in(i), 'SaveOutput', 'on');
                    pos(i,:) = [x, y, z];
                    if (i == nbParallelSim)
                        i = 0;
                        out = parsim(sim_in);
                        for j = 1:nbParallelSim
                            out_j = out(j);
                            disp(out_j.ErrorMessage);
                            %{
                            useful = find(out_j.tout >= startAnalyseTime);
                            T = out_j.tout(useful);
                            V = out_j.V.signals.values(useful, 1);
                            [f, d] = compute_frequency_duty_cycle(T, V);
                            %}
                            p = pos(i,:);
                            F_Burst(p) = F_Burst(p) + out_j.f;
                            D_Burst(p) = D_Burst(p) + out_j.d;
                        end
                    end
                end
            end
        end
    end
    o = sim(sim_in(1));
    disp(o);
    disp(o.f);
    disp(o.d);
    %{
    if i > 0
        sim_in = sim_in(1:i);
        out = parsim(sim_in);
        for j = 1:i
            out_j = out(j);
            p = pos(i,:);
            F_Burst(p) = F_Burst(p) + out(j).f;
            D_Burst(p) = D_Burst(p) + out(j).d;
            disp("f = "+out_j.f+", d = "+out_j.d)
        end
    end
    %}

    F_Burst = F_Burst/numSim;
    D_Burst = D_Burst/numSim;
    
    save(filename, "F_Burst", "D_Burst", "Iapp_vec", "gsm_vec", "gup_vec")
    
    Disp3DMap(F_Burst, Iapp_vec, gsm_vec, gup_vec, 1);
end


function ret = fieldOrDefault(s, field, default)
    if (isfield(s, field))
        ret = getfield(s, field);
    else
        ret = default;
    end
end

function newout = postProcessing(o, startAnalyseTime)
    useful = find(o.tout >= startAnalyseTime);
    T = o.tout(useful);
    V = o.V.signals.values(useful, 1);
    [f, d] = compute_frequency_duty_cycle(T, V);
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
            disp("here2")
            disp("invalid = "+invalid)
            disp("num ="+num)
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
                    
                    inter_time =  cross_sep(j);
                    total_time = inter_time;
                    j = j+1;
                    while j <= l_cross_sep && inter_bursts(j)
                        total_time = total_time + cross_sep(j);
                        j = j+1;
                    end
                    j = j-1;
                else
                    total_time = total_time + cross_sep(j);
                end
                j = j+1;
            end
            
            d = d(1:index-1);
            f = f(1:index-1);
            D = mean(d);
            F = mean(f); 
        end
    else
        disp("here")
        D = nan;
        F = nan;
    end
end
