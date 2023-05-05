%% Test neuron behaviour to cst current

model = "test_behaviour_auto_cst_current";

params = struct();
u_params = struct();

params.dfm = 0.0;
params.dsp = 0.5;
params.dsm = -0.5;
params.dup = -0.5;
params.noisePwr = 3*10^-7;
params.sampleTime = 0.001;

u_params.gfm = -2.0;
u_params.gsp = 6.0;
u_params.gsm = -4;
u_params.gup = 5;
u_params.Iapp = -1.5;

SelectValAndPlot(model, params, u_params);