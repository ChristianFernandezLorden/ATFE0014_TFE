function newout = postsim_spiking_freq(o, startAnalyseTime)
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
            freq = -1;
        else
            cycle_time = mean(cross_sep);
            freq = 1/cycle_time;
        end
     end

     newout = struct("val", [freq]);
end