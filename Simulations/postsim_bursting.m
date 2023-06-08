function newout = postsim_bursting(o, startAnalyseTime)
    useful = find(o.voltage.time >= startAnalyseTime);
    T = o.voltage.time(useful);
    V = o.voltage.signals.values(useful, 1);

    freq = NaN;

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
    
    if (~isempty(crossings) && length(crossings) > 2)
        cross_sep = crossings(2:end) - crossings(1:end-1);
        % Criterion of bursting
        if max(cross_sep) > 4*mean(cross_sep)
            burst_gaps = cross_sep > 4*mean(cross_sep);
            burst_cycle = zeros(sum(burst_gaps, 'all'), 1);
            
            ind_burst = 0;
            ind_start = 0;
            % Find first burting gap to start computation
            for i = 1:length(cross_sep)
                if burst_gaps(i)
                    ind_start = i+1;
                    break;
                end
            end
            cumulative_time = 0;
            for i = ind_start:length(cross_sep)
                cumulative_time = cumulative_time + cross_sep(i);
                % When a new bursting gap is found the cycle is done
                if burst_gaps(i)
                    ind_burst = ind_burst+1;
                    burst_cycle(ind_burst) = cumulative_time;
                    cumulative_time = 0;
                end
            end
            burst_cycle = burst_cycle(1:ind_burst);
            
            cycle_time = mean(burst_cycle);
            freq = 1/cycle_time;
        end
    end

    newout = struct("val", [freq]);
end