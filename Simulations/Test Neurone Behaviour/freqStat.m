function freqStat(params)
    if (nargin < 1)
        params = struct;
    end

    sampleTime = fieldOrDefault(params, "sampleTime", 0.0001);
    endTime = fieldOrDefault(params, "endTime", 20);
    startAnalyseTime = fieldOrDefault(params, "startAnalyseTime", 5);
    
    gfm = fieldOrDefault(params, "gfm", -2);
    gsp = fieldOrDefault(params, "gsp", 6);
    gsm = fieldOrDefault(params, "gsm", -4);
    gup = fieldOrDefault(params, "gup", 5);
    dfm = fieldOrDefault(params, "dfm", 0.0);
    dsp = fieldOrDefault(params, "dsp", 0.5);
    dsm = fieldOrDefault(params, "dsm", -0.5);
    dup = fieldOrDefault(params, "dup", -0.5);
    Iapp_val = fieldOrDefault(params, "Iapp", -1);
    

    % Start of code
    time = 0:sampleTime:endTime;
    time = time';
    
    %{
    Iapp = zeros(size(time));
    t_step_1 = find(time > 15);
    t1 = t_step_1(1);
    t_step_2 = find(time > 18);
    t2 = t_step_2(1);

    Iapp(:) = Iapp_val;
    for i = t1:t2
        Iapp(i) = Iapp_val+2;
    end
    %}

    Iapp = timeseries(Iapp_val, time);

    model = "test_behaviour_auto";
    load_system(model)

    sim_in = Simulink.SimulationInput(model);

    sim_in = setVariable(sim_in, "gfm", gfm);
    sim_in = setVariable(sim_in, "gsp", gsp);
    sim_in = setVariable(sim_in, "gsm", gsm);
    sim_in = setVariable(sim_in, "gup", gup);
    sim_in = setVariable(sim_in, "dfm", dfm);
    sim_in = setVariable(sim_in, "dsp", dsp);
    sim_in = setVariable(sim_in, "dsm", dsm);
    sim_in = setVariable(sim_in, "dup", dup);
    sim_in = setExternalInput(sim_in, Iapp);

    out = sim(sim_in);
    useful = find(out.tout >= startAnalyseTime);
    T = out.tout(useful);
    V = out.V.signals.values(useful, 1);

    figure
    plot(T, V)

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

        figure
        histogram(cross_sep, length(cross_sep));
        
        x_f = randn(length(cross_sep), 1);

        ax = axes(figure, 'NextPlot', 'add', 'XColor', 'none');
        scatter(ax, x_f, cross_sep);
        xlim(ax, ax.XLim + [-0.1 0.1]*range(ax.XLim));
        ax.XAxis.Visible = 'off'; % remove x-axis
        plot(ax, ax.XLim, [mean(cross_sep), mean(cross_sep)] + std(cross_sep));

        figure
        id = kmeans(cross_sep, 2);
        gscatter(x_f, cross_sep, id);

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
            d_burst = nan;
            f_burst = nan;
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
            d_burst = mean(d);
            f_burst = mean(f); 
        end
    else
        d_burst = -1;
        f_burst = -1;
    end

    disp("d_burst = "+d_burst);
    disp("f_burst = "+f_burst);
end

function ret = fieldOrDefault(s, field, default)
    if (isfield(s, field))
        ret = getfield(s, field);
    else
        ret = default;
    end
end