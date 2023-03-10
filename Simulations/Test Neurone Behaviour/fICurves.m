SampleTime = 0.0001;
endTime = 8;
starAnalyseTime = 4;

NoisePwr = 0.0;

gfm_ref = -2;
gsp_ref = 6;
gsm_ref = -4;
gup_ref = 5;
dfm_ref = 0.0;
dsp_ref = 0.5;
dsm_ref = -0.5;
dup_ref = -0.5;

%Start of code

%simParam.StopTime = num2str(endTime);

time = 0:SampleTime:endTime;
time = time';

analyse_elem = find(time > starAnalyseTime);

Iapp_vec = -2:0.025:2;

model = "test_behaviour_auto_cst_current";
load_system(model)

Gfm = -2;
Gsp = 3;
Gsm = -1.5;%-5;
Gup = 0;%2;
Dfm = dfm_ref;
Dsp = dsp_ref;
Dsm = dsm_ref;
Dup = dup_ref;

freqCurve = zeros(size(Iapp_vec));
ampCurve = zeros(size(Iapp_vec));
meanCurve = zeros(size(Iapp_vec));
maxCurve = zeros(size(Iapp_vec));
minCurve = zeros(size(Iapp_vec));
for i = 1:length(Iapp_vec)
    IApp = Iapp_vec(i);
    sim_in = Simulink.SimulationInput(model);

    sim_in = setVariable(sim_in, "gfm", Gfm);
    sim_in = setVariable(sim_in, "gsp", Gsp);
    sim_in = setVariable(sim_in, "gsm", Gsm);
    sim_in = setVariable(sim_in, "gup", Gup);
    sim_in = setVariable(sim_in, "dfm", Dfm);
    sim_in = setVariable(sim_in, "dsp", Dsp);
    sim_in = setVariable(sim_in, "dsm", Dsm);
    sim_in = setVariable(sim_in, "dup", Dup);
    sim_in = setVariable(sim_in, "Iapp", IApp);
    sim_in = setVariable(sim_in, "noisePwr", NoisePwr);
    sim_in = setVariable(sim_in, "sampleTime", SampleTime);

    sim_in = setModelParameter(sim_in, "StopTime", num2str(endTime));

    out = sim(sim_in);
    
    T = out.V.time(analyse_elem);
    V = out.V.signals.values(analyse_elem, 1);
    
    [spikesT, spikesV] = spikesTimeAndVoltage(V, T, 0);
    if length(spikesT) >= 2
        interSpikesT = interSpikesTime(spikesT);
        meanSpikesT = mean(interSpikesT);
        if spikesT(end) > endTime - 4*meanSpikesT
            freqCurve(i) = 1/meanSpikesT;
            ampCurve(i) = mean(spikesV);
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
    interSpikesT = zeros(length(spikesT)-1, 1);
    prev = 0;
    curr = spikesT(1);
    for i = 2:length(spikesT)
        prev = curr;
        curr = spikesT(i);
        interSpikesT(i-1) = curr-prev; 
    end
end




