sampleTime = 0.0001;
endTime = 16;

pulsePeriod = 2;
pulseFrac = 0.005;

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

time = 0:sampleTime:endTime;
time = time';

pulseWidth = pulsePeriod*pulseFrac; % In fraction
pulseTime = (pulsePeriod+pulseWidth/2):pulsePeriod:endTime;
pulses = pulstran(time,pulseTime,@rectpuls,pulseWidth);



n_params = {
    {struct("gup", 3), struct("gup", 4), struct("gup", 5), struct("gup", 6), struct("gup", 7)}, ...
    {struct("gup", 3), struct("gup", 4), struct("gup", 3), struct("gup", 4), struct("gup", 3), struct("gup", 4)}
           };
I_ins = {
    {timeseries(-1, time), timeseries(-1, time), timeseries(-1, time), timeseries(-1, time), timeseries(-1, time)}, ...
    {timeseries(-1, time), timeseries(-1, time), timeseries(0, time), timeseries(0, time), timeseries(1, time), timeseries(1, time)},
        };
I_in_names = {
    {"DC = -1", "DC = -1", "DC = -1", "DC = -1", "DC = -1"}, ...
    {"DC = -1", "DC = -1", "DC = 0", "DC = 0", "DC = 1", "DC = 1"}
             };
%sim_params = {
%    {struct("StopTime", num2str(endTime)), struct("StopTime", num2str(endTime)), struct("StopTime", num2str(endTime)), struct("StopTime", num2str(endTime)), struct("StopTime", num2str(endTime))}, ...
%    {struct("StopTime", num2str(endTime)), struct("StopTime", num2str(endTime)), struct("StopTime", num2str(endTime)), struct("StopTime", num2str(endTime)), struct("StopTime", num2str(endTime)), struct("StopTime", num2str(endTime))}
%             };

plot_list = {{{}, {}}, {{}, {}}};
plot_titles = {"DC = -1", "DC variation"};
plot_saves = {[], []};

n_plots = length(n_params);

model = "test_behaviour_auto";

load_system(model)
    
sim_in = Simulink.SimulationInput(model);

for i = 1:n_plots
    n_sim = length(n_params{i});
    for j = 1:n_sim
        Iapp = I_ins{i}{j};
        n_param = n_params{i}{j};
        %param = sim_params{i}{j};
    
        ref = I_in_names{i}{j};
        
        gfm = gfm_ref;
        gsp = gsp_ref;
        gsm = gsm_ref;
        gup = gup_ref;
        dfm = dfm_ref;
        dsp = dsp_ref;
        dsm = dsm_ref;
        dup = dup_ref;
    
        if isfield(n_param, 'gfm')
            gfm = n_param.gfm;
            ref = strcat(ref, ", gfm = ", num2str(gfm), ",");
        end
        if isfield(n_param, 'gsp')
            gsp = n_param.gsp;
            ref = strcat(ref, ", gsp = ", num2str(gsp), ",");
        end
        if isfield(n_param, 'gsm')
            gsm = n_param.gsm;
            ref = strcat(ref, ", gsm = ", num2str(gsm), ",");
        end
        if isfield(n_param, 'gup')
            gup = n_param.gup;
            ref = strcat(ref, ", gup = ", num2str(gup), ",");
        end
    
        if isfield(n_param, 'dfm')
            dfm = n_param.dfm;
            ref = strcat(ref, ", dfm = ", num2str(dfm), ",");
        end
        if isfield(n_param, 'dsp')
            dsp = n_param.dsp;
            ref = strcat(ref, ", dsp = ", num2str(dsp), ",");
        end
        if isfield(n_param, 'dsm')
            dsm = n_param.dsm;
            ref = strcat(ref, ", dsm = ", num2str(dsm), ",");
        end
        if isfield(n_param, 'dup')
            dup = n_param.dup;
            ref = strcat(ref, ", dup = ", num2str(dup));
        end
        
        sim_in = setVariable(sim_in, "gfm", gfm);
        sim_in = setVariable(sim_in, "gsp", gsp);
        sim_in = setVariable(sim_in, "gsm", gsm);
        sim_in = setVariable(sim_in, "gup", gup);
        sim_in = setVariable(sim_in, "dfm", dfm);
        sim_in = setVariable(sim_in, "dsp", dsp);
        sim_in = setVariable(sim_in, "dsm", dsm);
        sim_in = setVariable(sim_in, "dup", dup);
        sim_in = setExternalInput(sim_in, Iapp);
    
        out_test = sim(sim_in);
        
        % add plot to list
        plot_list{i}{1}{end+1} = out_test;
        plot_list{i}{2}{end+1} = ref;  
    end
end

for i = 1:length(plot_list)
    plots = plot_list{i}{1};
    nbValues = length(plots);
    Touts = cell(nbValues);
    Vouts = cell(nbValues);

    for j = 1:nbValues
        out = plots{j};
        Touts{j} = out.tout;
        Vouts{j} = out.V.signals.values(:,1);
    end
    Names = plot_list{i}{2};

    if isempty(plot_saves{i})
        plotV(Touts, Vouts, Names, plot_titles{i});
    else
        plotV(Touts, Vouts, Names, plot_titles{i}, plot_saves{i});
    end
end

%%% Associated fct

function plotV(Touts, Vouts, Names, Title, filename)
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
    legend()
    title(strcat("Output voltage (",Title,')'))
    if nargin >= 5
        saveas(gcf, strcat("V_",filename))
        close
    end
end
