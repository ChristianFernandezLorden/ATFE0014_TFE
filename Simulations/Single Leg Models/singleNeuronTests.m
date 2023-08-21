%% Plot activation

u = linspace(-pi, pi, 100);
du = linspace(-4, 4, 100);

[X,Y] = meshgrid(u,du);
uy = (1-tanh(5*sin(X)))/2 -1;
duy = (tanh(5*(Y+0.5)) - tanh(5*(Y-0.5)))/2 - 1;
data = uy + duy;

y = [du(1), du(end)];
x = [u(1), u(end)];
image(x, y, data, 'CDataMapping','scaled');
colorbar


%% No sensory link strength test

params.gfm = -2.0;
params.gsp = 6.0;
params.dfm = 0.0;
params.dsp = 0.5;
params.dsm = -0.5;
params.dup = -0.5;

params.rflx_g = 1;
params.max_torque = 10;
params.noisePwr = 3*10^-7;
params.sampleTime = 0.001;

var_params.gsm = [-0.1, 0.03];
var_params.gup = [3, 0.05];
var_params.Iapp = [0.0, 0.05];

u_params.gsm = var_params.gsm(1);
u_params.gup = var_params.gup(1);
u_params.Iapp = var_params.Iapp(1);

model = "test_stability_link_auto_tmp";

eval_params.nbEval = 1000;
eval_params.nbOut = 2;
eval_params.StopTime = 20;
eval_params.StartAnalyseTime = 5;
eval_params.func = @postsim_angle_frequency_descrepency;

nb_par = 200;

%return_vec = monteCarloTest(params, var_params, model, eval_params, nb_par);
SelectValAndPlot(model, params, u_params);

%save("monteCarloEliptic.mat", "return_vec", "params", "var_params", "model", "eval_params", "nb_par")


var_params.gsm = -5:0.25:-3;
var_params.gup = 4:0.25:6;
var_params.Iapp = -3:0.25:-1;
eval_params.nbEval = 3;

out_v = parameterChart(params, var_params, model, eval_params, nb_par);

%% Sensory with inhibition test
model = "test_stability_link_auto_neuron_sense_feedback";

params = struct();
var_params = struct();
u_params = struct();

params.Iapp = -2;
params.gfm = -2.0;
params.gsp = 6.0;
params.gsm = -4.0;
params.gup = 5.0;
params.dfm = 0.0;
params.dsp = 0.5;
params.dsm = -0.5;
params.dup = -0.5;


params.gfm_s = -2; % Balance between Gsp and Gsm (at the equilibrium point)
params.gsp_s = 4;
params.gsm_s = -1;
params.gup_s = 1;
params.dfm_s = 0.0;
params.dsp_s = 0.5;
params.dsm_s = -0.5;
params.dup_s = -0.5;


params.max_torque = 10;
params.noisePwr = 3*10^-7;
params.sampleTime = 0.001;

var_params.gsyn_sm = [1.5, 0.01];
var_params.dsyn_sm = [-0.5, 0.01];

var_params.gsyn_ms = [-1.5, 0.01];
var_params.dsyn_ms = [-0.5, 0.01];

u_params.gsyn_sm = var_params.gsyn_sm(1);
u_params.dsyn_sm = var_params.dsyn_sm(1);

u_params.gsyn_ms = var_params.gsyn_ms(1);
u_params.dsyn_ms = var_params.dsyn_ms(1);
u_params.Iapp_s = 0.0;
u_params.rflx_g = 1;

SelectValAndPlot(model, params, u_params);

%% Speed test
model = "test_stability_link_auto_speed";

params = struct();
u_params = struct();

u_params.gfm = -2.0;
u_params.gsp = 6.0;
u_params.gsm = -4.0;
u_params.gup = 5.0;
params.dfm = 0.0;
params.dsp = 0.5;
params.dsm = -0.5;
params.dup = -0.5;

params.max_torque = 10;
params.noisePwr = 3*10^-7;
params.sampleTime = 0.001;

u_params.Iapp = -2;
u_params.rflx_g = 1;

SelectValAndPlot(model, params, u_params);


%% Test 

model = "test_stability_link_auto_speed";

params = struct();

params.noisePwr = 3*10^-7;
params.sampleTime = 0.001;

