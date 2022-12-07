sampleTime = 0.0001;
endTime = 16;

pulsePeriod = 2;
pulseFrac = 0.005;

gfm_def = -2;
gsp_def = 6;
gsm_def = -4;
gup_def = 5;
dfm_def = 0.0;
dsp_def = 0.5;
dsm_def = -0.5;
dup_def = -0.5;

%Start of code


gfm = gfm_def;
gsp = gsp_def;
gsm = gsm_def;
gup = gup_def;
dfm = dfm_def;
dsp = dsp_def;
dsm = dsm_def;
dup = dup_def;

simParam.StopTime = num2str(endTime);

time = 0:sampleTime:endTime;
time = time';

pulseWidth = pulsePeriod*pulseFrac; % In fraction
pulseTime = (pulsePeriod+pulseWidth/2):pulsePeriod:endTime;
pulses = pulstran(time,pulseTime,@rectpuls,pulseWidth);

%{
n_params = {};
I_ins = {};
I_in_names = {};
Time_in = {};
sim_params = {};
list_num = [];
plot_list = {{}};

n_iter = length(n_params);

for i = 0:n_iter-1
    Iin = I_ins{i};
    time = Time_in{i};
    n_param = n_params{i};
    param = sim_params{i};
    n = plot_list(i);

    ref = I_in_names{i};
    
    gfm = gfm_def;
    gsp = gsp_def;
    gsm = gsm_def;
    gup = gup_def;
    dfm = dfm_def;
    dsp = dsp_def;
    dsm = dsm_def;
    dup = dup_def;

    if isfield(n_param, 'gfm')
        gfm = n_param.gfm;
        ref = strcat(ref, "gfm = ", num2str(gfm), ",");
    end

    if isfield(n_param, 'gsp')
        gsp = n_param.gsp;
        ref = strcat(ref, "gsp = ", num2str(gsp), ",");
    end

    if isfield(n_param, 'gsm')
        gsm = n_param.gsm;
        ref = strcat(ref, "gsm = ", num2str(gsm), ",");
    end

    if isfield(n_param, 'gup')
        gup = n_param.gup;
        ref = strcat(ref, "gup = ", num2str(gup), ",");
    end

    if isfield(n_param, 'dfm')
        dfm = n_param.dfm;
        ref = strcat(ref, "dfm = ", num2str(dfm), ",");
    end

    if isfield(n_param, 'dsp')
        dsp = n_param.dsp;
        ref = strcat(ref, "dsp = ", num2str(dsp), ",");
    end

    if isfield(n_param, 'dsm')
        dsm = n_param.dsm;
        ref = strcat(ref, "dsm = ", num2str(dsm), ",");
    end

    if isfield(n_param, 'dup')
        dup = n_param.dup;
        ref = strcat(ref, "dup = ", num2str(dup), ",");
    end

    ref(find(ref==',',1,'last'):end) = [];

    out_test = sim("test_behaviour_auto.slx", param);
    
    plot_list{n}{end+1} = out_test;
    % add to plot list 
end

for l = plot_list
    for p = l
    end
    plotV();
end
%}

%start of plots

