function testStability(filename, params)
    if (nargin < 2)
        params = struct;
    end

    model = "test_stability_link_auto";

    SampleTime = fieldOrDefault(params, "sampleTime", 0.0001);
    endTime = fieldOrDefault(params, "endTime", 20);
    startAnalyseTime = fieldOrDefault(params, "startAnalyseTime", 5);
    numSim = fieldOrDefault(params, "numSim", 1);
    NoisePwr = fieldOrDefault(params, "noisePwr", 0);
    nbParallelSim = fieldOrDefault(params, "nbParallelSim", 200);


    Iapp_vec = fieldOrDefault(params, "Iapp_vec", -2:2:2);
    gsm_vec = fieldOrDefault(params, "gsm_vec", -6:2:-2);
    gup_vec = fieldOrDefault(params, "gup_vec", 3:2:7);

    rflx_gain = fieldOrDefault(params, "rflx_gain", 1);
    maximum_torque = fieldOrDefault(params, "max_torque", 10);

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
    
    load_system(model)

    Mean_Cycle = zeros(length(Iapp_vec), length(gsm_vec), length(gup_vec)); 
    Var_Cycle = zeros(length(Iapp_vec), length(gsm_vec), length(gup_vec)); 
    Range_Cycle = zeros(length(Iapp_vec), length(gsm_vec), length(gup_vec)); 
    
    i = 0;
    pos = zeros(nbParallelSim, 3);
    for x = 1:length(Iapp_vec)
        IApp = Iapp_vec(x);
        for y = 1:length(gsm_vec)
            Gsm = gsm_vec(y);
            for z = 1:length(gup_vec)
                Gup = gup_vec(z);
                for s = 1:numSim
                    i = i + 1;
                    pos(i,:) = [x, y, z];
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
                    sim_tmp = setVariable(sim_tmp, "rflx_g", rflx_gain);
                    sim_tmp = setVariable(sim_tmp, "max_torque", maximum_torque);
                    sim_tmp = setVariable(sim_tmp, "noisePwr", NoisePwr);
                    sim_tmp = setVariable(sim_tmp, "sampleTime", SampleTime);

                    sim_tmp = setModelParameter(sim_tmp, "StopTime", num2str(endTime));

                    sim_tmp = setPostSimFcn(sim_tmp, @(o) (postProcessing(o, startAnalyseTime)));

                    sim_in(i) = sim_tmp;

                    if (i == nbParallelSim)
                        i = 0;
                        out = parsim(sim_in);
                        for j = 1:nbParallelSim
                            p = pos(j,:);
                            Mean_Cycle(p(1), p(2), p(3)) = Mean_Cycle(p(1), p(2), p(3)) + out(j).average;
                            Var_Cycle(p(1), p(2), p(3)) = Var_Cycle(p(1), p(2), p(3)) + out(j).variance;
                            Range_Cycle(p(1), p(2), p(3)) = Range_Cycle(p(1), p(2), p(3)) + out(j).range;
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
            Mean_Cycle(p(1), p(2), p(3)) = Mean_Cycle(p(1), p(2), p(3)) + out(j).average;
            Var_Cycle(p(1), p(2), p(3)) = Var_Cycle(p(1), p(2), p(3)) + out(j).variance;
            Range_Cycle(p(1), p(2), p(3)) = Range_Cycle(p(1), p(2), p(3)) + out(j).range;
        end
    end

    Mean_Cycle = Mean_Cycle/numSim;
    Var_Cycle = Var_Cycle/numSim;
    Range_Cycle = Range_Cycle/numSim;

    save(filename, "Mean_Cycle", "Var_Cycle", "Range_Cycle", "Iapp_vec", "gsm_vec", "gup_vec", "params");
end


function newout = postProcessing(o, startAnalyseTime)
    useful = find(o.angle.time >= startAnalyseTime);
    T = o.angle.time(useful);
    theta = squeeze(o.angle.signals.values(1, 1, useful));
    [average, variance, range] = compute_frequency_mean_variance(T, theta);
    newout = struct("average", average, "variance", variance, "range", range);
end

function [average, variance, range] = compute_frequency_mean_variance(T, theta)
    crossings = zeros(length(T), 1);
    median = (max(theta)+min(theta))/2;
    prev = theta(1) - median;
    c_index = 1;
    for i = 2:length(T)
        curr = theta(i) - median;
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
    
    nb_cycle = idivide(int64(length(crossings)-1), int64(2), 'floor');
    cycle_freq = zeros(nb_cycle, 1);
    for i = 1:nb_cycle
        % A cycle is 2 crossings (1 up and 1 down)
        cycle_freq(i) = 1/(crossings(2*i + 1) - crossings(2*i - 1));
    end
    
    if nb_cycle > 0
        average = mean(cycle_freq);
        variance = var(cycle_freq);
    else
        average = nan;
        variance = nan;
    end
    range = max(theta) - min(theta);
end

function ret = fieldOrDefault(s, field, default)
    if (isfield(s, field))
        ret = getfield(s, field);
    else
        ret = default;
    end
end