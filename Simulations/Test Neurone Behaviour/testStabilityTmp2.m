function testStabilityTmp2(filename, params)
    if (nargin < 2)
        params = struct;
    end

    model = "test_stability_link_auto_neuron_sense";

    SampleTime = fieldOrDefault(params, "sampleTime", 0.0001);
    endTime = fieldOrDefault(params, "endTime", 20);
    startAnalyseTime = fieldOrDefault(params, "startAnalyseTime", 5);
    numSim = fieldOrDefault(params, "numSim", 1);
    NoisePwr = fieldOrDefault(params, "noisePwr", 0);
    nbParallelSim = fieldOrDefault(params, "nbParallelSim", 200);


    Iapp_vec = fieldOrDefault(params, "Iapp_vec", -2:2:2);
    gsm_vec = fieldOrDefault(params, "gsm_vec", -6:2:-2);
    gup_vec = fieldOrDefault(params, "gup_vec", 3:2:7);
    rflx_vec = fieldOrDefault(params, "rflx_vec", 0:2.5:5);
    torque_vec = fieldOrDefault(params, "torque_vec", 2:4:10);

    %rflx_gain = fieldOrDefault(params, "rflx_gain", 1);
    %maximum_torque = fieldOrDefault(params, "max_torque", 10);

    gfm_ref = -2;
    gsp_ref = 6;
    gsm_ref = -4;
    gup_ref = 5;
    dfm_ref = 0.0;
    dsp_ref = 0.5;
    dsm_ref = -0.5;
    dup_ref = -0.5;

    Gfm = gfm_ref;
    Gsp = gsp_ref;
    Gsm = gsm_ref;
    Gup = gup_ref;
    Dfm = dfm_ref;
    Dsp = dsp_ref;
    Dsm = dsm_ref;
    Dup = dup_ref;

    IApp_s = 0;
    Gfm_s = -1.5;
    %% Balance between Gsp and Gsm (at the equilibrium point)
    Gsp_s = 6;
    Gsm_s = -4;
    Gup_s = 0;
    Dfm_s = 0.0;
    Dsp_s = 0.5;
    Dsm_s = -0.5;
    Dup_s = -0.5;

    Gsyn_s = 1.5;
    Dsyn_s = -0.5;
    
    load_system(model)

    Mean_Freq_s = zeros(length(Iapp_vec), length(gsm_vec), length(gup_vec), length(rflx_vec), length(torque_vec)); 
    Var_Freq_s = zeros(length(Iapp_vec), length(gsm_vec), length(gup_vec), length(rflx_vec), length(torque_vec)); 
    Mean_Range = zeros(length(Iapp_vec), length(gsm_vec), length(gup_vec), length(rflx_vec), length(torque_vec)); 
    Var_Range = zeros(length(Iapp_vec), length(gsm_vec), length(gup_vec), length(rflx_vec), length(torque_vec)); 
    Mean_Freq_f = zeros(length(Iapp_vec), length(gsm_vec), length(gup_vec), length(rflx_vec), length(torque_vec)); 
    Var_Freq_f = zeros(length(Iapp_vec), length(gsm_vec), length(gup_vec), length(rflx_vec), length(torque_vec)); 
    
    i = 0;
    pos = zeros(nbParallelSim, 5);
    for x = 1:length(Iapp_vec)
        IApp = Iapp_vec(x);
        for y = 1:length(gsm_vec)
            Gsm = gsm_vec(y);
            for z = 1:length(gup_vec)
                Gup = gup_vec(z);
                for k = 1:length(rflx_vec)
                    rflx_gain = rflx_vec(k);
                    for l = 1:length(torque_vec)
                        maximum_torque = torque_vec(l);
                        for s = 1:numSim
                            i = i + 1;
                            pos(i,:) = [x, y, z, k, l];
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

                            sim_tmp = setVariable(sim_tmp, "gfm_s", Gfm_s);
                            sim_tmp = setVariable(sim_tmp, "gsp_s", Gsp_s);
                            sim_tmp = setVariable(sim_tmp, "gsm_s", Gsm_s);
                            sim_tmp = setVariable(sim_tmp, "gup_s", Gup_s);
                            sim_tmp = setVariable(sim_tmp, "dfm_s", Dfm_s);
                            sim_tmp = setVariable(sim_tmp, "dsp_s", Dsp_s);
                            sim_tmp = setVariable(sim_tmp, "dsm_s", Dsm_s);
                            sim_tmp = setVariable(sim_tmp, "dup_s", Dup_s);
                            sim_tmp = setVariable(sim_tmp, "Iapp_s", IApp_s);

                            sim_tmp = setVariable(sim_tmp, "gsyn_s", Gsyn_s);
                            sim_tmp = setVariable(sim_tmp, "dsyn_s", Dsyn_s);

                            sim_tmp = setVariable(sim_tmp, "rflx_g", rflx_gain);
                            sim_tmp = setVariable(sim_tmp, "max_torque", maximum_torque);
                            sim_tmp = setVariable(sim_tmp, "noisePwr", NoisePwr);
                            sim_tmp = setVariable(sim_tmp, "sampleTime", SampleTime);
        
                            sim_tmp = setModelParameter(sim_tmp, "StopTime", num2str(endTime));
        
                            sim_tmp = setPostSimFcn(sim_tmp, @(o) (postProcessingBoth(o, startAnalyseTime)));
        
                            sim_in(i) = sim_tmp;

                            %sim(sim_in(i));
        
                            if (i == nbParallelSim)
                                i = 0;
                                out = parsim(sim_in);
                                for j = 1:nbParallelSim
                                    p = pos(j,:);
                                    Mean_Freq_s(p(1), p(2), p(3), p(4), p(5)) = Mean_Freq_s(p(1), p(2), p(3), p(4), p(5)) + out(j).freq_average_s;
                                    Var_Freq_s(p(1), p(2), p(3), p(4), p(5)) = Var_Freq_s(p(1), p(2), p(3), p(4), p(5)) + out(j).freq_variance_s;
                                    Mean_Range(p(1), p(2), p(3), p(4), p(5)) = Mean_Range(p(1), p(2), p(3), p(4), p(5)) + out(j).range_average;
                                    Var_Range(p(1), p(2), p(3), p(4), p(5)) = Var_Range(p(1), p(2), p(3), p(4), p(5)) + out(j).range_variance;
                                    Mean_Freq_f(p(1), p(2), p(3), p(4), p(5)) = Mean_Freq_f(p(1), p(2), p(3), p(4), p(5)) + out(j).freq_average_f;
                                    Var_Freq_f(p(1), p(2), p(3), p(4), p(5)) = Var_Freq_f(p(1), p(2), p(3), p(4), p(5)) + out(j).freq_variance_f;
                                end
                            end
                        end
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
            Mean_Freq_s(p(1), p(2), p(3), p(4), p(5)) = Mean_Freq_s(p(1), p(2), p(3), p(4), p(5)) + out(j).freq_average_s;
            Var_Freq_s(p(1), p(2), p(3), p(4), p(5)) = Var_Freq_s(p(1), p(2), p(3), p(4), p(5)) + out(j).freq_variance_s;
            Mean_Range(p(1), p(2), p(3), p(4), p(5)) = Mean_Range(p(1), p(2), p(3), p(4), p(5)) + out(j).range_average;
            Var_Range(p(1), p(2), p(3), p(4), p(5)) = Var_Range(p(1), p(2), p(3), p(4), p(5)) + out(j).range_variance;
            Mean_Freq_f(p(1), p(2), p(3), p(4), p(5)) = Mean_Freq_f(p(1), p(2), p(3), p(4), p(5)) + out(j).freq_average_f;
            Var_Freq_f(p(1), p(2), p(3), p(4), p(5)) = Var_Freq_f(p(1), p(2), p(3), p(4), p(5)) + out(j).freq_variance_f;
        end
    end

    Mean_Freq_s = Mean_Freq_s./numSim;
    Var_Freq_s = Var_Freq_s./numSim;
    Mean_Range = Mean_Range./numSim;
    Var_Range = Var_Range./numSim;
    Mean_Freq_f = Mean_Freq_f./numSim;
    Var_Freq_f = Var_Freq_f./numSim;

    save(filename, "Mean_Freq_s", "Var_Freq_s", "Mean_Range", "Var_Range", "Mean_Freq_f", "Var_Freq_f", ...
         "Iapp_vec", "gsm_vec", "gup_vec", "rflx_vec", "torque_vec", "params");
