function newout = postsim_voltage_burst_frequency_dutyCycle(o, startAnalyseTime)
    useful = find(o.voltage.time >= startAnalyseTime);
    T = o.voltage.time(useful);
    V = o.voltage.signals.values(useful, 1);

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

        if mean(cross_sep(id == 1)) > mean(cross_sep(id == 2)) 
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

    newout = struct("val", [F, D]);
end