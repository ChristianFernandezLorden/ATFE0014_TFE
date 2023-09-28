%% Plot

model = "test_stability_link_auto_speed_two_motor_neurons";

params = struct();
u_params = struct();

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

u_params.dsyn = 0.0;
u_params.gsyn = -1;

u_params.gsm = -4;
u_params.gup = 5;
u_params.Iapp = -1.5;

SelectValAndPlot(model, params, u_params);

%% Plot

model = "test_stability_link_speed_two_motor_neurons_all";

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

params.dsyn = 0.0;
params.gsyn = -1;

params.rflx_g = 1;
params.max_torque = 10;

simToCsv("two_neuron_sim.csv", model, params, 50);


%%

model = "test_stability_link_auto_speed_two_motor_neurons_mod";

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

params.rflx_g = 2;
params.max_torque = 10;

params.dsyn = 0.0;
params.gsyn = -1;

params.Iapp = -2.8;
params.Iapp_mod = -0.2;
params.dgsm_m_g = -1;
params.dgsm_g = 0.2;
params.bar_amp = 0.78;
params.sr_gain = 2;

simToCsv("neuromod_up.csv", model, params, 30);

%%

model = "test_stability_link_auto_speed_two_motor_neurons_mod";

params.noisePwr = 3*10^-7;
params.sampleTime = 0.001;

params.gfm = -2.0;
params.gsp = 6.0;
params.gsm = -3.3;
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

params.rflx_g = 2;
params.max_torque = 10;

params.dsyn = 0.0;
params.gsyn = -1;

params.Iapp = -2.8;
params.Iapp_mod = -0.2;
params.dgsm_m_g = -1;
params.dgsm_g = 0.2;
params.bar_amp = 0.4;
params.sr_gain = 2;

simToCsv("neuromod_down.csv", model, params, 40);

%% Generate Parameters Map double

eval_params = struct();

nb_par = 100;

% We will use the same evaluation parameters for all tests

eval_params.nbEval = 1;
eval_params.nbOut = 3;
eval_params.StopTime = 25;
eval_params.StartAnalyseTime = 8;
eval_params.func = @postsim_angle_frequency_descrepency;


model = "test_stability_link_auto_sin_two_motor_neurons";

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
params.gsyn = -1;

var_params.gsm = -5.0 : 0.25 : -3.0;
var_params.gup = 4.0 : 0.25 : 6.0;
var_params.Iapp = -2.0 : 0.25 : 0.0;
var_params.rflx_g = [0, 1, 5];
var_params.max_torque = [1, 10];

out_values = parameterChart(params, var_params, model, eval_params, nb_par);
save("Sin_double_Sensory_ParamChart.mat", "out_values", "params", "var_params", "eval_params", "model");


model = "test_stability_link_auto_speed_two_motor_neurons";

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
params.gsyn = -1;

var_params.gsm = -5.0 : 0.25 : -3.0;
var_params.gup = 4.0 : 0.25 : 6.0;
var_params.Iapp = -2.0 : 0.25 : 0.0;
var_params.rflx_g = [1, 5];
var_params.max_torque = [1, 10];

out_values = parameterChart(params, var_params, model, eval_params, nb_par);
save("Speed_double_Sensory_ParamChart.mat", "out_values", "params", "var_params", "eval_params", "model");


model = "test_stability_link_auto_neuron_two_motor_neurons";

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

params.dsyn = 0.0;
params.gsyn = -1;

var_params.gsm = -5.0 : 0.25 : -3.0;
var_params.gup = 4.0 : 0.25 : 6.0;
var_params.Iapp = -2.0 : 0.25 : 0.0;
var_params.gsyn_s = [1, 3];
var_params.max_torque = [1, 10];

out_values = parameterChart(params, var_params, model, eval_params, nb_par);
save("Neuron_double_Sensory_ParamChart.mat", "out_values", "params", "var_params", "eval_params", "model");

%% Montecarlo on basic bursting and eliptic

eval_params = struct();

nb_par = 100;

eval_params.nbEval = 2000;
eval_params.nbOut = 3;
eval_params.StopTime = 25;
eval_params.StartAnalyseTime = 8;
eval_params.func = @postsim_angle_frequency_descrepency;

%nofeed
model = "test_stability_link_auto_sin_two_motor_neurons";

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

params.dsyn = 0.0;
params.gsyn = -1;

var_params.gsm = [-0.1, 0.03];
var_params.gup = [4, 0.05];
var_params.Iapp = [0.0, 0.05];

return_vec = monteCarloTest(params, var_params, model, eval_params, nb_par);

save("Double_Nofeed_monteCarloFragile.mat", "return_vec", "params", "var_params", "eval_params", "model");

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

params.dsyn = 0.0;
params.gsyn = -1;

var_params.gsm = [-4, 0.03];
var_params.gup = [5, 0.05];
var_params.Iapp = [-2, 0.05];