end

function newout = postProcessingBoth(o, startAnalyseTime)
    useful = find(o.angle.time >= startAnalyseTime);
    T = o.angle.time(useful);
    theta = squeeze(o.angle.signals.values(useful, 1));
    theta_p = squeeze(o.angle.signals.values(useful, 2));
    [freq_average_s, freq_variance_s, range_average, range_variance] = compute_frequency_range_mean_variance(T, theta, theta_p);
    [freq_average_f, freq_variance_f] = compute_frequency_descrepency(T, theta);
    newout = struct("freq_average_s", freq_average_s, "freq_variance_s", freq_variance_s, ...
                    "range_average", range_average, "range_variance", range_variance, ...
                    "freq_average_f", freq_average_f, "freq_variance_f", freq_variance_f);
end


function newout = postProcessingSpeed(o, startAnalyseTime)
    useful = find(o.angle.time >= startAnalyseTime);
    T = o.angle.time(useful);
    theta = squeeze(o.angle.signals.values(useful, 1));
    theta_p = squeeze(o.angle.signals.values(useful, 2));
    [freq_average, freq_variance, range_average, range_variance] = compute_frequency_range_mean_variance(T, theta, theta_p);
    clear out
    newout = struct("freq_average", freq_average, "freq_variance", freq_variance, ...
                    "range_average", range_average, "range_variance", range_variance);