% gfm test
if true
    Iin = 2*pulses - 2;
    Iapp = timeseries(Iin,time);
    
    values = 0:-1:-4;
    nbValues = length(values);
    Touts = cell(nbValues);
    Vouts = cell(nbValues);
    Names = cell(nbValues);
    for i = 1:nbValues
        gfm = values(i);
        out_test=sim("test_behaviour_auto.slx", simParam);
        Touts{i} = out_test.tout;
        Vouts{i} = out_test.V.signals.values(:,1);
        Names{i} = strcat('gfm = ', num2str(gfm));
    end 
    
    plotV(time, Iin, Touts, Vouts, Names, 'Iapp pulse = 2', 'gfm_Ipulse2.pdf');
    
    
    Iin = 4*pulses - 2;
    Iapp = timeseries(Iin,time);
    
    Touts = cell(nbValues);
    Vouts = cell(nbValues);
    Names = cell(nbValues);
    for i = 1:nbValues
        gfm = values(i);
        out_test=sim("test_behaviour_auto.slx", simParam);
        Touts{i} = out_test.tout;
        Vouts{i} = out_test.V.signals.values(:,1);
        Names{i} = strcat('gfm = ', num2str(gfm));
    end 
    
    plotV(time, Iin, Touts, Vouts, Names, 'Iapp pulse = 4', 'gfm_Ipulse4.pdf');
    
    
    Iin = -1;
    Iapp = timeseries(Iin,time);
    
    Touts = cell(nbValues);
    Vouts = cell(nbValues);
    Names = cell(nbValues);
    for i = 1:nbValues
        gfm = values(i);
        out_test=sim("test_behaviour_auto.slx", simParam);
        Touts{i} = out_test.tout;
        Vouts{i} = out_test.V.signals.values(:,1);
        Names{i} = strcat('gfm = ', num2str(gfm));
    end 
    
    plotV(time, Iin, Touts, Vouts, Names, 'Iapp DC = -1', 'gfm_IDC-1.pdf');
    
    
    Iin = 0;
    Iapp = timeseries(Iin,time);
    
    Touts = cell(nbValues);
    Vouts = cell(nbValues);
    Names = cell(nbValues);
    for i = 1:nbValues
        gfm = values(i);
        out_test=sim("test_behaviour_auto.slx", simParam);
        Touts{i} = out_test.tout;
        Vouts{i} = out_test.V.signals.values(:,1);
        Names{i} = strcat('gfm = ', num2str(gfm));
    end 
    
    plotV(time, Iin, Touts, Vouts, Names, 'Iapp DC = 0', 'gfm_IDC0.pdf');
end

gfm = gfm_def;
gsp = gsp_def;
gsm = gsm_def;
gup = gup_def;
dfm = dfm_def;
dsp = dsp_def;
dsm = dsm_def;
dup = dup_def;

% gsp test
if true
    Iin = 2*pulses - 2;
    Iapp = timeseries(Iin,time);
    
    values = 4:1:8;
    nbValues = length(values);
    Touts = cell(nbValues);
    Vouts = cell(nbValues);
    Names = cell(nbValues);
    for i = 1:nbValues
        gsp = values(i);
        out_test=sim("test_behaviour_auto.slx", simParam);
        Touts{i} = out_test.tout;
        Vouts{i} = out_test.V.signals.values(:,1);
        Names{i} = strcat('gsp = ', num2str(gsp));
    end 
    
    plotV(time, Iin, Touts, Vouts, Names, 'Iapp pulse = 2', 'gsp_Ipulse2.pdf');
    
    
    Iin = 4*pulses - 2;
    Iapp = timeseries(Iin,time);
    
    Touts = cell(nbValues);
    Vouts = cell(nbValues);
    Names = cell(nbValues);
    for i = 1:nbValues
        gsp = values(i);
        out_test=sim("test_behaviour_auto.slx", simParam);
        Touts{i} = out_test.tout;
        Vouts{i} = out_test.V.signals.values(:,1);
        Names{i} = strcat('gsp = ', num2str(gsp));
    end 
    
    plotV(time, Iin, Touts, Vouts, Names, 'Iapp pulse = 4', 'gsp_Ipulse4.pdf');
    
    
    Iin = -1;
    Iapp = timeseries(Iin,time);
    
    Touts = cell(nbValues);
    Vouts = cell(nbValues);
    Names = cell(nbValues);
    for i = 1:nbValues
        gsp = values(i);
        out_test=sim("test_behaviour_auto.slx", simParam);
        Touts{i} = out_test.tout;
        Vouts{i} = out_test.V.signals.values(:,1);
        Names{i} = strcat('gsp = ', num2str(gsp));
    end 
    
    plotV(time, Iin, Touts, Vouts, Names, 'Iapp DC = -1', 'gsp_IDC-1.pdf');
    
    
    Iin = 0;
    Iapp = timeseries(Iin,time);
    
    Touts = cell(nbValues);
    Vouts = cell(nbValues);
    Names = cell(nbValues);
    for i = 1:nbValues
        gsp = values(i);
        out_test=sim("test_behaviour_auto.slx", simParam);
        Touts{i} = out_test.tout;
        Vouts{i} = out_test.V.signals.values(:,1);
        Names{i} = strcat('gsp = ', num2str(gsp));
    end 
    
    plotV(time, Iin, Touts, Vouts, Names, 'Iapp DC = 0', 'gsp_IDC0.pdf');
