%% Amplitude -> tracking

load("Amplitude_Modulation_ParamChart.mat")

figure
hold on
plot(var_params.bar_amp, squeeze(out_values(2, 1, :)))
plot(var_params.bar_amp, squeeze(out_values(2, 2, :)))
plot(var_params.bar_amp, squeeze(out_values(2, 3, :)))
plot(var_params.bar_amp, squeeze(out_values(2, 4, :)))
plot(var_params.bar_amp, var_params.bar_amp)
legend("0.2", "0.5", "1", "2", "Perfect")

figure
hold on
plot(var_params.bar_amp, squeeze(out_values(3, 1, :)))
plot(var_params.bar_amp, squeeze(out_values(3, 2, :)))
plot(var_params.bar_amp, squeeze(out_values(3, 3, :)))
plot(var_params.bar_amp, squeeze(out_values(3, 4, :)))
legend("0.2", "0.5", "1", "2")

figure
hold on
plot(var_params.bar_amp, squeeze(out_values(1, 1, :)))
plot(var_params.bar_amp, squeeze(out_values(1, 2, :)))
plot(var_params.bar_amp, squeeze(out_values(1, 3, :)))
plot(var_params.bar_amp, squeeze(out_values(1, 4, :)))
legend("0.2", "0.5", "1", "2")

%% plot

load("Amplitude_Modulation_ParamChart.mat")

matrixToCsv("mod_tgt_amplitude_dgsm02.csv", squeeze(out_values(2, 1, :))', {var_params.bar_amp}, ["amp"])
matrixToCsv("mod_tgt_amplitude_dgsm05.csv", squeeze(out_values(2, 2, :))', {var_params.bar_amp}, ["amp"])
matrixToCsv("mod_tgt_amplitude_dgsm1.csv", squeeze(out_values(2, 3, :))', {var_params.bar_amp}, ["amp"])
matrixToCsv("mod_tgt_amplitude_dgsm2.csv", squeeze(out_values(2, 4, :))', {var_params.bar_amp}, ["amp"])

matrixToCsv("mod_tgt_range_dgsm02.csv", squeeze(out_values(3, 1, :))', {var_params.bar_amp}, ["amp"])
matrixToCsv("mod_tgt_range_dgsm05.csv", squeeze(out_values(3, 2, :))', {var_params.bar_amp}, ["amp"])
matrixToCsv("mod_tgt_range_dgsm1.csv", squeeze(out_values(3, 3, :))', {var_params.bar_amp}, ["amp"])
matrixToCsv("mod_tgt_range_dgsm2.csv", squeeze(out_values(3, 4, :))', {var_params.bar_amp}, ["amp"])

matrixToCsv("mod_tgt_time_dgsm02.csv", squeeze(out_values(1, 1, :))', {var_params.bar_amp}, ["amp"])
matrixToCsv("mod_tgt_time_dgsm05.csv", squeeze(out_values(1, 2, :))', {var_params.bar_amp}, ["amp"])
matrixToCsv("mod_tgt_time_dgsm1.csv", squeeze(out_values(1, 3, :))', {var_params.bar_amp}, ["amp"])
matrixToCsv("mod_tgt_time_dgsm2.csv", squeeze(out_values(1, 4, :))', {var_params.bar_amp}, ["amp"])



%% Gain -> time to reach target

load("Gain_Modulation_ParamChart.mat")

figure
hold on
plot(var_params.dgsm_g, squeeze(out_values(2, :, 1)))
plot(var_params.dgsm_g, squeeze(out_values(2, :, 2)))
plot(var_params.dgsm_g, squeeze(out_values(2, :, 3)))
legend("pi/6", "pi/3", "pi/2")

figure
hold on
plot(var_params.dgsm_g, squeeze(out_values(3, :, 1)))
plot(var_params.dgsm_g, squeeze(out_values(3, :, 2)))
plot(var_params.dgsm_g, squeeze(out_values(3, :, 3)))
legend("pi/6", "pi/3", "pi/2")

figure
hold on
plot(var_params.dgsm_g, squeeze(out_values(1, :, 1)))
plot(var_params.dgsm_g, squeeze(out_values(1, :, 2)))
plot(var_params.dgsm_g, squeeze(out_values(1, :, 3)))
legend("pi/6", "pi/3", "pi/2")

%% plot

load("Gain_Modulation_ParamChart.mat")

matrixToCsv("mod_gain_amplitude_amppi6.csv", squeeze(out_values(2, :, 1)), {var_params.dgsm_g}, ["dgsm"])
matrixToCsv("mod_gain_amplitude_amppi3.csv", squeeze(out_values(2, :, 2)), {var_params.dgsm_g}, ["dgsm"])
matrixToCsv("mod_gain_amplitude_amppi2.csv", squeeze(out_values(2, :, 3)), {var_params.dgsm_g}, ["dgsm"])

matrixToCsv("mod_gain_range_amppi6.csv", squeeze(out_values(3, :, 1)), {var_params.dgsm_g}, ["dgsm"])
matrixToCsv("mod_gain_range_amppi3.csv", squeeze(out_values(3, :, 2)), {var_params.dgsm_g}, ["dgsm"])
matrixToCsv("mod_gain_range_amppi2.csv", squeeze(out_values(3, :, 3)), {var_params.dgsm_g}, ["dgsm"])

matrixToCsv("mod_gain_time_amppi6.csv", squeeze(out_values(1, :, 1)), {var_params.dgsm_g}, ["dgsm"])
matrixToCsv("mod_gain_time_amppi3.csv", squeeze(out_values(1, :, 2)), {var_params.dgsm_g}, ["dgsm"])
matrixToCsv("mod_gain_time_amppi2.csv", squeeze(out_values(1, :, 3)), {var_params.dgsm_g}, ["dgsm"])