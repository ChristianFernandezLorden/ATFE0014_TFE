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

params.Iapp_s = -0.2;
params.gfm_s = -2; % Balance between Gsp and Gsm (at the equilibrium point)
params.gsp_s = 4;
params.gsm_s = -1;
params.gup_s = 1;
params.dfm_s = 0.0;
params.dsp_s = 0.5;
params.dsm_s = -0.5;
params.dup_s = -0.5;

params.rflx_g = 1;
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

SelectValAndPlot(model, params, u_params);


%% Generate Parameters Map


eval_params = struct();

nb_par = 100;

% We will use the same evaluation parameters for all tests

eval_params.nbEval = 1;
eval_params.nbOut = 2;
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

var_params.gup = 4.0 : 0.2 : 6.0;
var_params.gsm = -5.0 : 0.2 : -3.0;
var_params.Iapp = -2.0 : 0.2 : 0.0;
var_params.rflx_g = [0, 1, 5];
var_params.max_torque = [1, 3, 10];

out_values = parameterChart(params, var_params, model, eval_params, nb_par);
save("Sin_Sensory_ParamChart.mat", "out_values", "params", "var_params");


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

var_params.gup = 4.0 : 0.2 : 6.0;
var_params.gsm = -5.0 : 0.2 : -3.0;
var_params.Iapp = -2.0 : 0.2 : 0.0;
var_params.rflx_g = [0, 1, 5];
var_params.max_torque = [1, 3, 10];

out_values = parameterChart(params, var_params, model, eval_params, nb_par);
save("Speed_Sensory_ParamChart.mat", "out_values", "params", "var_params");


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
params.Iapp_s = 0.0;
params.gfm_s = -2; % Balance between Gsp and Gsm (at the equilibrium point)
params.gsp_s = 4;
params.gsm_s = -1;
params.gup_s = 1;
params.dfm_s = 0.0;
params.dsp_s = 0.5;
params.dsm_s = -0.5;
params.dup_s = -0.5;

params.gsyn_s = -0.5;
params.dsyn_s = 0.5;

params.noisePwr = 3*10^-7;
params.sampleTime = 0.001;

var_params.gup = 4.0 : 0.25 : 6.0;
var_params.gsm = -5.0 : 0.25 : -3.0;
var_params.Iapp = -2.0 : 0.25 : 0.0;
var_params.gsyn_s = -1.5 : 0.6 : -0.3;
var_params.rflx_g = [0.05, 0.1, 0.2];
var_params.max_torque = [1, 3, 10];

out_values = parameterChart(params, var_params, model, eval_params, nb_par);
save("Neuron_Sensory_ParamChart.mat", "out_values", "params", "var_params");


%% Montecarlo on basic bursting and eliptic

eval_params = struct();

nb_par = 100;

eval_params.nbEval = 1000;
eval_params.nbOut = 2;
eval_params.StopTime = 20;
eval_params.StartAnalyseTime = 5;
eval_params.func = @postsim_angle_frequency_descrepency;


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

params.rflx_g = 1;
params.max_torque = 10;
params.noisePwr = 3*10^-7;
params.sampleTime = 0.001;

var_params.gsm = [-0.1, 0.03];
var_params.gup = [3, 0.05];
var_params.Iapp = [0.0, 0.05];

return_vec = monteCarloTest(params, var_params, model, eval_params, nb_par);

save("Sin_monteCarloEliptic.mat", "return_vec", "params", "var_params")

params = struct();
var_params = struct();

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

var_params.gsm = [-4, 0.03];
var_params.gup = [5, 0.05];
var_params.Iapp = [-1.5, 0.05];

return_vec = monteCarloTest(params, var_params, model, eval_params, nb_par);

save("Sin_monteCarloNormal.mat", "return_vec", "params", "var_params")


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

params.rflx_g = 1;
params.max_torque = 10;
params.noisePwr = 3*10^-7;
params.sampleTime = 0.001;

var_params.gsm = [-0.1, 0.03];
var_params.gup = [3, 0.05];
var_params.Iapp = [0.0, 0.05];

return_vec = monteCarloTest(params, var_params, model, eval_params, nb_par);

save("Speed_monteCarloEliptic.mat", "return_vec", "params", "var_params")

params = struct();
var_params = struct();

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

var_params.gsm = [-4, 0.03];
var_params.gup = [5, 0.05];
var_params.Iapp = [-1.5, 0.05];

return_vec = monteCarloTest(params, var_params, model, eval_params, nb_par);

save("Speed_monteCarloNormal.mat", "return_vec", "params", "var_params")


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
params.Iapp_s = 0.0;
params.gfm_s = -2; % Balance between Gsp and Gsm (at the equilibrium point)
params.gsp_s = 4;
params.gsm_s = -1;
params.gup_s = 1;
params.dfm_s = 0.0;
params.dsp_s = 0.5;
params.dsm_s = -0.5;
params.dup_s = -0.5;

params.gsyn_s = -0.5;
params.dsyn_s = 0.5;

params.rflx_g = 1;
params.max_torque = 10;
params.noisePwr = 3*10^-7;
params.sampleTime = 0.001;

var_params.gsm = [-0.1, 0.03];
var_params.gup = [3, 0.05];
var_params.Iapp = [0.0, 0.05];

return_vec = monteCarloTest(params, var_params, model, eval_params, nb_par);

save("Neuron_monteCarloEliptic.mat", "return_vec", "params", "var_params")

params = struct();
var_params = struct();

params.gfm = -2.0;
params.gsp = 6.0;
params.dfm = 0.0;
params.dsp = 0.5;
params.dsm = -0.5;
params.dup = -0.5;

% Param for sensing neuron
params.Iapp_s = 0.0;
params.gfm_s = -2; % Balance between Gsp and Gsm (at the equilibrium point)
params.gsp_s = 4;
params.gsm_s = -1;
params.gup_s = 1;
params.dfm_s = 0.0;
params.dsp_s = 0.5;
params.dsm_s = -0.5;
params.dup_s = -0.5;

params.gsyn_s = -0.5;
params.dsyn_s = 0.5;

params.rflx_g = 1;
params.max_torque = 10;
params.noisePwr = 3*10^-7;
params.sampleTime = 0.001;

var_params.gsm = [-4, 0.03];
var_params.gup = [5, 0.05];
var_params.Iapp = [-1.5, 0.05];

return_vec = monteCarloTest(params, var_params, model, eval_params, nb_par);

save("Neuron_monteCarloNormal.mat", "return_vec", "params", "var_params")

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