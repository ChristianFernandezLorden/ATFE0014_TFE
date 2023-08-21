model = "HCO_two_motor_neurons";

params = struct();
u_params = struct();

params.gfm = -2.0;
params.gsp = 6.0;
params.gsm = -3.31;
params.gup = 5;
params.dfm = 0.0;
params.dsp = 0.5;
params.dsm = -0.5;
params.dup = -0.5;
params.Iapp = -2;

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

params.dsyn = 0.0;

params.rflx_g = 1;
params.max_torque = 10;
params.noisePwr = 3*10^-7;
params.sampleTime = 0.001;

u_params.gsyn = -0.8;
u_params.dhco = 0.0;
u_params.ghco = -0.2;

SelectValAndPlot(model, params, u_params);

%%
model = "HCO_two_motor_neurons";


params = struct();
eval_params = struct();

eval_params = struct();
eval_params.StopTime = 60;
eval_params.func = @postsim_identity;

params.gfm = -2.0;
params.gsp = 6.0;
params.gsm = -4;
params.gup = 5;
params.dfm = 0.0;
params.dsp = 0.5;
params.dsm = -0.5;
params.dup = -0.5;
params.Iapp = -2;

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

params.dsyn = 0.0;
params.gsyn = -0.8;

params.rflx_g = 5;
params.max_torque = 10;
params.noisePwr = 3*10^-7;
params.sampleTime = 0.001;

params.dhco = 0.0;
params.ghco = -0.3;

out = single_postsim_sim(model, params, eval_params);

plot(out.angle1.time, squeeze(out.angle1.signals.values(:, 1)), out.angle2.time, squeeze(out.angle2.signals.values(:, 1)));

%simToCsv("hco_no_mod.csv", model, params, 60);


%%
model = "HCO_two_motor_neurons_mod";

params = struct();
u_params = struct();

params.noisePwr = 3*10^-7;
params.sampleTime = 0.001;

params.gfm = -2.0;
params.gsp = 6.0;
params.gsm = -3.5;
params.gup = 5;
params.dfm = 0.0;
params.dsp = 0.5;
params.dsm = -0.5;
params.dup = -0.5;
params.Iapp = -2;

params.gfm_mod = -2.0;
params.gsp_mod = 4.0;
params.gsm_mod = -1;
params.gup_mod = 1;
params.dfm_mod = 0.0;
params.dsp_mod = 0.5;
params.dsm_mod = -0.5;
params.dup_mod = -0.5;
params.Iapp_mod = -0.5;

params.rflx_g = 5;
params.max_torque = 10;

params.dsyn = 0.0;


params.bar_amp = pi/4;
params.buff_amp = pi/60;
params.sr_gain = 2;

u_params.dgsm_g = 0.3;
u_params.gsyn = -0.8;
u_params.dhco = 0.0;
u_params.ghco = -0.3;


SelectValAndPlot(model, params, u_params);

%%
model = "HCO_two_motor_neurons_mod";

params = struct();
eval_params = struct();

eval_params = struct();
eval_params.StopTime = 120;
eval_params.func = @postsim_identity;

params.noisePwr = 3*10^-7;
params.sampleTime = 0.001;

params.gfm = -2.0;
params.gsp = 6.0;
params.gsm = -3.7;
params.gup = 5;
params.dfm = 0.0;
params.dsp = 0.5;
params.dsm = -0.5;
params.dup = -0.5;
params.Iapp = -2;

params.gfm_mod = -2.0;
params.gsp_mod = 4.0;
params.gsm_mod = -1;
params.gup_mod = 1;
params.dfm_mod = 0.0;
params.dsp_mod = 0.5;
params.dsm_mod = -0.5;
params.dup_mod = -0.5;
params.Iapp_mod = -0.5;

params.rflx_g = 5;
params.max_torque = 10;

params.dsyn = 0.0;
params.gsyn = -0.8;

params.dgsm_g = 0.1;
params.bar_amp = 1.5;
params.buff_amp = pi/60;
params.sr_gain = 2;

params.dhco = 0.0;
params.ghco = -0.2;

out = single_postsim_sim(model, params, eval_params);

plot(out.angle1.time, squeeze(out.angle1.signals.values(:, 1)), out.angle2.time, squeeze(out.angle2.signals.values(:, 1)));

%simToCsv("hco_mod.csv", model, params, 120);


%%
model = "HCO_two_motor_neurons_mod_mixed";

params = struct();
u_params = struct();

params.noisePwr = 3*10^-7;
params.sampleTime = 0.001;

params.gfm = -2.0;
params.gsp = 6.0;
params.gsm = -3.5;
params.gup = 5;
params.dfm = 0.0;
params.dsp = 0.5;
params.dsm = -0.5;
params.dup = -0.5;
params.Iapp = -2;

params.gfm_mod = -2.0;
params.gsp_mod = 4.0;
params.gsm_mod = -1;
params.gup_mod = 1;
params.dfm_mod = 0.0;
params.dsp_mod = 0.5;
params.dsm_mod = -0.5;
params.dup_mod = -0.5;
params.Iapp_mod = -0.5;

params.rflx_g = 5;
params.max_torque = 10;

params.dsyn = 0.0;


params.bar_amp = pi/4;
params.buff_amp = pi/60;
params.sr_gain = 2;

u_params.dgsm_g = 0.1;
u_params.gsyn = -0.8;
u_params.dhco = 0.0;
u_params.ghco = -0.3;


SelectValAndPlot(model, params, u_params);

%%
model = "HCO_two_motor_neurons_mod_mixed";

params = struct();
eval_params = struct();

eval_params = struct();
eval_params.StopTime = 60;
eval_params.func = @postsim_identity;

params.noisePwr = 3*10^-7;
params.sampleTime = 0.001;

params.gfm = -2.0;
params.gsp = 6.0;
params.gsm = -3.5;
params.gup = 5;
params.dfm = 0.0;
params.dsp = 0.5;
params.dsm = -0.5;
params.dup = -0.5;
params.Iapp = -2;

params.gfm_mod = -2.0;
params.gsp_mod = 4.0;
params.gsm_mod = -1;
params.gup_mod = 1;
params.dfm_mod = 0.0;
params.dsp_mod = 0.5;
params.dsm_mod = -0.5;
params.dup_mod = -0.5;
params.Iapp_mod = -0.5;

params.rflx_g = 5;
params.max_torque = 10;

params.dsyn = 0.0;
params.gsyn = -0.8;

params.dgsm_g = 0.1;
params.bar_amp = pi/4;
params.buff_amp = pi/60;
params.sr_gain = 2;

params.dhco = 0.0;
params.ghco = -0.3;

%out = single_postsim_sim(model, params, eval_params);

%plot(out.angle1.time, squeeze(out.angle1.signals.values(:, 1)), out.angle2.time, squeeze(out.angle2.signals.values(:, 1)));

simToCsv("hco_mod_mixed.csv", model, params, 120);