end

gfm = gfm_def;
gsp = gsp_def;
gsm = gsm_def;
gup = gup_def;
dfm = dfm_def;
dsp = dsp_def;
dsm = dsm_def;
dup = dup_def;

% gsm test
if true
    Iin = 2*pulses - 2;
    Iapp = timeseries(Iin,time);
    
    values = -2:-1:-6;
    nbValues = length(values);
    Touts = cell(nbValues);
    Vouts = cell(nbValues);
    Names = cell(nbValues);
    for i = 1:nbValues
        gsm = values(i);
        out_test=sim("test_behaviour_auto.slx", simParam);
        Touts{i} = out_test.tout;
        Vouts{i} = out_test.V.signals.values(:,1);
        Names{i} = strcat('gsm = ', num2str(gsm));
    end 
    
    plotV(time, Iin, Touts, Vouts, Names, 'Iapp pulse = 2', 'gsm_Ipulse2.pdf');
    
    
    Iin = 4*pulses - 2;
    Iapp = timeseries(Iin,time);
    
    Touts = cell(nbValues);
    Vouts = cell(nbValues);
    Names = cell(nbValues);
    for i = 1:nbValues
        gsm = values(i);
        out_test=sim("test_behaviour_auto.slx", simParam);
        Touts{i} = out_test.tout;
        Vouts{i} = out_test.V.signals.values(:,1);
        Names{i} = strcat('gsm = ', num2str(gsm));
    end 
    
    plotV(time, Iin, Touts, Vouts, Names, 'Iapp pulse = 4', 'gsm_Ipulse4.pdf');
    
    
    Iin = -1;
    Iapp = timeseries(Iin,time);
    
    Touts = cell(nbValues);
    Vouts = cell(nbValues);
    Names = cell(nbValues);
    for i = 1:nbValues
        gsm = values(i);
        out_test=sim("test_behaviour_auto.slx", simParam);
        Touts{i} = out_test.tout;
        Vouts{i} = out_test.V.signals.values(:,1);
        Names{i} = strcat('gsm = ', num2str(gsm));
    end 
    
    plotV(time, Iin, Touts, Vouts, Names, 'Iapp DC = -1', 'gsm_IDC-1.pdf');
    
    
    Iin = 0;
    Iapp = timeseries(Iin,time);
    
    Touts = cell(nbValues);
    Vouts = cell(nbValues);
    Names = cell(nbValues);
    for i = 1:nbValues
        gsm = values(i);
        out_test=sim("test_behaviour_auto.slx", simParam);
        Touts{i} = out_test.tout;
        Vouts{i} = out_test.V.signals.values(:,1);
        Names{i} = strcat('gsm = ', num2str(gsm));
    end 
    
    plotV(time, Iin, Touts, Vouts, Names, 'Iapp DC = 0', 'gsm_IDC0.pdf');
end

gfm = gfm_def;
gsp = gsp_def;
gsm = gsm_def;
gup = gup_def;
dfm = dfm_def;
dsp = dsp_def;
dsm = dsm_def;
dup = dup_def;

