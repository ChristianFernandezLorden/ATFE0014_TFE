%% Test neuron behaviour to cst current

model = "test_behaviour_auto_cst_current";

params = struct();
u_params = struct();

params.dfm = 0.0;
params.dsp = 0.5;
params.dsm = -0.5;
params.dup = -0.5;
u_params.noisePwr = 0;%3*10^-7;
params.sampleTime = 0.001;

u_params.gfm = -2.0;
u_params.gsp = 6.0;
u_params.gsm = -4;
u_params.gup = 5;
u_params.Iapp = -1.5;

SelectValAndPlot(model, params, u_params);

%% Test neuron behaviour to cst current

model = "test_behaviour_auto_cst_current";

params = struct();
u_params = struct();

params.dfm = 0.0;
params.dsp = 0.5;
params.dsm = -0.5;
params.dup = -0.5;
u_params.noisePwr = 0;%3*10^-7;
params.sampleTime = 0.001;

u_params.gfm = -2.0;
u_params.gsp = 4.0;
u_params.gsm = -1;
u_params.gup = 1;
u_params.Iapp = 0.0;

SelectValAndPlot(model, params, u_params);

%% Create a FI curve for type 1 neuron

eval_params = struct();

nb_par = 100;

% We will use the same evaluation parameters for all tests

eval_params.nbEval = 1;
eval_params.nbOut = 1;
eval_params.StopTime = 30; % Min freq = 1/15 = 0.05 Hz (more like 1 Hz)
eval_params.StartAnalyseTime = 10;
eval_params.func = @postsim_spiking_freq;


model = "test_behaviour_auto_cst_current";

params = struct();
var_params = struct();

params.gfm = -2; % Balance between Gsp and Gsm (at the equilibrium point)
params.gsp = 6; % 4
params.gsm = -2; % -1
params.gup = 9; % 1
params.dfm = 0.0;
params.dsp = 0.5;
params.dsm = -0.5;
params.dup = -0.5;

params.noisePwr = 0;
params.sampleTime = 0.001;

var_params.Iapp = -3.0:0.01:5.0;%-0.5:0.01:4.0;

out_values = squeeze(parameterChart(params, var_params, model, eval_params, nb_par));

figure
plot(var_params.Iapp, out_values)

%save("type1_freq.mat", "out_values", "params", "var_params", "eval_params", "model");
%matrixToCsv("type1_freq.csv", out_values, {var_params.Iapp}, ["Iapp"])

%% Create a NbSpikes-gsm curve for bursting neuron

eval_params = struct();

nb_par = 100;

% We will use the same evaluation parameters for all tests

eval_params.nbEval = 1;
eval_params.nbOut = 5;
eval_params.StopTime = 30; % Min freq = 1/15 = 0.05 Hz (more like 1 Hz)
eval_params.StartAnalyseTime = 10;
eval_params.func = @postsim_burst_analysis;


model = "test_behaviour_auto_cst_current";

params = struct();
var_params = struct();

params.gfm = -2.0;
params.gsp = 6.0;
params.gup = 5;

params.dfm = 0.0;
params.dsp = 0.5;
params.dsm = -0.5;
params.dup = -0.5;

params.Iapp = -1.0;

params.noisePwr = 0;
params.sampleTime = 0.001;

var_params.gsm = -4.3:0.01:-2;

out_values = squeeze(parameterChart(params, var_params, model, eval_params, nb_par));

figure
plot(var_params.gsm, out_values(1,:))
figure
plot(var_params.gsm, out_values(2,:))
figure
plot(var_params.gsm, out_values(3,:))
figure
plot(var_params.gsm, out_values(4,:))
figure
plot(var_params.gsm, out_values(5,:))

