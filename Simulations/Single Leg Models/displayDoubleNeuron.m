%% Plot double neuron stabilities

id_m2 = 1;
id_m1 = 5;
id_0 = 9;

id_t1 = 1;
id_t10 = 2;


%% No feedback
load("Sin_double_Sensory_ParamChart.mat")

Disp3DMap(squeeze(out_values(1,:,:,:,1,1)), var_params.gsm, var_params.gup, var_params.Iapp, ["gsm", "gup", "Iapp"], 3)
Disp3DMap(squeeze(out_values(3,:,:,:,1,1)), var_params.gsm, var_params.gup, var_params.Iapp, ["gsm", "gup", "Iapp"], 3)

Disp3DMap(squeeze(out_values(1,:,:,:,1,2)), var_params.gsm, var_params.gup, var_params.Iapp, ["gsm", "gup", "Iapp"], 3)
Disp3DMap(squeeze(out_values(3,:,:,:,1,2)), var_params.gsm, var_params.gup, var_params.Iapp, ["gsm", "gup", "Iapp"], 3)

%%
load("Sin_double_Sensory_ParamChart.mat")

matrixToCsv("double_nofeed_freq_t1_im2.csv", squeeze(out_values(1,:,:,id_m2,1,id_t1)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("double_nofeed_freq_t1_im1.csv", squeeze(out_values(1,:,:,id_m1,1,id_t1)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("double_nofeed_freq_t1_i0.csv", squeeze(out_values(1,:,:,id_0,1,id_t1)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])

matrixToCsv("double_nofeed_amp_t1_im2.csv", squeeze(out_values(3,:,:,id_m2,1,id_t1)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("double_nofeed_amp_t1_im1.csv", squeeze(out_values(3,:,:,id_m1,1,id_t1)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("double_nofeed_amp_t1_i0.csv", squeeze(out_values(3,:,:,id_0,1,id_t1)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])

matrixToCsv("double_nofeed_freq_t10_im2.csv", squeeze(out_values(1,:,:,id_m2,1,id_t10)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("double_nofeed_freq_t10_im1.csv", squeeze(out_values(1,:,:,id_m1,1,id_t10)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("double_nofeed_freq_t10_i0.csv", squeeze(out_values(1,:,:,id_0,1,id_t10)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])

matrixToCsv("double_nofeed_amp_t10_im2.csv", squeeze(out_values(3,:,:,id_m2,1,id_t10)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("double_nofeed_amp_t10_im1.csv", squeeze(out_values(3,:,:,id_m1,1,id_t10)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("double_nofeed_amp_t10_i0.csv", squeeze(out_values(3,:,:,id_0,1,id_t10)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])

%% Sin feedback

load("Sin_double_Sensory_ParamChart.mat")

Disp3DMap(squeeze(out_values(1,:,:,:,2,1)), var_params.gsm, var_params.gup, var_params.Iapp, ["gsm", "gup", "Iapp"], 3)
Disp3DMap(squeeze(out_values(3,:,:,:,2,1)), var_params.gsm, var_params.gup, var_params.Iapp, ["gsm", "gup", "Iapp"], 3)

Disp3DMap(squeeze(out_values(1,:,:,:,2,2)), var_params.gsm, var_params.gup, var_params.Iapp, ["gsm", "gup", "Iapp"], 3)
Disp3DMap(squeeze(out_values(3,:,:,:,2,2)), var_params.gsm, var_params.gup, var_params.Iapp, ["gsm", "gup", "Iapp"], 3)

Disp3DMap(squeeze(out_values(1,:,:,:,3,1)), var_params.gsm, var_params.gup, var_params.Iapp, ["gsm", "gup", "Iapp"], 3)
Disp3DMap(squeeze(out_values(3,:,:,:,3,1)), var_params.gsm, var_params.gup, var_params.Iapp, ["gsm", "gup", "Iapp"], 3)

Disp3DMap(squeeze(out_values(1,:,:,:,3,2)), var_params.gsm, var_params.gup, var_params.Iapp, ["gsm", "gup", "Iapp"], 3)
Disp3DMap(squeeze(out_values(3,:,:,:,3,2)), var_params.gsm, var_params.gup, var_params.Iapp, ["gsm", "gup", "Iapp"], 3)

%%

id_r1 = 2;
id_r5 = 3;

load("Sin_double_Sensory_ParamChart.mat")

% r1
matrixToCsv("double_sin_freq_t1_r1_im2.csv", squeeze(out_values(1,:,:,id_m2,id_r1,id_t1)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("double_sin_freq_t1_r1_im1.csv", squeeze(out_values(1,:,:,id_m1,id_r1,id_t1)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("double_sin_freq_t1_r1_i0.csv", squeeze(out_values(1,:,:,id_0,id_r1,id_t1)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])

matrixToCsv("double_sin_amp_t1_r1_im2.csv", squeeze(out_values(3,:,:,id_m2,id_r1,id_t1)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("double_sin_amp_t1_r1_im1.csv", squeeze(out_values(3,:,:,id_m1,id_r1,id_t1)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("double_sin_amp_t1_r1_i0.csv", squeeze(out_values(3,:,:,id_0,id_r1,id_t1)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])

matrixToCsv("double_sin_freq_t10_r1_im2.csv", squeeze(out_values(1,:,:,id_m2,id_r1,id_t10)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("double_sin_freq_t10_r1_im1.csv", squeeze(out_values(1,:,:,id_m1,id_r1,id_t10)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("double_sin_freq_t10_r1_i0.csv", squeeze(out_values(1,:,:,id_0,id_r1,id_t10)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])

matrixToCsv("double_sin_amp_t10_r1_im2.csv", squeeze(out_values(3,:,:,id_m2,id_r1,id_t10)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("double_sin_amp_t10_r1_im1.csv", squeeze(out_values(3,:,:,id_m1,id_r1,id_t10)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("double_sin_amp_t10_r1_i0.csv", squeeze(out_values(3,:,:,id_0,id_r1,id_t10)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])

%r5
matrixToCsv("double_sin_freq_t1_r5_im2.csv", squeeze(out_values(1,:,:,id_m2,id_r5,id_t1)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("double_sin_freq_t1_r5_im1.csv", squeeze(out_values(1,:,:,id_m1,id_r5,id_t1)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("double_sin_freq_t1_r5_i0.csv", squeeze(out_values(1,:,:,id_0,id_r5,id_t1)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])

matrixToCsv("double_sin_amp_t1_r5_im2.csv", squeeze(out_values(3,:,:,id_m2,id_r5,id_t1)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("double_sin_amp_t1_r5_im1.csv", squeeze(out_values(3,:,:,id_m1,id_r5,id_t1)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("double_sin_amp_t1_r5_i0.csv", squeeze(out_values(3,:,:,id_0,id_r5,id_t1)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])

matrixToCsv("double_sin_freq_t10_r5_im2.csv", squeeze(out_values(1,:,:,id_m2,id_r5,id_t10)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("double_sin_freq_t10_r5_im1.csv", squeeze(out_values(1,:,:,id_m1,id_r5,id_t10)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("double_sin_freq_t10_r5_i0.csv", squeeze(out_values(1,:,:,id_0,id_r5,id_t10)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])

matrixToCsv("double_sin_amp_t10_r5_im2.csv", squeeze(out_values(3,:,:,id_m2,id_r5,id_t10)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("double_sin_amp_t10_r5_im1.csv", squeeze(out_values(3,:,:,id_m1,id_r5,id_t10)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("double_sin_amp_t10_r5_i0.csv", squeeze(out_values(3,:,:,id_0,id_r5,id_t10)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])

%% Speed feedback

load("Speed_double_Sensory_ParamChart.mat")

Disp3DMap(squeeze(out_values(1,:,:,:,1,1)), var_params.gsm, var_params.gup, var_params.Iapp, ["gsm", "gup", "Iapp"], 3)
Disp3DMap(squeeze(out_values(3,:,:,:,1,1)), var_params.gsm, var_params.gup, var_params.Iapp, ["gsm", "gup", "Iapp"], 3)

Disp3DMap(squeeze(out_values(1,:,:,:,1,2)), var_params.gsm, var_params.gup, var_params.Iapp, ["gsm", "gup", "Iapp"], 3)
Disp3DMap(squeeze(out_values(3,:,:,:,1,2)), var_params.gsm, var_params.gup, var_params.Iapp, ["gsm", "gup", "Iapp"], 3)

Disp3DMap(squeeze(out_values(1,:,:,:,2,1)), var_params.gsm, var_params.gup, var_params.Iapp, ["gsm", "gup", "Iapp"], 3)
Disp3DMap(squeeze(out_values(3,:,:,:,2,1)), var_params.gsm, var_params.gup, var_params.Iapp, ["gsm", "gup", "Iapp"], 3)

Disp3DMap(squeeze(out_values(1,:,:,:,2,2)), var_params.gsm, var_params.gup, var_params.Iapp, ["gsm", "gup", "Iapp"], 3)
Disp3DMap(squeeze(out_values(3,:,:,:,2,2)), var_params.gsm, var_params.gup, var_params.Iapp, ["gsm", "gup", "Iapp"], 3)

%% Speed feedback

load("Speed_double_Sensory_ParamChart.mat")

%Disp3DMap(squeeze(out_values(1,:,:,:,1,1)), var_params.gsm, var_params.gup, var_params.Iapp, ["gsm", "gup", "Iapp"], 3)
Disp3DMap(squeeze(out_values(3,:,:,:,2,1)), var_params.gsm, var_params.gup, var_params.Iapp, ["gsm", "gup", "Iapp"], 3)
%%

id_r1 = 1;
id_r5 = 2;

load("Speed_double_Sensory_ParamChart.mat")

% r1
matrixToCsv("double_speed_freq_t1_r1_im2.csv", squeeze(out_values(1,:,:,id_m2,id_r1,id_t1)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("double_speed_freq_t1_r1_im1.csv", squeeze(out_values(1,:,:,id_m1,id_r1,id_t1)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("double_speed_freq_t1_r1_i0.csv", squeeze(out_values(1,:,:,id_0,id_r1,id_t1)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])

matrixToCsv("double_speed_amp_t1_r1_im2.csv", squeeze(out_values(3,:,:,id_m2,id_r1,id_t1)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("double_speed_amp_t1_r1_im1.csv", squeeze(out_values(3,:,:,id_m1,id_r1,id_t1)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("double_speed_amp_t1_r1_i0.csv", squeeze(out_values(3,:,:,id_0,id_r1,id_t1)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])

matrixToCsv("double_speed_freq_t10_r1_im2.csv", squeeze(out_values(1,:,:,id_m2,id_r1,id_t10)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("double_speed_freq_t10_r1_im1.csv", squeeze(out_values(1,:,:,id_m1,id_r1,id_t10)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("double_speed_freq_t10_r1_i0.csv", squeeze(out_values(1,:,:,id_0,id_r1,id_t10)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])

matrixToCsv("double_speed_amp_t10_r1_im2.csv", squeeze(out_values(3,:,:,id_m2,id_r1,id_t10)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("double_speed_amp_t10_r1_im1.csv", squeeze(out_values(3,:,:,id_m1,id_r1,id_t10)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("double_speed_amp_t10_r1_i0.csv", squeeze(out_values(3,:,:,id_0,id_r1,id_t10)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])

%r5
matrixToCsv("double_speed_freq_t1_r5_im2.csv", squeeze(out_values(1,:,:,id_m2,id_r5,id_t1)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("double_speed_freq_t1_r5_im1.csv", squeeze(out_values(1,:,:,id_m1,id_r5,id_t1)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("double_speed_freq_t1_r5_i0.csv", squeeze(out_values(1,:,:,id_0,id_r5,id_t1)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])

matrixToCsv("double_speed_amp_t1_r5_im2.csv", squeeze(out_values(3,:,:,id_m2,id_r5,id_t1)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("double_speed_amp_t1_r5_im1.csv", squeeze(out_values(3,:,:,id_m1,id_r5,id_t1)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("double_speed_amp_t1_r5_i0.csv", squeeze(out_values(3,:,:,id_0,id_r5,id_t1)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])

matrixToCsv("double_speed_freq_t10_r5_im2.csv", squeeze(out_values(1,:,:,id_m2,id_r5,id_t10)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("double_speed_freq_t10_r5_im1.csv", squeeze(out_values(1,:,:,id_m1,id_r5,id_t10)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("double_speed_freq_t10_r5_i0.csv", squeeze(out_values(1,:,:,id_0,id_r5,id_t10)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])

matrixToCsv("double_speed_amp_t10_r5_im2.csv", squeeze(out_values(3,:,:,id_m2,id_r5,id_t10)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("double_speed_amp_t10_r5_im1.csv", squeeze(out_values(3,:,:,id_m1,id_r5,id_t10)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("double_speed_amp_t10_r5_i0.csv", squeeze(out_values(3,:,:,id_0,id_r5,id_t10)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])

%% Neuron feedback

load("Neuron_double_Sensory_ParamChart.mat")

Disp3DMap(squeeze(out_values(1,:,:,:,1,1)), var_params.gsm, var_params.gup, var_params.Iapp, ["gsm", "gup", "Iapp"], 3)
Disp3DMap(squeeze(out_values(3,:,:,:,1,1)), var_params.gsm, var_params.gup, var_params.Iapp, ["gsm", "gup", "Iapp"], 3)

Disp3DMap(squeeze(out_values(1,:,:,:,1,2)), var_params.gsm, var_params.gup, var_params.Iapp, ["gsm", "gup", "Iapp"], 3)
Disp3DMap(squeeze(out_values(3,:,:,:,1,2)), var_params.gsm, var_params.gup, var_params.Iapp, ["gsm", "gup", "Iapp"], 3)

Disp3DMap(squeeze(out_values(1,:,:,:,2,1)), var_params.gsm, var_params.gup, var_params.Iapp, ["gsm", "gup", "Iapp"], 3)
Disp3DMap(squeeze(out_values(3,:,:,:,2,1)), var_params.gsm, var_params.gup, var_params.Iapp, ["gsm", "gup", "Iapp"], 3)

Disp3DMap(squeeze(out_values(1,:,:,:,2,2)), var_params.gsm, var_params.gup, var_params.Iapp, ["gsm", "gup", "Iapp"], 3)
Disp3DMap(squeeze(out_values(3,:,:,:,2,2)), var_params.gsm, var_params.gup, var_params.Iapp, ["gsm", "gup", "Iapp"], 3)

%%

id_s1 = 1;
id_s3 = 2;

load("Neuron_double_Sensory_ParamChart.mat")

% gsyn1
matrixToCsv("double_neuron_freq_t1_s1_im2.csv", squeeze(out_values(1,:,:,id_m2,id_s1,id_t1)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("double_neuron_freq_t1_s1_im1.csv", squeeze(out_values(1,:,:,id_m1,id_s1,id_t1)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("double_neuron_freq_t1_s1_i0.csv", squeeze(out_values(1,:,:,id_0,id_s1,id_t1)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])

matrixToCsv("double_neuron_amp_t1_s1_im2.csv", squeeze(out_values(3,:,:,id_m2,id_s1,id_t1)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("double_neuron_amp_t1_s1_im1.csv", squeeze(out_values(3,:,:,id_m1,id_s1,id_t1)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("double_neuron_amp_t1_s1_i0.csv", squeeze(out_values(3,:,:,id_0,id_s1,id_t1)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])

matrixToCsv("double_neuron_freq_t10_s1_im2.csv", squeeze(out_values(1,:,:,id_m2,id_s1,id_t10)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("double_neuron_freq_t10_s1_im1.csv", squeeze(out_values(1,:,:,id_m1,id_s1,id_t10)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("double_neuron_freq_t10_s1_i0.csv", squeeze(out_values(1,:,:,id_0,id_s1,id_t10)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])

matrixToCsv("double_neuron_amp_t10_s1_im2.csv", squeeze(out_values(3,:,:,id_m2,id_s1,id_t10)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("double_neuron_amp_t10_s1_im1.csv", squeeze(out_values(3,:,:,id_m1,id_s1,id_t10)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("double_neuron_amp_t10_s1_i0.csv", squeeze(out_values(3,:,:,id_0,id_s1,id_t10)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])

% gsyn2
matrixToCsv("double_neuron_freq_t1_s3_im2.csv", squeeze(out_values(1,:,:,id_m2,id_s3,id_t1)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("double_neuron_freq_t1_s3_im1.csv", squeeze(out_values(1,:,:,id_m1,id_s3,id_t1)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("double_neuron_freq_t1_s3_i0.csv", squeeze(out_values(1,:,:,id_0,id_s3,id_t1)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])

matrixToCsv("double_neuron_amp_t1_s3_im2.csv", squeeze(out_values(3,:,:,id_m2,id_s3,id_t1)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("double_neuron_amp_t1_s3_im1.csv", squeeze(out_values(3,:,:,id_m1,id_s3,id_t1)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("double_neuron_amp_t1_s3_i0.csv", squeeze(out_values(3,:,:,id_0,id_s3,id_t1)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])

matrixToCsv("double_neuron_freq_t10_s3_im2.csv", squeeze(out_values(1,:,:,id_m2,id_s3,id_t10)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("double_neuron_freq_t10_s3_im1.csv", squeeze(out_values(1,:,:,id_m1,id_s3,id_t10)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("double_neuron_freq_t10_s3_i0.csv", squeeze(out_values(1,:,:,id_0,id_s3,id_t10)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])

matrixToCsv("double_neuron_amp_t10_s3_im2.csv", squeeze(out_values(3,:,:,id_m2,id_s3,id_t10)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("double_neuron_amp_t10_s3_im1.csv", squeeze(out_values(3,:,:,id_m1,id_s3,id_t10)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])
matrixToCsv("double_neuron_amp_t10_s3_i0.csv", squeeze(out_values(3,:,:,id_0,id_s3,id_t10)), {var_params.gsm, var_params.gup}, ["gsm", "gup"])


%% Monte analysis

load("Double_Nofeed_monteCarloFragile.mat");
figure
histogram(return_vec(:,1))
figure
histogram(return_vec(:,3))

load("Double_Nofeed_monteCarloNormal.mat");
figure
histogram(return_vec(:,1))
figure
histogram(return_vec(:,3))

load("Double_Sin_monteCarloFragile.mat");
figure
histogram(return_vec(:,1))
figure
histogram(return_vec(:,3))

load("Double_Sin_monteCarloNormal.mat");
figure
histogram(return_vec(:,1))
figure
histogram(return_vec(:,3))

load("Double_Speed_monteCarloFragile.mat");
figure
histogram(return_vec(:,1))
figure
histogram(return_vec(:,3))

load("Double_Speed_monteCarloNormal.mat");
figure
histogram(return_vec(:,1))
figure
histogram(return_vec(:,3))

load("Double_Neuron_monteCarloFragile.mat");
figure
histogram(return_vec(:,1))
figure
histogram(return_vec(:,3))

load("Double_Neuron_monteCarloNormal.mat");
figure
histogram(return_vec(:,1))
figure
histogram(return_vec(:,3))

%%

load("Double_Nofeed_monteCarloFragile.mat");
T = array2table(return_vec(:,1), 'VariableNames', ["value"]);
writetable(T, "double_nofeed_monte_fragile.csv");
T = array2table(return_vec(:,3), 'VariableNames', ["value"]);
writetable(T, "double_nofeed_range_monte_fragile.csv");

load("Double_Nofeed_monteCarloNormal.mat");
T = array2table(return_vec(:,1), 'VariableNames', ["value"]);
writetable(T, "double_nofeed_monte_normal.csv");
T = array2table(return_vec(:,3), 'VariableNames', ["value"]);
writetable(T, "double_nofeed_range_monte_normal.csv");

% ====== %

load("Double_Sin_monteCarloFragile.mat");
T = array2table(return_vec(:,1), 'VariableNames', ["value"]);
writetable(T, "double_sin_monte_fragile.csv");
T = array2table(return_vec(:,3), 'VariableNames', ["value"]);
writetable(T, "double_sin_range_monte_fragile.csv");

load("Sin_monteCarloNormal.mat");
T = array2table(return_vec(:,1), 'VariableNames', ["value"]);
writetable(T, "double_sin_monte_normal.csv");
T = array2table(return_vec(:,3), 'VariableNames', ["value"]);
writetable(T, "double_sin_range_monte_normal.csv");

% ====== %

load("Double_Speed_monteCarloFragile.mat");
T = array2table(return_vec(:,1), 'VariableNames', ["value"]);
writetable(T, "double_speed_monte_fragile.csv");
T = array2table(return_vec(:,3), 'VariableNames', ["value"]);
writetable(T, "double_speed_range_monte_fragile.csv");

load("Double_Speed_monteCarloNormal.mat");
T = array2table(return_vec(:,1), 'VariableNames', ["value"]);
writetable(T, "double_speed_monte_normal.csv");
T = array2table(return_vec(:,3), 'VariableNames', ["value"]);
writetable(T, "double_speed_range_monte_normal.csv");

% ====== %

load("Double_Neuron_monteCarloFragile.mat");
T = array2table(return_vec(:,1), 'VariableNames', ["value"]);
writetable(T, "double_neuron_monte_fragile.csv");
T = array2table(return_vec(:,3), 'VariableNames', ["value"]);
writetable(T, "double_neuron_range_monte_fragile.csv");

load("Double_Neuron_monteCarloNormal.mat");
T = array2table(return_vec(:,1), 'VariableNames', ["value"]);
writetable(T, "double_neuron_monte_normal.csv");
T = array2table(return_vec(:,3), 'VariableNames', ["value"]);
writetable(T, "double_neuron_range_monte_normal.csv");