end

function [freq_average, freq_variance, range_average, range_variance] = compute_frequency_range_mean_variance(T, theta, theta_p)
    maxs_t = zeros(length(T), 1);
    mins_t = zeros(length(T), 1);
    maxs_val = zeros(length(T), 1);
    mins_val = zeros(length(T), 1);
    prev = theta_p(1) ;
    max_index = 1;
    min_index = 1;
    for i = 2:length(T)
        curr = theta_p(i);
        if prev > 0 && curr < 0 % Minimum
            % Linear interpolation
            t_prev = T(i-1);
            t_curr = T(i);
            t_inter = (t_prev*curr - t_curr*prev) / (curr - prev);
            maxs_t(max_index) = t_inter;
            maxs_val(max_index) = (theta(i)*(t_inter-t_prev) + theta(i-1)*(t_curr-t_inter))/(t_curr-t_prev);
            max_index = max_index + 1;
        elseif prev < 0 && curr > 0 % Maximum
            % Linear interpolation
            t_prev = T(i-1);
            t_curr = T(i);
            t_inter = (t_prev*curr - t_curr*prev) / (curr - prev);
            mins_val(min_index) = (theta(i)*(t_inter-t_prev) + theta(i-1)*(t_curr-t_inter))/(t_curr-t_prev);
            mins_t(min_index) = t_inter;
            min_index = min_index + 1;
        end
        prev = curr;
    end
    maxs_t = maxs_t(1:max_index-1);
    mins_t = mins_t(1:min_index-1);
    maxs_val = maxs_val(1:max_index-1);
    mins_val = mins_val(1:min_index-1);
    

    min_length = min(length(maxs_t), length(mins_t));
    max_length = max(length(maxs_t), length(mins_t));
    nb_cycles = length(maxs_t)-1+length(mins_t)-1;
    
    %{
    if minimum_length >= 1
        max_first = maxs(1) < mins(1);
        cycle_freq = zeros(nb_cycles, 1);
        ranges = zeros(2*minimum_length-1, 1);
        for i = 1:minimum_length
            ranges(2*i - 1) = maxs(i) - mins(i);
            if i > 1
                if max_first
                    ranges(2*(i-1)) = maxs(i) - mins(i-1);
                end
                    ranges(2*(i-1)) = maxs(i-1) - mins(i);
                else
            end
        end
    end
    %}
    if min_length >= 1
        ranges = zeros(min_length+max_length-1, 1);
        ranges(1:min_length) = maxs_val(1:min_length) - mins_val(1:min_length);
        if maxs_t(1) > mins_t(1) % Max happens after ->max(i-1) is before min(i)
            ranges(min_length+1:min_length+max_length-1) = maxs_val(1:max_length-1) - mins_val(2:max_length);
        else % Min happens after ->min(i-1) is before max(i)
            ranges(min_length+1:min_length+max_length-1) = maxs_val(2:max_length) - mins_val(1:max_length-1);
        end
    end

    if length(maxs_t) >= 2
        tmp = maxs_t(2:end) - maxs_t(1:end-1);
        cycle_freq(1:length(maxs_t)-1) = 1./tmp;
    end

    if length(mins_t) >= 2
        tmp = mins_t(2:end) - mins_t(1:end-1);
        cycle_freq(length(maxs_t):length(maxs_t)+length(mins_t)-2) = 1./tmp;
    end
    
    %{
    index = 1;
    if length(maxs) >= 2
        prev_max = 0;
        curr_max = maxs(1);
        for i = 2:length(maxs)
            prev_max = curr_max;
            curr_max = maxs(i);
            cycle_freq(index) = 1/(curr_max - prev_max);
            index = index+1;
        end
    end
    if length(mins) >= 2
        prev_min = 0;
        curr_min = mins(1);
        for i = 2:length(mins)
            prev_min = curr_min;
            curr_min = mins(i);
            cycle_freq(index) = 1/(curr_min - prev_min);
            index = index+1;
        end
    end
    %}
    
    if nb_cycles > 0
        freq_average = mean(cycle_freq);
        freq_variance = var(cycle_freq);
    else
        freq_average = nan;
        freq_variance = nan;
    end

    if min_length > 0
        range_average = mean(ranges);
        range_variance = var(ranges);
    else
        range_average = nan;
        range_variance = nan;
    end