save("bursting_gsm_analysis.mat", "out_values", "params", "var_params", "eval_params", "model");
matrixToCsv("burst_nb_spikes.csv", out_values(1,:), {var_params.gsm}, ["gsm"])
matrixToCsv("burst_power.csv", out_values(3,:), {var_params.gsm}, ["gsm"])
matrixToCsv("burst_duty.csv", out_values(5,:).*out_values(2,:), {var_params.gsm}, ["gsm"])
matrixToCsv("burst_intra.csv", out_values(4,:), {var_params.gsm}, ["gsm"])


%% Parametrer map
load("burst_data_fine.mat")

eval_params = struct();

nb_par = 200;

% We will use the same evaluation parameters for all tests

eval_params.nbEval = 1;
eval_params.nbOut = 8;
eval_params.StopTime = 20; % Min freq = 1/15 = 0.05 Hz (more like 1 Hz)
eval_params.StartAnalyseTime = 5;
eval_params.func = @postsim_neuronal_signal_analysis;


model = "test_behaviour_auto_cst_current";

params = struct();
var_params = struct();

params.gfm = -2; % Balance between Gsp and Gsm (at the equilibrium point)
params.gsp = 4;%6;

params.dfm = 0.0;
params.dsp = 0.5;
params.dsm = -0.5;
params.dup = -0.5;
params.noisePwr = 0;%3*10^-7;
params.sampleTime = 0.001;

params.noisePwr = 0;
params.sampleTime = 0.001;

var_params.gsm = -7:0.1:0;
var_params.gup = 1:0.1:9;
var_params.Iapp = -2:0.2:2;

out_values = squeeze(parameterChart(params, var_params, model, eval_params, nb_par));

%save("Neuron_data_complete.mat", "out_values", "params", "var_params", "eval_params", "model");
save("Neuron_strange_data_complete.mat", "out_values", "params", "var_params", "eval_params", "model");

Disp3DMap(squeeze(out_values(5,:,:,:)), var_params.gsm, var_params.gup, var_params.Iapp, ["gsm", "gup", "Iapp"], 3)
Disp3DMap(squeeze(out_values(6,:,:,:)), var_params.gsm, var_params.gup, var_params.Iapp, ["gsm", "gup", "Iapp"], 3)
Disp3DMap(squeeze(out_values(8,:,:,:)), var_params.gsm, var_params.gup, var_params.Iapp, ["gsm", "gup", "Iapp"], 3)

%%

load("Neuron_data_complete.mat")

%%


copy = out_values;
tmp = copy(3,:,:,:);
tmp(tmp > 20) = NaN;
copy(3,:,:,:) = tmp;

Disp3DMap(squeeze(copy(3,:,:,:)), var_params.gsm, var_params.gup, var_params.Iapp, ["gsm", "gup", "Iapp"], 3)


%%

flat = reshape(out_values(6,:,:,:),1,[]);
flat = flat(~isnan(flat));
[sorted, ~] = sort(flat, 'descend');
disp(sorted(1:5));

copy = out_values;
tmp = copy(6,:,:,:);
tmp(tmp > 7) = NaN;
copy(6,:,:,:) = tmp;

id_m2 = find(var_params.Iapp >= -2.0, 1, 'first');
id_m1 = find(var_params.Iapp >= -1.0, 1, 'first');
id_0 = find(var_params.Iapp >= 0.0, 1, 'first');
id_p1 = find(var_params.Iapp >= 1.0, 1, 'first');
id_p2 = find(var_params.Iapp >= 2.0, 1, 'first');
id_p02 = find(var_params.Iapp >= 0.1, 1, 'first');
id_p04 = find(var_params.Iapp >= 0.3, 1, 'first');