% gup test
if true
    Iin = 2*pulses - 2;
    Iapp = timeseries(Iin,time);
    
    values = 3:1:7;
    nbValues = length(values);
    Touts = cell(nbValues);
    Vouts = cell(nbValues);
    Names = cell(nbValues);
    for i = 1:nbValues
        gup = values(i);
        out_test=sim("test_behaviour_auto.slx", simParam);
        Touts{i} = out_test.tout;
        Vouts{i} = out_test.V.signals.values(:,1);
        Names{i} = strcat('gup = ', num2str(gup));
    end 
    
    plotV(time, Iin, Touts, Vouts, Names, 'Iapp pulse = 2', 'gup_Ipulse2.pdf');
    
    
    Iin = 4*pulses - 2;
    Iapp = timeseries(Iin,time);
    
    Touts = cell(nbValues);
    Vouts = cell(nbValues);
    Names = cell(nbValues);
    for i = 1:nbValues
        gup = values(i);
        out_test=sim("test_behaviour_auto.slx", simParam);
        Touts{i} = out_test.tout;
        Vouts{i} = out_test.V.signals.values(:,1);
        Names{i} = strcat('gup = ', num2str(gup));
    end 
    
    plotV(time, Iin, Touts, Vouts, Names, 'Iapp pulse = 4', 'gup_Ipulse4.pdf');
    
    
    Iin = -1;
    Iapp = timeseries(Iin,time);
    
    Touts = cell(nbValues);
    Vouts = cell(nbValues);
    Names = cell(nbValues);
    for i = 1:nbValues
        gup = values(i);
        out_test=sim("test_behaviour_auto.slx", simParam);
        Touts{i} = out_test.tout;
        Vouts{i} = out_test.V.signals.values(:,1);
        Names{i} = strcat('gup = ', num2str(gup));
    end 
    
    plotV(time, Iin, Touts, Vouts, Names, 'Iapp DC = -1', 'gup_IDC-1.pdf');
    
    
    Iin = 0;
    Iapp = timeseries(Iin,time);
    
    Touts = cell(nbValues);
    Vouts = cell(nbValues);
    Names = cell(nbValues);
    for i = 1:nbValues
        gup = values(i);
        out_test=sim("test_behaviour_auto.slx", simParam);
        Touts{i} = out_test.tout;
        Vouts{i} = out_test.V.signals.values(:,1);
        Names{i} = strcat('gup = ', num2str(gup));
    end 
    
    plotV(time, Iin, Touts, Vouts, Names, 'Iapp DC = 0', 'gup_IDC0.pdf');
end

gfm = gfm_def;
gsp = gsp_def;
gsm = gsm_def;
gup = gup_def;
dfm = dfm_def;
dsp = dsp_def;
dsm = dsm_def;
dup = dup_def;

% gsm and gup test
if true
    Iin = 2*pulses - 2;
    Iapp = timeseries(Iin,time);
    
    values = 3:1:7;
    values2 = -2:-1:-6;
    nbValues = length(values);
    Touts = cell(nbValues);
    Vouts = cell(nbValues);
    Names = cell(nbValues);
    for i = 1:nbValues
        gup = values(i);
        gsm = values2(i);
        out_test=sim("test_behaviour_auto.slx", simParam);
        Touts{i} = out_test.tout;
        Vouts{i} = out_test.V.signals.values(:,1);
        Names{i} = strcat('gup = ', num2str(gup),",gsm = ", num2str(gsm));
    end 
    
    plotV(time, Iin, Touts, Vouts, Names, 'Iapp pulse = 2', 'gsm_gup_Ipulse2.pdf');
    
    
    Iin = 4*pulses - 2;
    Iapp = timeseries(Iin,time);
    
    Touts = cell(nbValues);
    Vouts = cell(nbValues);
    Names = cell(nbValues);
    for i = 1:nbValues
        gup = values(i);
        gsm = values2(i);
        out_test=sim("test_behaviour_auto.slx", simParam);
        Touts{i} = out_test.tout;
        Vouts{i} = out_test.V.signals.values(:,1);
        Names{i} = strcat('gup = ', num2str(gup),",gsm = ", num2str(gsm));
    end 
    
    plotV(time, Iin, Touts, Vouts, Names, 'Iapp pulse = 4', 'gsm_gup_Ipulse4.pdf');
    
    
    Iin = -1;
    Iapp = timeseries(Iin,time);
    
    Touts = cell(nbValues);
    Vouts = cell(nbValues);
    Names = cell(nbValues);
    for i = 1:nbValues
        gup = values(i);
        gsm = values2(i);
        out_test=sim("test_behaviour_auto.slx", simParam);
        Touts{i} = out_test.tout;
        Vouts{i} = out_test.V.signals.values(:,1);
        Names{i} = strcat('gup = ', num2str(gup),",gsm = ", num2str(gsm));
    end 
    
    plotV(time, Iin, Touts, Vouts, Names, 'Iapp DC = -1', 'gsm_gup_IDC-1.pdf');
    
    
    Iin = 0;
    Iapp = timeseries(Iin,time);
    
    Touts = cell(nbValues);
    Vouts = cell(nbValues);
    Names = cell(nbValues);
    for i = 1:nbValues
        gup = values(i);
        gsm = values2(i);
        out_test=sim("test_behaviour_auto.slx", simParam);
        Touts{i} = out_test.tout;
        Vouts{i} = out_test.V.signals.values(:,1);
        Names{i} = strcat('gup = ', num2str(gup),",gsm = ", num2str(gsm));
    end 
    
    plotV(time, Iin, Touts, Vouts, Names, 'Iapp DC = 0', 'gsm_gup_IDC0.pdf');
