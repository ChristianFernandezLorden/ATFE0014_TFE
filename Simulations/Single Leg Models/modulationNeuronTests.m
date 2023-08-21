%% Plots modulation

model = "test_stability_link_auto_speed_two_motor_neurons_mod";


params = struct();
u_params = struct();

params.noisePwr = 3*10^-7;
params.sampleTime = 0.001;

params.gfm = -2.0;
params.gsp = 6.0;
params.gsm = -3;
params.gup = 5;
params.dfm = 0.0;
params.dsp = 0.5;
params.dsm = -0.5;
params.dup = -0.5;

params.gfm_mod = -2.0;
params.gsp_mod = 4.0;
params.gsm_mod = -1;
params.gup_mod = 1;
params.dfm_mod = 0.0;
params.dsp_mod = 0.5;
params.dsm_mod = -0.5;
params.dup_mod = -0.5;

params.rflx_g = 5;
params.max_torque = 10;

params.dsyn = 0.0;
params.gsyn = -1;

u_params.Iapp = -2;
u_params.Iapp_mod = -0.5;
u_params.dgsm_g = 0.2;
u_params.bar_amp = pi/4;
u_params.buff_amp = pi/180;
u_params.sr_gain = 2;


SelectValAndPlot(model, params, u_params);

%% 

model = "test_stability_link_auto_speed_two_neurons_mod_switch";


params = struct();
u_params = struct();

params.noisePwr = 3*10^-7;
params.sampleTime = 0.001;

params.gfm = -2.0;
params.gsp = 6.0;
params.gsm = -3;
params.gup = 5;
params.dfm = 0.0;
params.dsp = 0.5;
params.dsm = -0.5;
params.dup = -0.5;

params.gfm_mod = -2.0;
params.gsp_mod = 4.0;
params.gsm_mod = -1;
params.gup_mod = 1;
params.dfm_mod = 0.0;
params.dsp_mod = 0.5;
params.dsm_mod = -0.5;
params.dup_mod = -0.5;

u_params.rflx_g = 5;
params.max_torque = 10;

params.dsyn = 0.0;
params.gsyn = -1;

params.bar_amp_base = pi/4;

params.switch_time = 30;

u_params.Iapp = -2;
u_params.Iapp_mod = -0.5;
u_params.dgsm_g = 0.2;
u_params.bar_amp = pi/12;
u_params.buff_amp = pi/90;
u_params.sr_gain = 2;


SelectValAndPlot(model, params, u_params);

%% Test


eval_params = struct();

eval_params.nbEval = 1;
eval_params.nbOut = 3;
eval_params.StopTime = 150;
eval_params.StartAnalyseTime = 30;
eval_params.func = @postsim_modulation;


model = "test_stability_link_auto_speed_two_neurons_mod_switch";


params = struct();

params.noisePwr = 3*10^-7;
params.sampleTime = 0.001;

params.gfm = -2.0;
params.gsp = 6.0;
params.gsm = -3;
params.gup = 5;
params.dfm = 0.0;
params.dsp = 0.5;
params.dsm = -0.5;
params.dup = -0.5;

params.gfm_mod = -2.0;
params.gsp_mod = 4.0;
params.gsm_mod = -1;
params.gup_mod = 1;
params.dfm_mod = 0.0;
params.dsp_mod = 0.5;
params.dsm_mod = -0.5;
params.dup_mod = -0.5;

params.rflx_g = 5;
params.max_torque = 10;

params.dsyn = 0.0;
params.gsyn = -1;

params.bar_amp_base = pi/4;

params.switch_time = eval_params.StartAnalyseTime;

params.Iapp = -2;
params.Iapp_mod = -0.5;

params.buff_amp = pi/60;
params.sr_gain = 2;

params.dgsm_g = 0.2;
params.bar_amp = pi/12;

out = single_postsim_sim(model, params, eval_params);


%% Static range param hcart

eval_params = struct();

nb_par = 100;

eval_params.nbEval = 1;
eval_params.nbOut = 3;
eval_params.StopTime = 150;
eval_params.StartAnalyseTime = 30;
eval_params.func = @postsim_modulation;


