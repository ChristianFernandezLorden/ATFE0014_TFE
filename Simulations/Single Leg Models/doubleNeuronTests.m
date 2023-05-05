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

params.dsyn = 0.0;
params.gsyn = -0.2;

u_params.gsm = -4;
u_params.gup = 5;
u_params.Iapp = -1.5;

SelectValAndPlot(model, params, u_params);


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

params.rflx_g = 2;
params.max_torque = 10;

params.dsyn = 0.0;
params.gsyn = -1;

u_params.Iapp = -2.8;
u_params.Iapp_mod = -0.2;
u_params.dgsm_m_g = -0.05;
u_params.dgsm_g = 1;
u_params.bar_amp = pi/4;


SelectValAndPlot(model, params, u_params);