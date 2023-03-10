tmax = 20;

gfm = -2;
gsp = 6;
gsm = -2;
gup = 0;

dfm = 0.0;
dsp = 0.5;
dsm = -0.5;
dup = -0.5;

tau = 0.004;
tau_v = 1/(0.1*tau);
tau_f = 1/(0.25*tau);
tau_s = 1/(10*tau);
tau_u = 1/(200*tau);

V0 = -0.85;

p = [gfm, gsp, gsm, gup, dfm, dsp, dsm, dup, V0, tau_v, tau_f, tau_s, tau_u];

options = odeset('MaxStep', MaxStep);

Iapp_vec = -2:0.025:2;

%Vinit = fzero(@(v) zeroFct(v, p, Iapp(0)), 0);


MaxStep = 0.001;
%SampleTime = 0.001;
%T = 0:SampleTime:tmax;

starAnalyseTime = 4;

freqCurve = zeros(size(Iapp_vec));
ampCurve = zeros(size(Iapp_vec));
meanCurve = zeros(size(Iapp_vec));
maxCurve = zeros(size(Iapp_vec));
minCurve = zeros(size(Iapp_vec));
for i =1:length(Iapp_vec)
    x0 = [0.0, 0.0, 0.0, 0.0];

    Iapp = @(t) Iapp_vec(i);
    
    [T, Vo] = ode45(@(t, u) neuronModel(t, u, p, Iapp), [0, tmax], x0, options);
    
    useful = find(T > starAnalyseTime);
    V = Vo(useful,1);

    [spikesT, spikesV] = spikesTimeAndVoltage(V, T, 0);
    if length(spikesT) >= 2
        interSpikesT = interSpikesTime(spikesT);
        meanSpikesT = mean(interSpikesT);
        if spikesT(end) > tmax - 4*meanSpikesT
            %if min(interSpikesT) > max(interSpikesT)/4
                freqCurve(i) = 1/meanSpikesT;
                ampCurve(i) = mean(spikesV);
            %else
            %    freqCurve(i) = 0;
            %    ampCurve(i) = NaN;
            %end
        else
            freqCurve(i) = 0;
            ampCurve(i) = NaN;
        end
    else
        freqCurve(i) = 0;
        ampCurve(i) = NaN;
    end
    meanCurve(i) = mean(V);

    maxCurve(i) = max(V);
    minCurve(i) = min(V);
end

figure
plot(Iapp_vec, freqCurve)

figure
plot(Iapp_vec, ampCurve, Iapp_vec, meanCurve, "--")

figure
plot(Iapp_vec, maxCurve, "blue", Iapp_vec, minCurve, "blue", Iapp_vec, meanCurve, "--r")



%figure
%plot(T, V(:, 1));


%figure
%plot(T, V(:, 1), T, V(:, 2), T, V(:, 3), T, V(:, 4));
%legend("V", "V_f", "V_s", "V_u");

function r = zeroFct(v, p, I0)
    Iapp = @(t) I0;

    du = neuronModel(0, [v, v, v, v], p, Iapp);

    r = du(1);
end


function [spikesT, spikesV] = spikesTimeAndVoltage(V, T, thresh)
    spikesT = zeros(length(V), 1);
    spikesV = zeros(length(V), 1);
    index = 0;
    prev = 0;
    curr = V(1);
    next = V(2);
    for i = 3:length(V)
        prev = curr;
        curr = next;
        next = V(i);
        if curr > prev && curr > next && curr > thresh
            index = index + 1;
            spikesT(index) = T(i-1);
            spikesV(index) = curr;
        end
    end
    spikesT = spikesT(1:index);
    spikesV = spikesV(1:index);
end


function interSpikesT = interSpikesTime(spikesT)
    %interSpikesT = zeros(length(spikesT)-1, 1);
    %prev = 0;
    %curr = spikesT(1);

    interSpikesT = spikesT(2:end) - spikesT(1:end-1);
    %{
    for i = 2:length(spikesT)
        prev = curr;
        curr = spikesT(i);
        interSpikesT(i-1) = curr-prev; 
    end
    %}
end