params.gfm = -2.0;
params.gsp = 6.0;
params.gsm = -4;
params.gup = 5;
params.dfm = 0.0;
params.dsp = 0.5;
params.dsm = -0.5;
params.dup = -0.5;
params.Iapp = -2.0;

params.rflx_g = 1;
params.max_torque = 10;

simToCsv("one_neuron_sim.csv", model, params, 50);


%% Generate Parameters Map

eval_params = struct();

nb_par = 100;

% We will use the same evaluation parameters for all tests

eval_params.nbEval = 1;
eval_params.nbOut = 3;
eval_params.StopTime = 25;
eval_params.StartAnalyseTime = 8;
eval_params.func = @postsim_angle_frequency_descrepency;


model = "test_stability_link_auto";

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

var_params.gsm = -5.0 : 0.2 : -3.0;
var_params.gup = 4.0 : 0.2 : 6.0;
var_params.Iapp = -2.0 : 0.2 : 0.0;
var_params.rflx_g = [0, 1, 5];
var_params.max_torque = [1, 3, 10];

out_values = parameterChart(params, var_params, model, eval_params, nb_par);
save("Sin_Sensory_ParamChart.mat", "out_values", "params", "var_params", "eval_params", "model");


model = "test_stability_link_auto_speed";

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

var_params.gsm = -5.0 : 0.2 : -3.0;
var_params.gup = 4.0 : 0.2 : 6.0;
var_params.Iapp = -2.0 : 0.2 : 0.0;
var_params.rflx_g = [1, 5];
var_params.max_torque = [1, 3, 10];

out_values = parameterChart(params, var_params, model, eval_params, nb_par);
save("Speed_Sensory_ParamChart.mat", "out_values", "params", "var_params", "eval_params", "model");


model = "test_stability_link_auto_neuron_sense";

params = struct();
var_params = struct();

params.gfm = -2.0;
params.gsp = 6.0;
params.dfm = 0.0;
params.dsp = 0.5;
params.dsm = -0.5;
params.dup = -0.5;

% Param for sensing neuron
params.Iapp_s = 0.1;
params.gfm_s = -2; % Balance between Gsp and Gsm (at the equilibrium point)
params.gsp_s = 4;
params.gsm_s = -1;
params.gup_s = 1;
params.dfm_s = 0.0;
params.dsp_s = 0.5;
params.dsm_s = -0.5;
params.dup_s = -0.5;

params.dsyn_s = -0.5;
params.rflx_g = 1;

params.noisePwr = 3*10^-7;
params.sampleTime = 0.001;

var_params.gsm = -5.0 : 0.2 : -3.0;
var_params.gup = 4.0 : 0.2 : 6.0;
var_params.Iapp = -2.0 : 0.2 : 0.0;
var_params.gsyn_s = [1, 3];
var_params.max_torque = [1, 3, 10];

out_values = parameterChart(params, var_params, model, eval_params, nb_par);
save("Neuron_Sensory_ParamChart.mat", "out_values", "params", "var_params", "eval_params", "model");


%% Montecarlo on basic bursting and eliptic

eval_params = struct();

nb_par = 100;

eval_params.nbEval = 2000;
eval_params.nbOut = 3;
eval_params.StopTime = 25;
eval_params.StartAnalyseTime = 8;
eval_params.func = @postsim_angle_frequency_descrepency;

%nofeed
model = "test_stability_link_auto";

params = struct();
var_params = struct();

params.gfm = -2.0;
params.gsp = 6.0;
params.dfm = 0.0;
params.dsp = 0.5;
params.dsm = -0.5;
params.dup = -0.5;

params.rflx_g = 0;
params.max_torque = 10;
params.noisePwr = 3*10^-7;
params.sampleTime = 0.001;

var_params.gsm = [-0.1, 0.03];
var_params.gup = [4, 0.05];
var_params.Iapp = [0.0, 0.05];

return_vec = monteCarloTest(params, var_params, model, eval_params, nb_par);

save("Nofeed_monteCarloFragile.mat", "return_vec", "params", "var_params", "eval_params", "model");

params = struct();
var_params = struct();

params.gfm = -2.0;
params.gsp = 6.0;
params.dfm = 0.0;
params.dsp = 0.5;
params.dsm = -0.5;
params.dup = -0.5;

