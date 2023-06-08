%% Plot

model = "test_cpg_auto";

params = struct();
u_params = struct();

params.gfm = -2.0;
params.gsp = 6.0;
params.dfm = 0.0;
params.dsp = 0.5;
params.dsm = -0.5;
params.dup = -0.5;

params.noisePwr = 3*10^-7;
params.sampleTime = 0.001;

u_params.dsyn = 0.0;
u_params.gsyn = -0.2;

u_params.gsm = -4;
u_params.gup = 5;
u_params.Iapp = -1.5;

SelectValAndPlot(model, params, u_params);

%% Find firing point

eval_params = struct();

nb_par = 100;

% We will use the same evaluation parameters for all tests

eval_params.nbEval = 1;
eval_params.nbOut = 1;
eval_params.StopTime = 20;
eval_params.StartAnalyseTime = 10;
eval_params.func = @postsim_bursting;

gup_vec = 2.0 : 0.03 : 6.0;
Iapp_vec = -3 : 0.03 : 0.0;
gsyn_vec = [-2.0, -1.0, -0.5, -0.2];

%% CPG model

model = "test_cpg_auto";

params = struct();
var_params = struct();

params.gfm = -2.0;
params.gsp = 6.0;
params.dfm = 0.0;
params.dsp = 0.5;
params.dsm = -0.5;
params.dup = -0.5;

params.noisePwr = 3*10^-7;
params.sampleTime = 0.001;

params.dsyn = 0.0;

params.gsm = -4;
var_params.gup = gup_vec;
var_params.Iapp = Iapp_vec;
var_params.gsyn = gsyn_vec;


out_values = squeeze(parameterChart(params, var_params, model, eval_params, nb_par));
out_values_cpg = out_values;
save("CPG_activation.mat", "out_values", "params", "var_params", "eval_params", "model");

Disp3DMap(out_values_cpg, var_params.gup, var_params.Iapp, var_params.gsyn, ["gup", "Iapp", "gsyn"], 3)

matrixToCsv("cpg_activation_gsyn0.2.csv", out_values_cpg(:,:,4), {var_params.gup, var_params.Iapp}, ["gup", "Iapp"])
matrixToCsv("cpg_activation_gsyn0.5.csv", out_values_cpg(:,:,3), {var_params.gup, var_params.Iapp}, ["gup", "Iapp"])
matrixToCsv("cpg_activation_gsyn1.0.csv", out_values_cpg(:,:,2), {var_params.gup, var_params.Iapp}, ["gup", "Iapp"])
matrixToCsv("cpg_activation_gsyn2.0.csv", out_values_cpg(:,:,1), {var_params.gup, var_params.Iapp}, ["gup", "Iapp"])

%% Compare with single neuron
model = "test_behaviour_auto_cst_current";

params = struct();
var_params = struct();

params.gfm = -2.0;
params.gsp = 6.0;
params.dfm = 0.0;
params.dsp = 0.5;
params.dsm = -0.5;
params.dup = -0.5;

params.noisePwr = 3*10^-7;
params.sampleTime = 0.001;

params.gsm = -4;
var_params.gup = gup_vec;
var_params.Iapp = Iapp_vec;

out_values = squeeze(parameterChart(params, var_params, model, eval_params, nb_par));
out_values_neuron = out_values;
save("SingleNeuron_activation.mat", "out_values", "params", "var_params", "eval_params", "model");
figure
x = [var_params.gup(1), var_params.gup(end)];
y = [var_params.Iapp(1), var_params.Iapp(end)];
image(y, x, out_values_neuron, 'CDataMapping','scaled', 'AlphaData',~isnan(out_values_neuron));
colorbar

matrixToCsv("single_neuron_activation.csv", out_values_neuron, {var_params.gup, var_params.Iapp}, ["gup", "Iapp"])

%% Comprison between CPG and single neuron
cpg_only_burst = out_values_cpg;
normal_burstings = repmat(~isnan(out_values_neuron), 1, 1, size(cpg_only_burst, 3)); % Points where the single neuron is bursting
cpg_only_burst(normal_burstings) = NaN; % Put single neuron bursting to NaN

matrixToCsv("cpg_only_activation_gsyn0.2.csv", cpg_only_burst(:,:,4), {var_params.gup, var_params.Iapp}, ["gup", "Iapp"])
matrixToCsv("cpg_only_activation_gsyn0.5.csv", cpg_only_burst(:,:,3), {var_params.gup, var_params.Iapp}, ["gup", "Iapp"])
matrixToCsv("cpg_only_activation_gsyn1.0.csv", cpg_only_burst(:,:,2), {var_params.gup, var_params.Iapp}, ["gup", "Iapp"])
matrixToCsv("cpg_only_activation_gsyn2.0.csv", cpg_only_burst(:,:,1), {var_params.gup, var_params.Iapp}, ["gup", "Iapp"])


var_params.gsyn = gsyn_vec;
Disp3DMap(cpg_squeeze, var_params.gup, var_params.Iapp, var_params.gsyn, ["gup", "Iapp", "gsyn"], 3)


%%

model = "test_cpg_auto";

params = struct();
var_params = struct();

params.gfm = -2.0;
params.gsp = 6.0;
params.dfm = 0.0;
params.dsp = 0.5;
params.dsm = -0.5;
params.dup = -0.5;

params.noisePwr = 3*10^-7;
params.sampleTime = 0.001;

params.dsyn = 0.0;

params.gsm = -4;
params.gup = 3.7;
params.Iapp = -1;
params.gsyn = -1;

simToCsv("network_bursting.csv", model, params, 25);

