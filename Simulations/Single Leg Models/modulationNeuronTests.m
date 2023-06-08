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