function newout = postsim_angle_frequency_descrepency(o, startAnalyseTime)
    useful = find(o.angle.time >= startAnalyseTime);
    T = o.angle.time(useful);
    theta = squeeze(o.angle.signals.values(useful, 1));

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

    freq_average = f(index);

    period_average = 1/freq_average;

    N_back = ceil(period_average/Diff);
    
    % Compute if the system is oscillating or not by using the maximum
    % deviation from the mean on the last "major" cycle
    one_cycle = theta(end-N_back:end);
    if max(abs(one_cycle - mean(one_cycle, 'all')), 'all') < 0.03
        freq_average = NaN;
        freq_variance = NaN;
    else
        P1(index) = 0; % Remove Principal component of the spectrum
        P1 = P1/val; % Normalize vector
        
        % penalize having big frequency far away from the dominant
        % frequency
        mul = 1 - exp(-100*( ( (f/freq_average) - 1 ).^2) );
        freq_variance = sum(mul.*P1, 'all');
    end

    newout = struct("val", [freq_average, freq_variance]);
end