end

gfm = gfm_def;
gsp = gsp_def;
gsm = gsm_def;
gup = gup_def;
dfm = dfm_def;
dsp = dsp_def;
dsm = dsm_def;
dup = dup_def;

% dsm test
if true
    Iin = 2*pulses - 2;
    Iapp = timeseries(Iin,time);
    
    values = -0.75:0.25:0.75;
    nbValues = length(values);
    Touts = cell(nbValues);
    Vouts = cell(nbValues);
    Names = cell(nbValues);
    for i = 1:nbValues
        dsm = values(i);
        out_test=sim("test_behaviour_auto.slx", simParam);
        Touts{i} = out_test.tout;
        Vouts{i} = out_test.V.signals.values(:,1);
        Names{i} = strcat('dsm = ', num2str(dsm));
    end 
    
    plotV(time, Iin, Touts, Vouts, Names, 'Iapp pulse = 2', 'dsm_Ipulse2.pdf');
    
    
    Iin = 4*pulses - 2;
    Iapp = timeseries(Iin,time);
    
    Touts = cell(nbValues);
    Vouts = cell(nbValues);
    Names = cell(nbValues);
    for i = 1:nbValues
        dsm = values(i);
        out_test=sim("test_behaviour_auto.slx", simParam);
        Touts{i} = out_test.tout;
        Vouts{i} = out_test.V.signals.values(:,1);
        Names{i} = strcat('dsm = ', num2str(dsm));
    end 
    
    plotV(time, Iin, Touts, Vouts, Names, 'Iapp pulse = 4', 'dsm_Ipulse4.pdf');
    
    
    Iin = -1;
    Iapp = timeseries(Iin,time);
    
    Touts = cell(nbValues);
    Vouts = cell(nbValues);
    Names = cell(nbValues);
    for i = 1:nbValues
        dsm = values(i);
        out_test=sim("test_behaviour_auto.slx", simParam);
        Touts{i} = out_test.tout;
        Vouts{i} = out_test.V.signals.values(:,1);
        Names{i} = strcat('dsm = ', num2str(dsm));
    end 
    
    plotV(time, Iin, Touts, Vouts, Names, 'Iapp DC = -1', 'dsm_IDC-1.pdf');
    
    
    Iin = 0;
    Iapp = timeseries(Iin,time);
    
    Touts = cell(nbValues);
    Vouts = cell(nbValues);
    Names = cell(nbValues);
    for i = 1:nbValues
        dsm = values(i);
        out_test=sim("test_behaviour_auto.slx", simParam);
        Touts{i} = out_test.tout;
        Vouts{i} = out_test.V.signals.values(:,1);
        Names{i} = strcat('dsm = ', num2str(dsm));
    end 
    
    plotV(time, Iin, Touts, Vouts, Names, 'Iapp DC = 0', 'dsm_IDC0.pdf');
end

function plotV(Tin, Iin, Touts, Vouts, Names, Title, filename)
    nbValues = length(Touts);
    
    %{
    figure
    tiledlayout(2,1)
    nexttile
    hold on
    for i = 1:nbValues
        plot(Touts{i}, Vouts{i}, ...
             'DisplayName', Names{i})
    end
    axis([10 15 -10 10])
    legend()
    title(strcat("Output voltage (",Title,')'))
    
    nexttile
    plot(Tin, Iin);
    title(strcat("Applied Current (",Title,')'))
    saveas(gcf, strcat("both_",filename))
    close
    %}

    figure
    hold on
    for i = 1:nbValues
        plot(Touts{i}, Vouts{i}, ...
             'DisplayName', Names{i})
    end
    axis([10 15 -10 10])
    legend()
    title(strcat("Output voltage (",Title,')'))
    saveas(gcf, strcat("V_",filename))
    close
end