%% Plot Single neuron stabilities

id_m2 = 1;
id_m1 = 6;
id_0 = 11;

id_t1 = 1;
id_t10 = 3;


%% No feedback
load("Sin_Sensory_ParamChart.mat")

Disp3DMap(squeeze(out_values(1,:,:,:,1,1)), var_params.gsm, var_params.gup, var_params.Iapp, ["gsm", "gup", "Iapp"], 3)
Disp3DMap(squeeze(out_values(3,:,:,:,1,1)), var_params.gsm, var_params.gup, var_params.Iapp, ["gsm", "gup", "Iapp"], 3)

Disp3DMap(squeeze(out_values(1,:,:,:,1,3)), var_params.gsm, var_params.gup, var_params.Iapp, ["gsm", "gup", "Iapp"], 3)
Disp3DMap(squeeze(out_values(3,:,:,:,1,3)), var_params.gsm, var_params.gup, var_params.Iapp, ["gsm", "gup", "Iapp"], 3)

%%
load("Sin_Sensory_ParamChart.mat")

matrixToCsv("single_nofeed_freq_t1_im2.csv", squeeze(out_values(1,:,:,id_m2,1,id_t1)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("single_nofeed_freq_t1_im1.csv", squeeze(out_values(1,:,:,id_m1,1,id_t1)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("single_nofeed_freq_t1_i0.csv", squeeze(out_values(1,:,:,id_0,1,id_t1)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])

matrixToCsv("single_nofeed_amp_t1_im2.csv", squeeze(out_values(3,:,:,id_m2,1,id_t1)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("single_nofeed_amp_t1_im1.csv", squeeze(out_values(3,:,:,id_m1,1,id_t1)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("single_nofeed_amp_t1_i0.csv", squeeze(out_values(3,:,:,id_0,1,id_t1)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])

matrixToCsv("single_nofeed_freq_t10_im2.csv", squeeze(out_values(1,:,:,id_m2,1,id_t10)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("single_nofeed_freq_t10_im1.csv", squeeze(out_values(1,:,:,id_m1,1,id_t10)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("single_nofeed_freq_t10_i0.csv", squeeze(out_values(1,:,:,id_0,1,id_t10)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])

matrixToCsv("single_nofeed_amp_t10_im2.csv", squeeze(out_values(3,:,:,id_m2,1,id_t10)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("single_nofeed_amp_t10_im1.csv", squeeze(out_values(3,:,:,id_m1,1,id_t10)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("single_nofeed_amp_t10_i0.csv", squeeze(out_values(3,:,:,id_0,1,id_t10)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])

%% Sin feedback

load("Sin_Sensory_ParamChart.mat")

Disp3DMap(squeeze(out_values(1,:,:,:,2,1)), var_params.gsm, var_params.gup, var_params.Iapp, ["gsm", "gup", "Iapp"], 3)
Disp3DMap(squeeze(out_values(3,:,:,:,2,1)), var_params.gsm, var_params.gup, var_params.Iapp, ["gsm", "gup", "Iapp"], 3)

Disp3DMap(squeeze(out_values(1,:,:,:,2,3)), var_params.gsm, var_params.gup, var_params.Iapp, ["gsm", "gup", "Iapp"], 3)
Disp3DMap(squeeze(out_values(3,:,:,:,2,3)), var_params.gsm, var_params.gup, var_params.Iapp, ["gsm", "gup", "Iapp"], 3)

Disp3DMap(squeeze(out_values(1,:,:,:,3,1)), var_params.gsm, var_params.gup, var_params.Iapp, ["gsm", "gup", "Iapp"], 3)
Disp3DMap(squeeze(out_values(3,:,:,:,3,1)), var_params.gsm, var_params.gup, var_params.Iapp, ["gsm", "gup", "Iapp"], 3)

Disp3DMap(squeeze(out_values(1,:,:,:,3,3)), var_params.gsm, var_params.gup, var_params.Iapp, ["gsm", "gup", "Iapp"], 3)
Disp3DMap(squeeze(out_values(3,:,:,:,3,3)), var_params.gsm, var_params.gup, var_params.Iapp, ["gsm", "gup", "Iapp"], 3)

%%

id_r1 = 2;
id_r5 = 3;

load("Sin_Sensory_ParamChart.mat")

% r1
matrixToCsv("single_sin_freq_t1_r1_im2.csv", squeeze(out_values(1,:,:,id_m2,id_r1,id_t1)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("single_sin_freq_t1_r1_im1.csv", squeeze(out_values(1,:,:,id_m1,id_r1,id_t1)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("single_sin_freq_t1_r1_i0.csv", squeeze(out_values(1,:,:,id_0,id_r1,id_t1)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])

matrixToCsv("single_sin_amp_t1_r1_im2.csv", squeeze(out_values(3,:,:,id_m2,id_r1,id_t1)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("single_sin_amp_t1_r1_im1.csv", squeeze(out_values(3,:,:,id_m1,id_r1,id_t1)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("single_sin_amp_t1_r1_i0.csv", squeeze(out_values(3,:,:,id_0,id_r1,id_t1)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])

matrixToCsv("single_sin_freq_t10_r1_im2.csv", squeeze(out_values(1,:,:,id_m2,id_r1,id_t10)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("single_sin_freq_t10_r1_im1.csv", squeeze(out_values(1,:,:,id_m1,id_r1,id_t10)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("single_sin_freq_t10_r1_i0.csv", squeeze(out_values(1,:,:,id_0,id_r1,id_t10)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])

matrixToCsv("single_sin_amp_t10_r1_im2.csv", squeeze(out_values(3,:,:,id_m2,id_r1,id_t10)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("single_sin_amp_t10_r1_im1.csv", squeeze(out_values(3,:,:,id_m1,id_r1,id_t10)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("single_sin_amp_t10_r1_i0.csv", squeeze(out_values(3,:,:,id_0,id_r1,id_t10)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])

%r5
matrixToCsv("single_sin_freq_t1_r5_im2.csv", squeeze(out_values(1,:,:,id_m2,id_r5,id_t1)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("single_sin_freq_t1_r5_im1.csv", squeeze(out_values(1,:,:,id_m1,id_r5,id_t1)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("single_sin_freq_t1_r5_i0.csv", squeeze(out_values(1,:,:,id_0,id_r5,id_t1)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])

matrixToCsv("single_sin_amp_t1_r5_im2.csv", squeeze(out_values(3,:,:,id_m2,id_r5,id_t1)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("single_sin_amp_t1_r5_im1.csv", squeeze(out_values(3,:,:,id_m1,id_r5,id_t1)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("single_sin_amp_t1_r5_i0.csv", squeeze(out_values(3,:,:,id_0,id_r5,id_t1)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])

matrixToCsv("single_sin_freq_t10_r5_im2.csv", squeeze(out_values(1,:,:,id_m2,id_r5,id_t10)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("single_sin_freq_t10_r5_im1.csv", squeeze(out_values(1,:,:,id_m1,id_r5,id_t10)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("single_sin_freq_t10_r5_i0.csv", squeeze(out_values(1,:,:,id_0,id_r5,id_t10)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])

matrixToCsv("single_sin_amp_t10_r5_im2.csv", squeeze(out_values(3,:,:,id_m2,id_r5,id_t10)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("single_sin_amp_t10_r5_im1.csv", squeeze(out_values(3,:,:,id_m1,id_r5,id_t10)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("single_sin_amp_t10_r5_i0.csv", squeeze(out_values(3,:,:,id_0,id_r5,id_t10)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])

%% Speed feedback

load("Speed_Sensory_ParamChart.mat")

Disp3DMap(squeeze(out_values(1,:,:,:,1,1)), var_params.gsm, var_params.gup, var_params.Iapp, ["gsm", "gup", "Iapp"], 3)
Disp3DMap(squeeze(out_values(3,:,:,:,1,1)), var_params.gsm, var_params.gup, var_params.Iapp, ["gsm", "gup", "Iapp"], 3)

Disp3DMap(squeeze(out_values(1,:,:,:,1,3)), var_params.gsm, var_params.gup, var_params.Iapp, ["gsm", "gup", "Iapp"], 3)
Disp3DMap(squeeze(out_values(3,:,:,:,1,3)), var_params.gsm, var_params.gup, var_params.Iapp, ["gsm", "gup", "Iapp"], 3)

Disp3DMap(squeeze(out_values(1,:,:,:,2,1)), var_params.gsm, var_params.gup, var_params.Iapp, ["gsm", "gup", "Iapp"], 3)
Disp3DMap(squeeze(out_values(3,:,:,:,2,1)), var_params.gsm, var_params.gup, var_params.Iapp, ["gsm", "gup", "Iapp"], 3)

Disp3DMap(squeeze(out_values(1,:,:,:,2,3)), var_params.gsm, var_params.gup, var_params.Iapp, ["gsm", "gup", "Iapp"], 3)
Disp3DMap(squeeze(out_values(3,:,:,:,2,3)), var_params.gsm, var_params.gup, var_params.Iapp, ["gsm", "gup", "Iapp"], 3)

%%

id_r1 = 1;
id_r5 = 2;

load("Speed_Sensory_ParamChart.mat")

% r1
matrixToCsv("single_speed_freq_t1_r1_im2.csv", squeeze(out_values(1,:,:,id_m2,id_r1,id_t1)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("single_speed_freq_t1_r1_im1.csv", squeeze(out_values(1,:,:,id_m1,id_r1,id_t1)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("single_speed_freq_t1_r1_i0.csv", squeeze(out_values(1,:,:,id_0,id_r1,id_t1)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])

matrixToCsv("single_speed_amp_t1_r1_im2.csv", squeeze(out_values(3,:,:,id_m2,id_r1,id_t1)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("single_speed_amp_t1_r1_im1.csv", squeeze(out_values(3,:,:,id_m1,id_r1,id_t1)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("single_speed_amp_t1_r1_i0.csv", squeeze(out_values(3,:,:,id_0,id_r1,id_t1)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])

matrixToCsv("single_speed_freq_t10_r1_im2.csv", squeeze(out_values(1,:,:,id_m2,id_r1,id_t10)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("single_speed_freq_t10_r1_im1.csv", squeeze(out_values(1,:,:,id_m1,id_r1,id_t10)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("single_speed_freq_t10_r1_i0.csv", squeeze(out_values(1,:,:,id_0,id_r1,id_t10)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])

matrixToCsv("single_speed_amp_t10_r1_im2.csv", squeeze(out_values(3,:,:,id_m2,id_r1,id_t10)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("single_speed_amp_t10_r1_im1.csv", squeeze(out_values(3,:,:,id_m1,id_r1,id_t10)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("single_speed_amp_t10_r1_i0.csv", squeeze(out_values(3,:,:,id_0,id_r1,id_t10)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])

%r5
matrixToCsv("single_speed_freq_t1_r5_im2.csv", squeeze(out_values(1,:,:,id_m2,id_r5,id_t1)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("single_speed_freq_t1_r5_im1.csv", squeeze(out_values(1,:,:,id_m1,id_r5,id_t1)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("single_speed_freq_t1_r5_i0.csv", squeeze(out_values(1,:,:,id_0,id_r5,id_t1)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])

matrixToCsv("single_speed_amp_t1_r5_im2.csv", squeeze(out_values(3,:,:,id_m2,id_r5,id_t1)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("single_speed_amp_t1_r5_im1.csv", squeeze(out_values(3,:,:,id_m1,id_r5,id_t1)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("single_speed_amp_t1_r5_i0.csv", squeeze(out_values(3,:,:,id_0,id_r5,id_t1)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])

matrixToCsv("single_speed_freq_t10_r5_im2.csv", squeeze(out_values(1,:,:,id_m2,id_r5,id_t10)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("single_speed_freq_t10_r5_im1.csv", squeeze(out_values(1,:,:,id_m1,id_r5,id_t10)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("single_speed_freq_t10_r5_i0.csv", squeeze(out_values(1,:,:,id_0,id_r5,id_t10)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])

matrixToCsv("single_speed_amp_t10_r5_im2.csv", squeeze(out_values(3,:,:,id_m2,id_r5,id_t10)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("single_speed_amp_t10_r5_im1.csv", squeeze(out_values(3,:,:,id_m1,id_r5,id_t10)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("single_speed_amp_t10_r5_i0.csv", squeeze(out_values(3,:,:,id_0,id_r5,id_t10)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])

%% Neuron feedback

load("Neuron_Sensory_ParamChart.mat")

Disp3DMap(squeeze(out_values(1,:,:,:,1,1)), var_params.gsm, var_params.gup, var_params.Iapp, ["gsm", "gup", "Iapp"], 3)
Disp3DMap(squeeze(out_values(3,:,:,:,1,1)), var_params.gsm, var_params.gup, var_params.Iapp, ["gsm", "gup", "Iapp"], 3)

Disp3DMap(squeeze(out_values(1,:,:,:,1,3)), var_params.gsm, var_params.gup, var_params.Iapp, ["gsm", "gup", "Iapp"], 3)
Disp3DMap(squeeze(out_values(3,:,:,:,1,3)), var_params.gsm, var_params.gup, var_params.Iapp, ["gsm", "gup", "Iapp"], 3)

Disp3DMap(squeeze(out_values(1,:,:,:,2,1)), var_params.gsm, var_params.gup, var_params.Iapp, ["gsm", "gup", "Iapp"], 3)
Disp3DMap(squeeze(out_values(3,:,:,:,2,1)), var_params.gsm, var_params.gup, var_params.Iapp, ["gsm", "gup", "Iapp"], 3)

Disp3DMap(squeeze(out_values(1,:,:,:,2,3)), var_params.gsm, var_params.gup, var_params.Iapp, ["gsm", "gup", "Iapp"], 3)
Disp3DMap(squeeze(out_values(3,:,:,:,2,3)), var_params.gsm, var_params.gup, var_params.Iapp, ["gsm", "gup", "Iapp"], 3)

%%

id_s1 = 1;
id_s3 = 2;

load("Neuron_Sensory_ParamChart.mat")

% gsyn1
matrixToCsv("single_neuron_freq_t1_s1_im2.csv", squeeze(out_values(1,:,:,id_m2,id_s1,id_t1)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("single_neuron_freq_t1_s1_im1.csv", squeeze(out_values(1,:,:,id_m1,id_s1,id_t1)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("single_neuron_freq_t1_s1_i0.csv", squeeze(out_values(1,:,:,id_0,id_s1,id_t1)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])

matrixToCsv("single_neuron_amp_t1_s1_im2.csv", squeeze(out_values(3,:,:,id_m2,id_s1,id_t1)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("single_neuron_amp_t1_s1_im1.csv", squeeze(out_values(3,:,:,id_m1,id_s1,id_t1)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("single_neuron_amp_t1_s1_i0.csv", squeeze(out_values(3,:,:,id_0,id_s1,id_t1)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])

matrixToCsv("single_neuron_freq_t10_s1_im2.csv", squeeze(out_values(1,:,:,id_m2,id_s1,id_t10)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("single_neuron_freq_t10_s1_im1.csv", squeeze(out_values(1,:,:,id_m1,id_s1,id_t10)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("single_neuron_freq_t10_s1_i0.csv", squeeze(out_values(1,:,:,id_0,id_s1,id_t10)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])

matrixToCsv("single_neuron_amp_t10_s1_im2.csv", squeeze(out_values(3,:,:,id_m2,id_s1,id_t10)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("single_neuron_amp_t10_s1_im1.csv", squeeze(out_values(3,:,:,id_m1,id_s1,id_t10)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("single_neuron_amp_t10_s1_i0.csv", squeeze(out_values(3,:,:,id_0,id_s1,id_t10)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])

% gsyn2
matrixToCsv("single_neuron_freq_t1_s3_im2.csv", squeeze(out_values(1,:,:,id_m2,id_s3,id_t1)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("single_neuron_freq_t1_s3_im1.csv", squeeze(out_values(1,:,:,id_m1,id_s3,id_t1)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("single_neuron_freq_t1_s3_i0.csv", squeeze(out_values(1,:,:,id_0,id_s3,id_t1)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])

matrixToCsv("single_neuron_amp_t1_s3_im2.csv", squeeze(out_values(3,:,:,id_m2,id_s3,id_t1)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("single_neuron_amp_t1_s3_im1.csv", squeeze(out_values(3,:,:,id_m1,id_s3,id_t1)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("single_neuron_amp_t1_s3_i0.csv", squeeze(out_values(3,:,:,id_0,id_s3,id_t1)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])

matrixToCsv("single_neuron_freq_t10_s3_im2.csv", squeeze(out_values(1,:,:,id_m2,id_s3,id_t10)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("single_neuron_freq_t10_s3_im1.csv", squeeze(out_values(1,:,:,id_m1,id_s3,id_t10)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("single_neuron_freq_t10_s3_i0.csv", squeeze(out_values(1,:,:,id_0,id_s3,id_t10)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])

matrixToCsv("single_neuron_amp_t10_s3_im2.csv", squeeze(out_values(3,:,:,id_m2,id_s3,id_t10)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("single_neuron_amp_t10_s3_im1.csv", squeeze(out_values(3,:,:,id_m1,id_s3,id_t10)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("single_neuron_amp_t10_s3_i0.csv", squeeze(out_values(3,:,:,id_0,id_s3,id_t10)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])

%%

load("Nofeed_monteCarloFragile.mat");
figure
histogram(return_vec(:,1))
figure
histogram(return_vec(:,3))

load("Nofeed_monteCarloNormal.mat");
figure
histogram(return_vec(:,1))
figure
histogram(return_vec(:,3))

load("Sin_monteCarloFragile.mat");
figure
histogram(return_vec(:,1))
figure
histogram(return_vec(:,3))

load("Sin_monteCarloNormal.mat");
figure
histogram(return_vec(:,1))
figure
histogram(return_vec(:,3))

load("Speed_monteCarloFragile.mat");
figure
histogram(return_vec(:,1))
figure
histogram(return_vec(:,3))

load("Speed_monteCarloNormal.mat");
figure
histogram(return_vec(:,1))
figure
histogram(return_vec(:,3))

load("Neuron_monteCarloFragile.mat");
figure
histogram(return_vec(:,1))
figure
histogram(return_vec(:,3))

load("Neuron_monteCarloNormal.mat");
figure
histogram(return_vec(:,1))
figure
histogram(return_vec(:,3))

%%

load("Nofeed_monteCarloFragile.mat");
T = array2table(return_vec(:,1), 'VariableNames', ["value"]);
writetable(T, "single_nofeed_monte_fragile.csv");
T = array2table(return_vec(:,3), 'VariableNames', ["value"]);
writetable(T, "single_nofeed_range_monte_fragile.csv");

load("Nofeed_monteCarloNormal.mat");
T = array2table(return_vec(:,1), 'VariableNames', ["value"]);
writetable(T, "single_nofeed_monte_normal.csv");
T = array2table(return_vec(:,3), 'VariableNames', ["value"]);
writetable(T, "single_nofeed_range_monte_normal.csv");

% ====== %

load("Sin_monteCarloFragile.mat");
T = array2table(return_vec(:,1), 'VariableNames', ["value"]);
writetable(T, "single_sin_monte_fragile.csv");
T = array2table(return_vec(:,3), 'VariableNames', ["value"]);
writetable(T, "single_sin_range_monte_fragile.csv");

load("Sin_monteCarloNormal.mat");
T = array2table(return_vec(:,1), 'VariableNames', ["value"]);
writetable(T, "single_sin_monte_normal.csv");
T = array2table(return_vec(:,3), 'VariableNames', ["value"]);
writetable(T, "single_sin_range_monte_normal.csv");

% ====== %

load("Speed_monteCarloFragile.mat");
T = array2table(return_vec(:,1), 'VariableNames', ["value"]);
writetable(T, "single_speed_monte_fragile.csv");
T = array2table(return_vec(:,3), 'VariableNames', ["value"]);
writetable(T, "single_speed_range_monte_fragile.csv");

load("Speed_monteCarloNormal.mat");
T = array2table(return_vec(:,1), 'VariableNames', ["value"]);
writetable(T, "single_speed_monte_normal.csv");
T = array2table(return_vec(:,3), 'VariableNames', ["value"]);
writetable(T, "single_speed_range_monte_normal.csv");

% ====== %

load("Neuron_monteCarloFragile.mat");
T = array2table(return_vec(:,1), 'VariableNames', ["value"]);
writetable(T, "single_neuron_monte_fragile.csv");
T = array2table(return_vec(:,3), 'VariableNames', ["value"]);
writetable(T, "single_neuron_range_monte_fragile.csv");

load("Neuron_monteCarloNormal.mat");
T = array2table(return_vec(:,1), 'VariableNames', ["value"]);
writetable(T, "single_neuron_monte_normal.csv");
T = array2table(return_vec(:,3), 'VariableNames', ["value"]);
writetable(T, "single_neuron_range_monte_normal.csv");