params.rflx_g = 0;
params.max_torque = 10;
params.noisePwr = 3*10^-7;
params.sampleTime = 0.001;

var_params.gsm = [-4, 0.03];
var_params.gup = [5, 0.05];
var_params.Iapp = [-2, 0.05];

return_vec = monteCarloTest(params, var_params, model, eval_params, nb_par);

save("Nofeed_monteCarloNormal.mat", "return_vec", "params", "var_params", "eval_params", "model");


%sin
model = "test_stability_link_auto";

params = struct();
var_params = struct();

params.gfm = -2.0;
params.gsp = 6.0;
params.dfm = 0.0;
params.dsp = 0.5;
params.dsm = -0.5;
params.dup = -0.5;

params.rflx_g = 5;
params.max_torque = 10;
params.noisePwr = 3*10^-7;
params.sampleTime = 0.001;

var_params.gsm = [-0.1, 0.03];
var_params.gup = [4, 0.05];
var_params.Iapp = [0.0, 0.05];

return_vec = monteCarloTest(params, var_params, model, eval_params, nb_par);

save("Sin_monteCarloFragile.mat", "return_vec", "params", "var_params", "eval_params", "model");

params = struct();
var_params = struct();

params.gfm = -2.0;
params.gsp = 6.0;
params.dfm = 0.0;
params.dsp = 0.5;
params.dsm = -0.5;
params.dup = -0.5;

params.rflx_g = 5;
params.max_torque = 10;
params.noisePwr = 3*10^-7;
params.sampleTime = 0.001;

var_params.gsm = [-4, 0.03];
var_params.gup = [5, 0.05];
var_params.Iapp = [-2, 0.05];

return_vec = monteCarloTest(params, var_params, model, eval_params, nb_par);

save("Sin_monteCarloNormal.mat", "return_vec", "params", "var_params", "eval_params", "model");


%speed
model = "test_stability_link_auto_speed";

params = struct();
var_params = struct();

params.gfm = -2.0;
params.gsp = 6.0;
params.dfm = 0.0;
params.dsp = 0.5;
params.dsm = -0.5;
params.dup = -0.5;

params.rflx_g = 5;
params.max_torque = 10;
params.noisePwr = 3*10^-7;
params.sampleTime = 0.001;

var_params.gsm = [-0.1, 0.03];
var_params.gup = [4, 0.05];
var_params.Iapp = [0.0, 0.05];

return_vec = monteCarloTest(params, var_params, model, eval_params, nb_par);

save("Speed_monteCarloFragile.mat", "return_vec", "params", "var_params", "eval_params", "model");

params = struct();
var_params = struct();

params.gfm = -2.0;
params.gsp = 6.0;
params.dfm = 0.0;
params.dsp = 0.5;
params.dsm = -0.5;
params.dup = -0.5;

params.rflx_g = 5;
params.max_torque = 10;
params.noisePwr = 3*10^-7;
params.sampleTime = 0.001;

var_params.gsm = [-4, 0.03];
var_params.gup = [5, 0.05];
var_params.Iapp = [-2, 0.05];

return_vec = monteCarloTest(params, var_params, model, eval_params, nb_par);

save("Speed_monteCarloNormal.mat", "return_vec", "params", "var_params", "eval_params", "model");


%neuron
model = "test_stability_link_auto_neuron_sense";

params = struct();
var_params = struct();

params.gfm = -2.0;
params.gsp = 6.0;
params.dfm = 0.0;
params.dsp = 0.5;
params.dsm = -0.5;
params.dup = -0.5;

% Param for sensing neuron
params.Iapp_s = 0.1;
params.gfm_s = -2; % Balance between Gsp and Gsm (at the equilibrium point)
params.gsp_s = 4;
params.gsm_s = -1;
params.gup_s = 1;
params.dfm_s = 0.0;
params.dsp_s = 0.5;
params.dsm_s = -0.5;
params.dup_s = -0.5;

params.dsyn_s = -0.5;
params.gsyn_s = 3;

params.rflx_g = 1;
params.max_torque = 10;
params.noisePwr = 3*10^-7;
params.sampleTime = 0.001;

var_params.gsm = [-0.1, 0.03];
var_params.gup = [4, 0.05];
var_params.Iapp = [0.0, 0.05];

return_vec = monteCarloTest(params, var_params, model, eval_params, nb_par);