model = "test_stability_link_auto_speed_two_neurons_mod_switch";

%%
% Amplitude modulation
params = struct();
var_params = struct();

params.noisePwr = 3*10^-7;
params.sampleTime = 0.001;

params.gfm = -2.0;
params.gsp = 6.0;
params.gsm = -3;
params.gup = 5;
params.dfm = 0.0;
params.dsp = 0.5;
params.dsm = -0.5;
params.dup = -0.5;

params.gfm_mod = -2.0;
params.gsp_mod = 4.0;
params.gsm_mod = -1;
params.gup_mod = 1;
params.dfm_mod = 0.0;
params.dsp_mod = 0.5;
params.dsm_mod = -0.5;
params.dup_mod = -0.5;

params.rflx_g = 5;
params.max_torque = 10;

params.dsyn = 0.0;
params.gsyn = -1;

params.bar_amp_base = pi/4;

params.switch_time = eval_params.StartAnalyseTime;

params.Iapp = -2;
params.Iapp_mod = -0.5;

params.buff_amp = pi/60;
params.sr_gain = 2;

var_params.dgsm_g = [0.2, 0.5, 1, 2];
var_params.bar_amp = linspace(pi/12, 3*pi/4, 400);

out_values = parameterChart(params, var_params, model, eval_params, nb_par);
save("Amplitude_Modulation_ParamChart.mat", "out_values", "params", "var_params", "eval_params", "model");


% Gain modulation
params = struct();
var_params = struct();

params.noisePwr = 3*10^-7;
params.sampleTime = 0.001;

params.gfm = -2.0;
params.gsp = 6.0;
params.gsm = -3;
params.gup = 5;
params.dfm = 0.0;
params.dsp = 0.5;
params.dsm = -0.5;
params.dup = -0.5;

params.gfm_mod = -2.0;
params.gsp_mod = 4.0;
params.gsm_mod = -1;
params.gup_mod = 1;
params.dfm_mod = 0.0;
params.dsp_mod = 0.5;
params.dsm_mod = -0.5;
params.dup_mod = -0.5;

params.rflx_g = 5;
params.max_torque = 10;

params.dsyn = 0.0;
params.gsyn = -1;

params.bar_amp_base = pi/4;

params.switch_time = eval_params.StartAnalyseTime;

params.Iapp = -2;
params.Iapp_mod = -0.5;

params.buff_amp = pi/60;
params.sr_gain = 2;

var_params.dgsm_g = linspace(0.2, 2, 400);
var_params.bar_amp = [pi/6, pi/3, pi/2];

out_values = parameterChart(params, var_params, model, eval_params, nb_par);
save("Gain_Modulation_ParamChart.mat", "out_values", "params", "var_params", "eval_params", "model");

%%
% Buff modulation
params = struct();
var_params = struct();

params.noisePwr = 3*10^-7;
params.sampleTime = 0.001;

params.gfm = -2.0;
params.gsp = 6.0;
params.gsm = -3;
params.gup = 5;
params.dfm = 0.0;
params.dsp = 0.5;
params.dsm = -0.5;
params.dup = -0.5;

params.gfm_mod = -2.0;
params.gsp_mod = 4.0;
params.gsm_mod = -1;
params.gup_mod = 1;
params.dfm_mod = 0.0;
params.dsp_mod = 0.5;
params.dsm_mod = -0.5;
params.dup_mod = -0.5;

params.rflx_g = 5;
params.max_torque = 10;

params.dsyn = 0.0;
params.gsyn = -1;

params.bar_amp_base = pi/4;

params.switch_time = eval_params.StartAnalyseTime;

params.Iapp = -2;
params.Iapp_mod = -0.5;


params.sr_gain = 2;

var_params.dgsm_g = [0.2, 0.5, 1, 2];
var_params.bar_amp = [pi/6, pi/3, pi/2];
var_params.buff_amp = linspace(-pi/100, pi/30, 200);

out_values = parameterChart(params, var_params, model, eval_params, nb_par);
save("Buff_Modulation_ParamChart.mat", "out_values", "params", "var_params", "eval_params", "model");

%% Robustness analysis

eval_params = struct();

