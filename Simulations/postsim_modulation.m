function newout = postsim_modulation(o, eval_params, params)
    startAnalyseTime = eval_params.StartAnalyseTime;
    desired_amp = params.bar_amp;

    useful = find(o.angle.time >= startAnalyseTime);
    T = o.angle.time(useful);
    theta = squeeze(o.angle.signals.values(useful, 1));
    theta_d = squeeze(o.angle.signals.values(useful, 2));
    spike_down = squeeze(o.voltage.signals.values(useful, 3));
    spike_up = squeeze(o.voltage.signals.values(useful, 4));


    last_cross_down = -1;
    curr = spike_down(1);
    prev = 0;
    for i = 2:length(spike_down)
        prev = curr;
        curr = spike_down(i);
        if prev*curr < 0
            t_prev = T(i-1);
            t_curr = T(i);
            t_inter = (t_prev*curr - t_curr*prev) / (curr - prev);
            last_cross_down = t_inter;
        end
    end

    last_cross_up = -1;
    curr = spike_up(1);
    prev = 0;
    for i = 2:length(spike_up)
        prev = curr;
        curr = spike_up(i);
        if prev*curr < 0
            t_prev = T(i-1);
            t_curr = T(i);
            t_inter = (t_prev*curr - t_curr*prev) / (curr - prev);
            last_cross_up = t_inter;
        end
    end

    last_spike = max(last_cross_down, last_cross_up); % Last time of neuronal activity

    crossings_amp = zeros(length(T), 1);
    crossings_amp_time = zeros(length(T), 1);
    ind = 0;
    curr = theta_d(1);
    prev = 0;
    for i = 2:length(theta_d)
        prev = curr;
        curr = theta_d(i);
        if prev*curr < 0
            ind = ind + 1;
            t_prev = T(i-1);
            t_curr = T(i);
            t_inter = (t_prev*curr - t_curr*prev) / (curr - prev);
            crossings_amp_time(ind) = t_inter;


            crossings_amp(ind) = ( theta(i-1)*(t_inter-t_prev) + theta(i)*(t_curr-t_inter) )/(t_curr-t_prev);
        end
    end
    crossings_amp = abs(crossings_amp(1:ind));
    crossings_amp_time = crossings_amp_time(1:ind);

    if ~isempty(crossings_amp)
    
        first_val = crossings_amp(1);
    
    
        if first_val < desired_amp
            mul = 1;
        else 
            mul = -1;
        end
        
        ind = 1;
        cross_bar_amp = T(end);
        for i = 1:length(crossings_amp)
            if mul*(crossings_amp(i) - desired_amp) > 0
                cross_bar_amp = crossings_amp_time(i);
                ind = i;
                break;
            end
        end
    
    
        if cross_bar_amp < last_spike % Oscillating
            min_time = cross_bar_amp;
    
            cross_amplitude_after = crossings_amp(ind:end);
            amplitude = mean(cross_amplitude_after);
            range = std(cross_amplitude_after);
        else % fixed
            min_time = last_spike;
            
            if crossings_amp_time(end) < last_spike
                amplitude = mean(crossings_amp(crossings_amp_time >=last_spike));
            else
                amplitude = crossings_amp(end);
            end
            range = 0;
        end
    else 
        min_time = 0;
        amplitude = 0;
        range = NaN;
    end

    newout = struct("val", [min_time-startAnalyseTime, amplitude, range]);
end