return_vec = monteCarloTest(params, var_params, model, eval_params, nb_par);

save("Double_Nofeed_monteCarloNormal.mat", "return_vec", "params", "var_params", "eval_params", "model");


%sin
model = "test_stability_link_auto_sin_two_motor_neurons";

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

params.dsyn = 0.0;
params.gsyn = -1;

var_params.gsm = [-0.1, 0.03];
var_params.gup = [4, 0.05];
var_params.Iapp = [0.0, 0.05];

return_vec = monteCarloTest(params, var_params, model, eval_params, nb_par);

save("Double_Sin_monteCarloFragile.mat", "return_vec", "params", "var_params", "eval_params", "model");

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

params.dsyn = 0.0;
params.gsyn = -1;

var_params.gsm = [-4, 0.03];
var_params.gup = [5, 0.05];
var_params.Iapp = [-2, 0.05];

return_vec = monteCarloTest(params, var_params, model, eval_params, nb_par);

save("Double_Sin_monteCarloNormal.mat", "return_vec", "params", "var_params", "eval_params", "model");


%speed
model = "test_stability_link_auto_speed_two_motor_neurons";

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

params.dsyn = 0.0;
params.gsyn = -1;

var_params.gsm = [-0.1, 0.03];
var_params.gup = [4, 0.05];
var_params.Iapp = [0.0, 0.05];

return_vec = monteCarloTest(params, var_params, model, eval_params, nb_par);

save("Double_Speed_monteCarloFragile.mat", "return_vec", "params", "var_params", "eval_params", "model");

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

params.dsyn = 0.0;
params.gsyn = -1;

var_params.gsm = [-4, 0.03];
var_params.gup = [5, 0.05];
var_params.Iapp = [-2, 0.05];

return_vec = monteCarloTest(params, var_params, model, eval_params, nb_par);

save("Double_Speed_monteCarloNormal.mat", "return_vec", "params", "var_params", "eval_params", "model");


%neuron
model = "test_stability_link_auto_neuron_two_motor_neurons";

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

params.dsyn = 0.0;
params.gsyn = -1;

var_params.gsm = [-0.1, 0.03];
var_params.gup = [4, 0.05];
var_params.Iapp = [0.0, 0.05];

return_vec = monteCarloTest(params, var_params, model, eval_params, nb_par);

save("Double_Neuron_monteCarloFragile.mat", "return_vec", "params", "var_params", "eval_params", "model");

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

params.dsyn = 0.0;
params.gsyn = -1;

var_params.gsm = [-4, 0.03];
var_params.gup = [5, 0.05];
var_params.Iapp = [-2, 0.05];

return_vec = monteCarloTest(params, var_params, model, eval_params, nb_par);

save("Double_Neuron_monteCarloNormal.mat", "return_vec", "params", "var_params", "eval_params", "model");


%% No feed 

eval_params = struct();
eval_params.StopTime = 40;
eval_params.func = @postsim_identity;

model = "test_stability_link_auto_sin_two_motor_neurons";

params = struct();

params.dfm = 0.0;
params.dsp = 0.5;
params.dsm = -0.5;
params.dup = -0.5;
params.noisePwr = 3*10^-7;
params.sampleTime = 0.001;

params.gfm = -2.0;
params.gsp = 6.0;

params.gsm = -4.8;
params.gup = 4.2;
params.Iapp = 0.0;

params.rflx_g = 0;
params.max_torque = 10;

params.dsyn = 0.0;
params.gsyn = -1;


out = single_postsim_sim(model, params, eval_params);

figure
plot(out.angle.time, squeeze(out.angle.signals.values(:, 1)));
figure
plot(out.angle.time, squeeze(out.angle.signals.values(:, 2)));

%simToCsv("double_nofeed_i0.csv", model, params, 40);


%% Sin 

eval_params = struct();
eval_params.StopTime = 40;
eval_params.func = @postsim_identity;

model = "test_stability_link_auto_sin_two_motor_neurons";

params = struct();

params.dfm = 0.0;
params.dsp = 0.5;
params.dsm = -0.5;
params.dup = -0.5;
params.noisePwr = 3*10^-7;
params.sampleTime = 0.001;

params.gfm = -2.0;
params.gsp = 6.0;

params.gsm = -4.8;
params.gup = 4.2;
params.Iapp = 0.0;

params.rflx_g = 5;
params.max_torque = 10;

params.dsyn = 0.0;
params.gsyn = -1;


%out = single_postsim_sim(model, params, eval_params);

%plot(out.angle.time, squeeze(out.angle.signals.values(:, 1)));

simToCsv("double_sin_i0.csv", model, params, 40);


%% speed 

eval_params = struct();
eval_params.StopTime = 40;
eval_params.func = @postsim_identity;

model = "test_stability_link_auto_speed_two_motor_neurons";

params = struct();