nb_par = 100;

eval_params.nbEval = 1000;
eval_params.nbOut = 3;
eval_params.StopTime = 200;
eval_params.StartAnalyseTime = 30;
eval_params.func = @postsim_modulation;


model = "test_stability_link_auto_speed_two_neurons_mod_switch";


params = struct();
var_params = struct();

params.noisePwr = 3*10^-7;
params.sampleTime = 0.001;

var_params.gfm = [-2.0, 0.03];
var_params.gsp = [6.0, 0.03];
var_params.gsm = [-3, 0.03];
var_params.gup = [5, 0.03];
var_params.dfm = [0.0, 0.03];
var_params.dsp = [0.5, 0.03];
var_params.dsm = [-0.5, 0.03];
var_params.dup = [-0.5, 0.03];

var_params.gfm_mod = [-2.0, 0.03];
var_params.gsp_mod = [4.0, 0.03];
var_params.gsm_mod = [-1, 0.03];
var_params.gup_mod = [1, 0.03];
var_params.dfm_mod = [0.0, 0.03];
var_params.dsp_mod = [0.5, 0.03];
var_params.dsm_mod = [-0.5, 0.03];
var_params.dup_mod = [-0.5, 0.03];

params.rflx_g = 5;
params.max_torque = 10;

var_params.dsyn = [0.0, 0.03];
var_params.gsyn = [-1, 0.03];

params.bar_amp_base = pi/4;

params.switch_time = eval_params.StartAnalyseTime;

var_params.Iapp = [-2, 0.03];
var_params.Iapp_mod = [-0.5, 0.03];


params.sr_gain = 2;

params.dgsm_g = 1;
params.bar_amp = pi/6;
params.buff_amp = pi/60;

return_vec = monteCarloTest(params, var_params, model, eval_params, nb_par);

save("Modulation_low_fast_Monte.mat", "return_vec", "params", "var_params", "eval_params", "model");


params = struct();
var_params = struct();

params.noisePwr = 3*10^-7;
params.sampleTime = 0.001;

var_params.gfm = [-2.0, 0.03];
var_params.gsp = [6.0, 0.03];
var_params.gsm = [-3, 0.03];
var_params.gup = [5, 0.03];
var_params.dfm = [0.0, 0.03];
var_params.dsp = [0.5, 0.03];
var_params.dsm = [-0.5, 0.03];
var_params.dup = [-0.5, 0.03];

var_params.gfm_mod = [-2.0, 0.03];
var_params.gsp_mod = [4.0, 0.03];
var_params.gsm_mod = [-1, 0.03];
var_params.gup_mod = [1, 0.03];
var_params.dfm_mod = [0.0, 0.03];
var_params.dsp_mod = [0.5, 0.03];
var_params.dsm_mod = [-0.5, 0.03];
var_params.dup_mod = [-0.5, 0.03];

params.rflx_g = 5;
params.max_torque = 10;

var_params.dsyn = [0.0, 0.03];
var_params.gsyn = [-1, 0.03];

params.bar_amp_base = pi/4;

params.switch_time = eval_params.StartAnalyseTime;

var_params.Iapp = [-2, 0.03];
var_params.Iapp_mod = [-0.5, 0.03];


params.sr_gain = 2;

params.dgsm_g = 1;
params.bar_amp = pi/2;
params.buff_amp = pi/60;

return_vec = monteCarloTest(params, var_params, model, eval_params, nb_par);

save("Modulation_high_fast_Monte.mat", "return_vec", "params", "var_params", "eval_params", "model");


params = struct();
var_params = struct();

params.noisePwr = 3*10^-7;
params.sampleTime = 0.001;

var_params.gfm = [-2.0, 0.03];
var_params.gsp = [6.0, 0.03];
var_params.gsm = [-3, 0.03];
var_params.gup = [5, 0.03];
var_params.dfm = [0.0, 0.03];
var_params.dsp = [0.5, 0.03];
var_params.dsm = [-0.5, 0.03];
var_params.dup = [-0.5, 0.03];

