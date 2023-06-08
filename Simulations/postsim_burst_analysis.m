function newout = postsim_burst_analysis(o, eval_params, params)
    startAnalyseTime = eval_params.StartAnalyseTime;
    
    useful = find(o.voltage.time >= startAnalyseTime);
    T = o.voltage.time(useful);
    V = o.voltage.signals.values(useful, 1);

    nb_spikes = NaN;
    b_length = NaN;
    intra_freq = NaN;
    inter_freq = NaN;

    prev = V(1);
    crossings = zeros(length(T), 1);
    ind_cross = 0;
    for i = 2:length(T)
        curr = V(i);
        if prev < 0 && curr > 0
            ind_cross = ind_cross + 1;
            % Linear interpolation
            t_prev = T(i-1);
            t_curr = T(i);
            t_inter = (t_prev*curr - t_curr*prev) / (curr - prev);
            crossings(ind_cross) = t_inter;
        end
        prev = curr;
    end
    crossings = crossings(1:ind_cross);
    
    if length(crossings) > 3
        cross_sep = crossings(2:end) - crossings(1:end-1);

        [cross_sep_sort, idx] = sort(cross_sep);
        ind_min = 1;
        num_min = 1;
        sum_min = cross_sep_sort(1);
        ind_max = length(cross_sep_sort);
        sum_max = cross_sep_sort(end);
        num_max = 1;
        while ind_min < ind_max-1
            diff_min = cross_sep_sort(ind_min+1) - sum_min/num_min;
            diff_max = sum_max/num_max - cross_sep_sort(ind_max-1);
            if diff_min < diff_max
                ind_min = ind_min + 1;
                sum_min = sum_min + cross_sep_sort(ind_min);
                num_min = num_min + 1;
            else
                ind_max = ind_max - 1;
                sum_max = sum_max + cross_sep_sort(ind_max);
                num_max = num_max + 1;
            end
        end

        % Criterion of bursting
        if sum_max/num_max > 4*sum_min/num_min
            burst_gaps = zeros(size(cross_sep));
            burst_gaps(idx(ind_max:end)) = 1;
            burst_gaps = logical(burst_gaps);

            % Change scope of V for power computation
            first_gap = find(burst_gaps, 1, 'first');
            T_start = crossings(1) + sum(cross_sep(1:first_gap-1));
            last_gap = find(burst_gaps, 1, 'last');
            T_end = crossings(1) + sum(cross_sep(1:last_gap-1));
            id_start = find(T <= T_start, 1, 'last');
            id_end = find(T <= T_end, 1, 'last') + 1;
            V = V(id_start:id_end);

            bursts_cycle = zeros(sum(burst_gaps, 'all'), 1);
            bursts_size = zeros(sum(burst_gaps, 'all'), 1);
            bursts_nb_spikes = zeros(sum(burst_gaps, 'all'), 1);
            
            ind_start = 0;
            % Find first burting gap to start computation
            for i = 1:length(cross_sep)
                if burst_gaps(i)
                    ind_start = i+1;
                    break;
                end
            end
            ind_burst = 0;
            cumulative_time = 0;
            nb_spike = 0;
            for i = ind_start:length(cross_sep)
                nb_spike = nb_spike+1;
                % When a new bursting gap is found the cycle is done
                if burst_gaps(i)
                    ind_burst = ind_burst+1;
                    bursts_nb_spikes(ind_burst) = nb_spike;
                    bursts_cycle(ind_burst) = cumulative_time + cross_sep(i);
                    bursts_size(ind_burst) = cumulative_time;
                    cumulative_time = 0;
                    nb_spike = 0;
                else
                    cumulative_time = cumulative_time + cross_sep(i);
                end
            end
            bursts_cycle = bursts_cycle(1:ind_burst);
            bursts_size = bursts_size(1:ind_burst);
            bursts_nb_spikes = bursts_nb_spikes(1:ind_burst);

            nb_spikes = mean(bursts_nb_spikes);
            b_length = mean(bursts_size);
            intra_freq = 1/mean(cross_sep(~burst_gaps));
            inter_freq = 1/mean(bursts_cycle);
        else
            T_start = crossings(1);
            T_end = crossings(end);
            id_start = find(T <= T_start, 1, 'last');
            id_end = find(T <= T_end, 1, 'last') + 1;
            V = V(id_start:id_end);
            nb_spikes = 1;
        end
    end

    % Can be computed regardless of 
    power_signal = V;
    power_signal(power_signal < 0.0) = 0.0;
    power = mean(abs(power_signal));

    newout = struct("val", [nb_spikes, b_length, power, intra_freq, inter_freq]);
end