end

function newout = postProcessingFourrier(o, startAnalyseTime)
    useful = find(o.angle.time >= startAnalyseTime);
    T = o.angle.time(useful);
    theta = squeeze(o.angle.signals.values(useful, 1));
    %theta_p = squeeze(o.angle.signals.values(useful, 2));
    [freq_average, freq_variance] = compute_frequency_descrepency(T, theta);
    newout = struct("freq_average", freq_average, "freq_variance", freq_variance, ...
                    "range_average", 0, "range_variance", 0);
end


function [freq_average, freq_variance] = compute_frequency_descrepency(T, theta)
    L = length(T);
    Diff = T(2:end) - T(1:end-1); 
    Fs = 1/(mean(Diff));
    Y = fft(theta);
    P2 = abs(Y/L);
    half_L = floor(L/2);
    P1 = P2(1:half_L+1);
    P1(2:end-1) = 2*P1(2:end-1);
    P1(1) = 0; % Remove 0 Hz (constant) component
    f = Fs*(0:half_L)/L;
    [val, index] = max(P1);
    %P1(index) = 0; % Remove Principal component of the spectrum
    %P1 = P1/(sum(P1));
    freq_average = f(index);

    %var_f = ((f/freq_average) - 1).^2; % Normalized Variance
    %p = var_f.*(P1.^2); % Increase the effect of the shift the farther away the bigger amplitude is
    freq_variance =  val/(sum(P1, 'all'));
end

function ret = fieldOrDefault(s, field, default)
    if (isfield(s, field))
        ret = getfield(s, field);
    else
        ret = default;
    end
end