var_params.gfm_mod = [-2.0, 0.03];
var_params.gsp_mod = [4.0, 0.03];
var_params.gsm_mod = [-1, 0.03];
var_params.gup_mod = [1, 0.03];
var_params.dfm_mod = [0.0, 0.03];
var_params.dsp_mod = [0.5, 0.03];
var_params.dsm_mod = [-0.5, 0.03];
var_params.dup_mod = [-0.5, 0.03];

params.rflx_g = 5;
params.max_torque = 10;

var_params.dsyn = [0.0, 0.03];
var_params.gsyn = [-1, 0.03];

params.bar_amp_base = pi/4;

params.switch_time = eval_params.StartAnalyseTime;

var_params.Iapp = [-2, 0.03];
var_params.Iapp_mod = [-0.5, 0.03];


params.sr_gain = 2;

params.dgsm_g = 0.5;
params.bar_amp = pi/6;
params.buff_amp = pi/60;

return_vec = monteCarloTest(params, var_params, model, eval_params, nb_par);

save("Modulation_low_slow_Monte.mat", "return_vec", "params", "var_params", "eval_params", "model");


params = struct();
var_params = struct();

params.noisePwr = 3*10^-7;
params.sampleTime = 0.001;

var_params.gfm = [-2.0, 0.03];
var_params.gsp = [6.0, 0.03];
var_params.gsm = [-3, 0.03];
var_params.gup = [5, 0.03];
var_params.dfm = [0.0, 0.03];
var_params.dsp = [0.5, 0.03];
var_params.dsm = [-0.5, 0.03];
var_params.dup = [-0.5, 0.03];

var_params.gfm_mod = [-2.0, 0.03];
var_params.gsp_mod = [4.0, 0.03];
var_params.gsm_mod = [-1, 0.03];
var_params.gup_mod = [1, 0.03];
var_params.dfm_mod = [0.0, 0.03];
var_params.dsp_mod = [0.5, 0.03];
var_params.dsm_mod = [-0.5, 0.03];
var_params.dup_mod = [-0.5, 0.03];

params.rflx_g = 5;
params.max_torque = 10;

var_params.dsyn = [0.0, 0.03];
var_params.gsyn = [-1, 0.03];

params.bar_amp_base = pi/4;

params.switch_time = eval_params.StartAnalyseTime;

var_params.Iapp = [-2, 0.03];
var_params.Iapp_mod = [-0.5, 0.03];


params.sr_gain = 2;

params.dgsm_g = 0.5;
params.bar_amp = pi/2;
params.buff_amp = pi/60;

return_vec = monteCarloTest(params, var_params, model, eval_params, nb_par);

save("Modulation_high_slow_Monte.mat", "return_vec", "params", "var_params", "eval_params", "model");


%% Sim with var ref

eval_params = struct();
eval_params.StopTime = 100;
eval_params.func = @postsim_identity;

model = "test_stability_link_auto_speed_two_neurons_mod_time";


params = struct();

params.noisePwr = 3*10^-7;
params.sampleTime = 0.001;

params.gfm = -2.0;
params.gsp = 6.0;
params.gsm = -3;
params.gup = 5;
params.dfm = 0.0;
params.dsp = 0.5;
params.dsm = -0.5;
params.dup = -0.5;

params.gfm_mod = -2.0;
params.gsp_mod = 4.0;
params.gsm_mod = -1;
params.gup_mod = 1;
params.dfm_mod = 0.0;
params.dsp_mod = 0.5;
params.dsm_mod = -0.5;
params.dup_mod = -0.5;

params.rflx_g = 5;
params.max_torque = 10;

params.dsyn = 0.0;
params.gsyn = -1;

params.Iapp = -2;
params.Iapp_mod = -0.5;

params.buff_amp = pi/60;
params.sr_gain = 2;

params.dgsm_g = 0.5;

max_t = 110;
switch_t = 30;
time_sin = linspace(switch_t, max_t, 2000);
time = [0 time_sin];
base_amp = pi/3;
sin_amp = base_amp + base_amp*sin(pi*(time_sin-switch_t)/50)/2;
amp = [base_amp sin_amp];

time_in = [time', amp'];

simToCsv("modulation_in_time.csv", model, params, max_t, time_in);