params.dfm = 0.0;
params.dsp = 0.5;
params.dsm = -0.5;
params.dup = -0.5;
params.noisePwr = 3*10^-7;
params.sampleTime = 0.001;

params.gfm = -2.0;
params.gsp = 6.0;

params.gsm = -4.8;
params.gup = 4.2;
params.Iapp = 0.0;

params.rflx_g = 5;
params.max_torque = 10;

params.dsyn = 0.0;
params.gsyn = -1;


%out = single_postsim_sim(model, params, eval_params);

%plot(out.angle.time, squeeze(out.angle.signals.values(:, 1)));

simToCsv("double_speed_i0.csv", model, params, 40);

%% neuron

eval_params = struct();
eval_params.StopTime = 40;
eval_params.func = @postsim_identity;

model = "test_stability_link_auto_neuron_two_motor_neurons";

params = struct();

params.dfm = 0.0;
params.dsp = 0.5;
params.dsm = -0.5;
params.dup = -0.5;
params.noisePwr = 3*10^-7;
params.sampleTime = 0.001;

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

params.gfm = -2.0;
params.gsp = 6.0;

params.gsm = -4.8;
params.gup = 4.2;
params.Iapp = 0.0;

params.rflx_g = 1;
params.max_torque = 10;

params.dsyn = 0.0;
params.gsyn = -1;


%out = single_postsim_sim(model, params, eval_params);

%plot(out.angle.time, squeeze(out.angle.signals.values(:, 1)));

simToCsv("double_neuron_i0.csv", model, params, 40);

%% Speed good


eval_params = struct();
eval_params.StopTime = 40;
eval_params.func = @postsim_identity;

model = "test_stability_link_auto_speed_two_motor_neurons";

params = struct();

params.dfm = 0.0;
params.dsp = 0.5;
params.dsm = -0.5;
params.dup = -0.5;
params.noisePwr = 3*10^-7;
params.sampleTime = 0.001;

params.gfm = -2.0;
params.gsp = 6.0;

params.gsm = -4;
params.gup = 5;
params.Iapp = -2.0;

params.rflx_g = 5;
params.max_torque = 10;

params.dsyn = 0.0;
params.gsyn = -1;


%out = single_postsim_sim(model, params, eval_params);

%plot(out.angle.time, squeeze(out.angle.signals.values(:, 1)));

simToCsv("double_speed_im2.csv", model, params, 40);

%% neuron good

eval_params = struct();
eval_params.StopTime = 40;
eval_params.func = @postsim_identity;

model = "test_stability_link_auto_neuron_two_motor_neurons";

params = struct();

params.dfm = 0.0;
params.dsp = 0.5;
params.dsm = -0.5;
params.dup = -0.5;
params.noisePwr = 3*10^-7;
params.sampleTime = 0.001;

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

params.gfm = -2.0;
params.gsp = 6.0;

params.gsm = -4;
params.gup = 5;
params.Iapp = -2.0;

params.rflx_g = 1;
params.max_torque = 10;

params.dsyn = 0.0;
params.gsyn = -1;


%out = single_postsim_sim(model, params, eval_params);

%plot(out.angle.time, squeeze(out.angle.signals.values(:, 1)));

simToCsv("double_neuron_im2.csv", model, params, 40);

%% Speed bad


eval_params = struct();
eval_params.StopTime = 40;
eval_params.func = @postsim_identity;

model = "test_stability_link_auto_speed_two_motor_neurons";

params = struct();

params.dfm = 0.0;
params.dsp = 0.5;
params.dsm = -0.5;
params.dup = -0.5;
params.noisePwr = 3*10^-7;
params.sampleTime = 0.001;

params.gfm = -2.0;
params.gsp = 6.0;

params.gsm = -4.5;
params.gup = 5;
params.Iapp = -2.0;

params.rflx_g = 5;
params.max_torque = 1;

params.dsyn = 0.0;
params.gsyn = -1;


%out = single_postsim_sim(model, params, eval_params);

%plot(out.angle.time, squeeze(out.angle.signals.values(:, 1)));

simToCsv("double_speed_im2_bad.csv", model, params, 40);

%% neuron bad

eval_params = struct();
eval_params.StopTime = 40;
eval_params.func = @postsim_identity;

model = "test_stability_link_auto_neuron_two_motor_neurons";

params = struct();

params.dfm = 0.0;
params.dsp = 0.5;
params.dsm = -0.5;
params.dup = -0.5;
params.noisePwr = 3*10^-7;
params.sampleTime = 0.001;

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

params.gfm = -2.0;
params.gsp = 6.0;

params.gsm = -4.5;
params.gup = 5;
params.Iapp = -2.0;

params.rflx_g = 1;
params.max_torque = 1;

params.dsyn = 0.0;
params.gsyn = -1;


%out = single_postsim_sim(model, params, eval_params);

%plot(out.angle.time, squeeze(out.angle.signals.values(:, 1)));

simToCsv("double_neuron_im2_bad.csv", model, params, 40);