matrixToCsv("neuron_Iappp02_b_freq.csv", squeeze(copy(6, :, :, id_p02)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("neuron_Iappp04_b_freq.csv", squeeze(copy(6, :, :, id_p04)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])

matrixToCsv("neuron_Iappm2_b_freq.csv", squeeze(copy(6, :, :, id_m2)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("neuron_Iappm1_b_freq.csv", squeeze(copy(6, :, :, id_m1)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("neuron_Iapp0_b_freq.csv", squeeze(copy(6, :, :, id_0)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("neuron_Iappp1_b_freq.csv", squeeze(copy(6, :, :, id_p1)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("neuron_Iappp2_b_freq.csv", squeeze(copy(6, :, :, id_p2)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])

Disp3DMap(squeeze(copy(6,:,:,:)), var_params.gsm, var_params.gup, var_params.Iapp, ["gsm", "gup", "Iapp"], 3)

%%

id_m2 = find(var_params.Iapp >= -2.0, 1, 'first');
id_m1 = find(var_params.Iapp >= -1.0, 1, 'first');
id_0 = find(var_params.Iapp >= 0.0, 1, 'first');
id_p1 = find(var_params.Iapp >= 1.0, 1, 'first');
id_p2 = find(var_params.Iapp >= 2.0, 1, 'first');

Disp3DMap(squeeze(out_values(4,:,:,:)), var_params.gsm, var_params.gup, var_params.Iapp, ["gsm", "gup", "Iapp"], 3)

matrixToCsv("neuron_Iappm2_duty.csv", squeeze(out_values(4, :, :, id_m2)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("neuron_Iappm1_duty.csv", squeeze(out_values(4, :, :, id_m1)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("neuron_Iapp0_duty.csv", squeeze(out_values(4, :, :, id_0)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("neuron_Iappp1_duty.csv", squeeze(out_values(4, :, :, id_p1)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("neuron_Iappp2_duty.csv", squeeze(out_values(4, :, :, id_p2)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])

%%

id_m2 = find(var_params.Iapp >= -2.0, 1, 'first');
id_m1 = find(var_params.Iapp >= -1.0, 1, 'first');
id_0 = find(var_params.Iapp >= 0.0, 1, 'first');
id_p1 = find(var_params.Iapp >= 1.0, 1, 'first');
id_p2 = find(var_params.Iapp >= 2.0, 1, 'first');

Disp3DMap(squeeze(out_values(5,:,:,:)), var_params.gsm, var_params.gup, var_params.Iapp, ["gsm", "gup", "Iapp"], 3)
%%
matrixToCsv("neuron_Iappm2_freq.csv", squeeze(out_values(5, :, :, id_m2)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("neuron_Iappm1_freq.csv", squeeze(out_values(5, :, :, id_m1)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("neuron_Iapp0_freq.csv", squeeze(out_values(5, :, :, id_0)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("neuron_Iappp1_freq.csv", squeeze(out_values(5, :, :, id_p1)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("neuron_Iappp2_freq.csv", squeeze(out_values(5, :, :, id_p2)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])

%%

flat = reshape(out_values(7,:,:,:),1,[]);
flat = flat(~isnan(flat));
[sorted, ~] = sort(flat, 'descend');
disp(sorted(1:10));

copy = out_values;
tmp = copy(7,:,:,:);
tmp(tmp > 2.1) = NaN;
copy(7,:,:,:) = tmp;

Disp3DMap(squeeze(copy(7,:,:,:)), var_params.gsm, var_params.gup, var_params.Iapp, ["gsm", "gup", "Iapp"], 3)

matrixToCsv("neuron_Iappm2_b_len.csv", squeeze(copy(7, :, :, id_m2)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("neuron_Iappm1_b_len.csv", squeeze(copy(7, :, :, id_m1)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("neuron_Iapp0_b_len.csv", squeeze(copy(7, :, :, id_0)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("neuron_Iappp1_b_len.csv", squeeze(copy(7, :, :, id_p1)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("neuron_Iappp2_b_len.csv", squeeze(copy(7, :, :, id_p2)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])

%%

id_m2 = find(var_params.Iapp >= -2.0, 1, 'first');
id_m1 = find(var_params.Iapp >= -1.0, 1, 'first');
id_0 = find(var_params.Iapp >= 0.0, 1, 'first');
id_p1 = find(var_params.Iapp >= 1.0, 1, 'first');
id_p2 = find(var_params.Iapp >= 2.0, 1, 'first');

Disp3DMap(squeeze(out_values(8,:,:,:)), var_params.gsm, var_params.gup, var_params.Iapp, ["gsm", "gup", "Iapp"], 3)

matrixToCsv("neuron_Iappm2_p_len.csv", squeeze(out_values(8, :, :, id_m2)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("neuron_Iappm1_p_len.csv", squeeze(out_values(8, :, :, id_m1)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("neuron_Iapp0_p_len.csv", squeeze(out_values(8, :, :, id_0)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("neuron_Iappp1_p_len.csv", squeeze(out_values(8, :, :, id_p1)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("neuron_Iappp2_p_len.csv", squeeze(out_values(8, :, :, id_p2)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])


%%
silent_low_cond = squeeze(copy(1,:,:,:)) == 0;
silent_low = ones(size(silent_low_cond));
silent_low(~silent_low_cond) = NaN;

spiking_cond = squeeze(copy(1,:,:,:)) == 1;
spiking = ones(size(spiking_cond));
spiking(~spiking_cond) = NaN;

bursting_cond = squeeze(copy(1,:,:,:)) == 2;
bursting = ones(size(bursting_cond));
bursting(~bursting_cond) = NaN;

plateau_cond = squeeze(copy(1,:,:,:)) == 3;
plateau = ones(size(plateau_cond));
plateau(~plateau_cond) = NaN;

silent_high_cond = squeeze(copy(1,:,:,:)) == 4;
silent_high = ones(size(silent_high_cond));
silent_high(~silent_high_cond) = NaN;

id_m2 = find(var_params.Iapp >= -2.0, 1, 'first');
id_m1 = find(var_params.Iapp >= -1.0, 1, 'first');
id_0 = find(var_params.Iapp >= 0.0, 1, 'first');
id_p1 = find(var_params.Iapp >= 1.0, 1, 'first');
id_p2 = find(var_params.Iapp >= 2.0, 1, 'first');

matrixToCsv("neuron_Iappm2_s_low.csv", squeeze(silent_low(:, :, id_m2)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("neuron_Iappm2_spiking.csv", squeeze(spiking(:, :, id_m2)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("neuron_Iappm2_bursting.csv", squeeze(bursting(:, :, id_m2)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("neuron_Iappm2_plateau.csv", squeeze(plateau(:, :, id_m2)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("neuron_Iappm2_s_high.csv", squeeze(silent_high(:, :, id_m2)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])

matrixToCsv("neuron_Iappm1_s_low.csv", squeeze(silent_low(:, :, id_m1)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("neuron_Iappm1_spiking.csv", squeeze(spiking(:, :, id_m1)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("neuron_Iappm1_bursting.csv", squeeze(bursting(:, :, id_m1)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("neuron_Iappm1_plateau.csv", squeeze(plateau(:, :, id_m1)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("neuron_Iappm1_s_high.csv", squeeze(silent_high(:, :, id_m1)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])

matrixToCsv("neuron_Iapp0_s_low.csv", squeeze(silent_low(:, :, id_0)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("neuron_Iapp0_spiking.csv", squeeze(spiking(:, :, id_0)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("neuron_Iapp0_bursting.csv", squeeze(bursting(:, :, id_0)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("neuron_Iapp0_plateau.csv", squeeze(plateau(:, :, id_0)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("neuron_Iapp0_s_high.csv", squeeze(silent_high(:, :, id_0)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])

matrixToCsv("neuron_Iappp1_s_low.csv", squeeze(silent_low(:, :, id_p1)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("neuron_Iappp1_spiking.csv", squeeze(spiking(:, :, id_p1)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("neuron_Iappp1_bursting.csv", squeeze(bursting(:, :, id_p1)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("neuron_Iappp1_plateau.csv", squeeze(plateau(:, :, id_p1)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("neuron_Iappp1_s_high.csv", squeeze(silent_high(:, :, id_p1)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])

matrixToCsv("neuron_Iappp2_s_low.csv", squeeze(silent_low(:, :, id_p2)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("neuron_Iappp2_spiking.csv", squeeze(spiking(:, :, id_p2)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("neuron_Iappp2_bursting.csv", squeeze(bursting(:, :, id_p2)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("neuron_Iappp2_plateau.csv", squeeze(plateau(:, :, id_p2)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("neuron_Iappp2_s_high.csv", squeeze(silent_high(:, :, id_p2)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])


%%
model = "test_behaviour_auto_cst_current";

params.gfm = -2.0;
params.gsp = 6.0;
params.gsm = -3;
params.gup = 5;

params.dfm = 0.0;
params.dsp = 0.5;
params.dsm = -0.5;
params.dup = -0.5;

params.Iapp = -1.0;

params.noisePwr = 0;
params.sampleTime = 0.001;

simToCsv("test_sim.csv", model, params, 25);

%% Show Exciatbility

eval_params = struct();

% We will use the same evaluation parameters for all tests

eval_params.StopTime = 20; % Min freq = 1/15 = 0.05 Hz (more like 1 Hz)
eval_params.StartAnalyseTime = 5;
eval_params.func = @postsim_identity;

model = "test_behaviour_auto";

params.gfm = -2.0;
params.gsp = 6.0;
params.gsm = -3;
params.gup = 5;

params.dfm = 0.0;
params.dsp = 0.5;
params.dsm = -0.5;
params.dup = -0.5;

params.noisePwr = 0;
params.sampleTime = 0.001;

time = [0; 4.99; 5; 5.99; 6.0; 6.1];
% -4.0 => -2.6 or -2.7
Iapp = [-4.0; -4.0; -2.7; -2.7; -4.0; -4.0];
time_in = [time, Iapp];

simToCsv("exc_no_burst.csv", model, params, 20, time_in);

% -4.0 => -2.6 or -2.7
Iapp = [-4.0; -4.0; -2.6; -2.6; -4.0; -4.0];
time_in = [time, Iapp];

simToCsv("exc_burst.csv", model, params, 20, time_in);


%% Show Behaviours

eval_params = struct();

% We will use the same evaluation parameters for all tests

eval_params.StopTime = 20; % Min freq = 1/15 = 0.05 Hz (more like 1 Hz)
eval_params.StartAnalyseTime = 5;
eval_params.func = @postsim_identity;

model = "test_behaviour_auto_cst_current";

params.gfm = -2.0;
params.gsp = 6.0;
params.gsm = -3;
params.gup = 5;

params.dfm = 0.0;
params.dsp = 0.5;
params.dsm = -0.5;
params.dup = -0.5;

params.Iapp = -1.0;

params.noisePwr = 0;
params.sampleTime = 0.001;

simToCsv("bursting.csv", model, params, 20);

params.gfm = -2; % Balance between Gsp and Gsm (at the equilibrium point)
params.gsp = 4;
params.gsm = -1;
params.gup = 1;

params.dfm = 0.0;
params.dsp = 0.5;
params.dsm = -0.5;
params.dup = -0.5;

params.Iapp = 0.0;

params.noisePwr = 0;
params.sampleTime = 0.001;

simToCsv("spiking.csv", model, params, 20);

%%

eval_params = struct();

% We will use the same evaluation parameters for all tests

eval_params.StopTime = 20; % Min freq = 1/15 = 0.05 Hz (more like 1 Hz)
eval_params.StartAnalyseTime = 5;
eval_params.func = @postsim_identity;

model = "test_behaviour_auto_cst_current_all_v";

params.gfm = -2.0;
params.gsp = 6.0;
params.gsm = -4;
params.gup = 5;

params.dfm = 0.0;
params.dsp = 0.5;
params.dsm = -0.5;
params.dup = -0.5;

params.Iapp = -1.0;

params.noisePwr = 0;
params.sampleTime = 0.001;

out = single_postsim_sim(model, params, eval_params);
%simToCsv("inside_burst.csv", model, params, 20);

%% Show Exciatbility

eval_params = struct();

% We will use the same evaluation parameters for all tests

eval_params.StopTime = 20; % Min freq = 1/15 = 0.05 Hz (more like 1 Hz)
eval_params.StartAnalyseTime = 5;
eval_params.func = @postsim_identity;

model = "test_behaviour_auto_cst_current";

params.gfm = -2.0;
params.gsp = 6.0;

params.dfm = 0.0;
params.dsp = 0.5;
params.dsm = -0.5;
params.dup = -0.5;

params.Iapp = 0.2;

params.sampleTime = 0.001;

params.gsm = -4;
params.gup = 5;
params.noisePwr = 0;

simToCsv("burst_stable.csv", model, params, 20);

params.noisePwr = 3*10^-7;

simToCsv("burst_stable_noise.csv", model, params, 20);

params.gsm = -0.2;
params.gup = 4;
params.noisePwr = 0;

simToCsv("burst_fragile.csv", model, params, 20);

params.noisePwr = 3*10^-7;

simToCsv("burst_fragile_noise.csv", model, params, 20);

%%


model = "test_behaviour_auto_cst_current";

params = struct();

params.gfm = -2.0;
params.gsp = 6.0;
params.gsm = -2;
params.gup = 6;

params.dfm = 0.0;
params.dsp = 0.5;
params.dsm = -0.5;
params.dup = -0.5;

params.Iapp = -1.0;

params.noisePwr = 0;
params.sampleTime = 0.001;

simToCsv("spiking_ex.csv", model, params, 20);

params = struct();

params.gfm = -2.0;
params.gsp = 6.0;
params.gsm = -4;
params.gup = 6;

params.dfm = 0.0;
params.dsp = 0.5;
params.dsm = -0.5;
params.dup = -0.5;

params.Iapp = -1.0;

params.noisePwr = 0;
params.sampleTime = 0.001;

simToCsv("bursting_ex.csv", model, params, 20);

params = struct();

params.gfm = -2.0;
params.gsp = 6.0;
params.gsm = -6;
params.gup = 6;

params.dfm = 0.0;
params.dsp = 0.5;
params.dsm = -0.5;
params.dup = -0.5;

params.Iapp = -1.0;

params.noisePwr = 0;
params.sampleTime = 0.001;

simToCsv("plateau_ex.csv", model, params, 20);



%%
p = [-2.0, 6.0, -4.0, 5.0,  0.0, 0.5, -0.5, -0.5,  -0.85,  0.0004];
Iapp = -1.0;

fct = @(V, uu) slowModel(V, uu, p, Iapp);

figure(1)
hold on
x = linspace(-1.6, -0.8, 100);
y = linspace(-4, 5, 100);
[X, Y] = meshgrid(x,y);
Z = fct(Y, X);
contour(X, Y, Z, [0, 0])

Z = Y-X;
contour(X, Y, Z, [0, 0])

function du = slowModel(V, uu, p, Iapp)
    % u = (V, u ultraslow)
    Ifm = p(1)*(tanh(V - p(5)) - tanh(p(9) - p(5)));
    Isp = p(2)*(tanh(V - p(6)) - tanh(p(9) - p(6)));
    Ism = p(3)*(tanh(V - p(7)) - tanh(p(9) - p(7)));
    Iup = p(4)*(tanh(uu - p(8)) - tanh(p(9) - p(8)));

    du = (Iapp + p(9) - Ifm - Isp - Ism - Iup - V)*p(10); 
end