save("Neuron_monteCarloFragile.mat", "return_vec", "params", "var_params", "eval_params", "model");

params = struct();
var_params = struct();

params.gfm = -2.0;
params.gsp = 6.0;
params.dfm = 0.0;
params.dsp = 0.5;
params.dsm = -0.5;
params.dup = -0.5;

% Param for sensing neuron
params.Iapp_s = 0.1;
params.gfm_s = -2; % Balance between Gsp and Gsm (at the equilibrium point)
params.gsp_s = 4;
params.gsm_s = -1;
params.gup_s = 1;
params.dfm_s = 0.0;
params.dsp_s = 0.5;
params.dsm_s = -0.5;
params.dup_s = -0.5;

params.dsyn_s = -0.5;
params.gsyn_s = 3;

params.rflx_g = 1;
params.max_torque = 10;
params.noisePwr = 3*10^-7;
params.sampleTime = 0.001;

var_params.gsm = [-4, 0.03];
var_params.gup = [5, 0.05];
var_params.Iapp = [-2, 0.05];

return_vec = monteCarloTest(params, var_params, model, eval_params, nb_par);

save("Neuron_monteCarloNormal.mat", "return_vec", "params", "var_params", "eval_params", "model");

%%

% nofeed

model = "test_stability_link_auto";

params = struct();

params.Iapp = 0;
params.gfm = -2.0;
params.gsp = 6.0;
params.gsm = -5.0;
params.gup = 4.0;
params.dfm = 0.0;
params.dsp = 0.5;
params.dsm = -0.5;
params.dup = -0.5;

params.max_torque = 10;
params.noisePwr = 3*10^-7;
params.sampleTime = 0.001;

params.rflx_g = 0;

simToCsv("single_nofeed_i0.csv", model, params, 25);

%%

% sin

model = "test_stability_link_auto";

params = struct();

params.Iapp = 0;
params.gfm = -2.0;
params.gsp = 6.0;
params.gsm = -5.0;
params.gup = 4.0;
params.dfm = 0.0;
params.dsp = 0.5;
params.dsm = -0.5;
params.dup = -0.5;

params.max_torque = 10;
params.noisePwr = 3*10^-7;
params.sampleTime = 0.001;

params.rflx_g = 0;

simToCsv("single_sin_i0.csv", model, params, 25);

%%
% speed

model = "test_stability_link_auto_speed";

params = struct();

params.Iapp = 0;
params.gfm = -2.0;
params.gsp = 6.0;
params.gsm = -5;
params.gup = 5.0;
params.dfm = 0.0;
params.dsp = 0.5;
params.dsm = -0.5;
params.dup = -0.5;

params.max_torque = 1;
params.noisePwr = 3*10^-7;
params.sampleTime = 0.001;

params.rflx_g = 1;

simToCsv("single_speed_im2_low.csv", model, params, 25);

%%
% neuron

model = "test_stability_link_auto_neuron_sense";

params = struct();

params.Iapp = -2;
params.gfm = -2.0;
params.gsp = 6.0;
params.gsm = -5;
params.gup = 5.0;
params.dfm = 0.0;
params.dsp = 0.5;
params.dsm = -0.5;
params.dup = -0.5;


params.gfm_s = -2; % Balance between Gsp and Gsm (at the equilibrium point)
params.gsp_s = 4;
params.gsm_s = -1;
params.gup_s = 1;
params.dfm_s = 0.0;
params.dsp_s = 0.5;
params.dsm_s = -0.5;
params.dup_s = -0.5;


params.max_torque = 1;
params.noisePwr = 3*10^-7;
params.sampleTime = 0.001;

params.dsyn_s = -0.5;
params.gsyn_s = 1;

params.Iapp_s = 0.1;
params.rflx_g = 1;

simToCsv("single_neuron_im2_low.csv", model, params, 25);



%% From Struct to Workspace

fixed_param_fields = fieldnames(params);
for k = 1:length(fixed_param_fields)
    name = fixed_param_fields{k};
    eval_str = sprintf('%s = %f',name, params.(name));
    eval(eval_str);
end
updatable_params_fields = fieldnames(u_params);
for k = 1:length(updatable_params_fields)
    name = updatable_params_fields{k};
    eval_str = sprintf('%s = %f',name, u_params.(name));
    eval(eval_str);
end
