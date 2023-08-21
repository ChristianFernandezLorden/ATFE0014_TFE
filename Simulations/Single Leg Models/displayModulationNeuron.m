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

%% Buff -> Overall static


load("Buff_Modulation_ParamChart.mat")

figure
hold on
plot(var_params.buff_amp, squeeze(out_values(1, 2, 1, :)))
plot(var_params.buff_amp, squeeze(out_values(1, 2, 2, :)))
plot(var_params.buff_amp, squeeze(out_values(1, 2, 3, :)))
legend("pi/6", "pi/3", "pi/2")

figure
hold on
plot(var_params.buff_amp, squeeze(out_values(2, 2, 1, :)))
plot(var_params.buff_amp, squeeze(out_values(2, 2, 2, :)))
plot(var_params.buff_amp, squeeze(out_values(2, 2, 3, :)))
legend("pi/6", "pi/3", "pi/2")

figure
hold on
plot(var_params.buff_amp, squeeze(out_values(3, 2, 1, :)))
plot(var_params.buff_amp, squeeze(out_values(3, 2, 2, :)))
plot(var_params.buff_amp, squeeze(out_values(3, 2, 3, :)))
legend("pi/6", "pi/3", "pi/2")


figure
hold on
plot(var_params.buff_amp, squeeze(out_values(1, 3, 1, :)))
plot(var_params.buff_amp, squeeze(out_values(1, 3, 2, :)))
plot(var_params.buff_amp, squeeze(out_values(1, 3, 3, :)))
legend("pi/6", "pi/3", "pi/2")

figure
hold on
plot(var_params.buff_amp, squeeze(out_values(2, 3, 1, :)))
plot(var_params.buff_amp, squeeze(out_values(2, 3, 2, :)))
plot(var_params.buff_amp, squeeze(out_values(2, 3, 3, :)))
legend("pi/6", "pi/3", "pi/2")

figure
hold on
plot(var_params.buff_amp, squeeze(out_values(3, 3, 1, :)))
plot(var_params.buff_amp, squeeze(out_values(3, 3, 2, :)))
plot(var_params.buff_amp, squeeze(out_values(3, 3, 3, :)))
legend("pi/6", "pi/3", "pi/2")

%%
load("Buff_Modulation_ParamChart.mat")

matrixToCsv("mod_buff_amplitude_amppi6_dgsm02.csv", squeeze(out_values(2, 1, 1, :)), {var_params.buff_amp}, ["dbuff"])
matrixToCsv("mod_buff_amplitude_amppi3_dgsm02.csv", squeeze(out_values(2, 1, 2, :)), {var_params.buff_amp}, ["dbuff"])
matrixToCsv("mod_buff_amplitude_amppi2_dgsm02.csv", squeeze(out_values(2, 1, 3, :)), {var_params.buff_amp}, ["dbuff"])

matrixToCsv("mod_buff_range_amppi6_dgsm02.csv", squeeze(out_values(3, 1, 1, :)), {var_params.buff_amp}, ["dbuff"])
matrixToCsv("mod_buff_range_amppi3_dgsm02.csv", squeeze(out_values(3, 1, 2, :)), {var_params.buff_amp}, ["dbuff"])
matrixToCsv("mod_buff_range_amppi2_dgsm02.csv", squeeze(out_values(3, 1, 3, :)), {var_params.buff_amp}, ["dbuff"])


matrixToCsv("mod_buff_amplitude_amppi6_dgsm05.csv", squeeze(out_values(2, 2, 1, :)), {var_params.buff_amp}, ["dbuff"])
matrixToCsv("mod_buff_amplitude_amppi3_dgsm05.csv", squeeze(out_values(2, 2, 2, :)), {var_params.buff_amp}, ["dbuff"])
matrixToCsv("mod_buff_amplitude_amppi2_dgsm05.csv", squeeze(out_values(2, 2, 3, :)), {var_params.buff_amp}, ["dbuff"])

matrixToCsv("mod_buff_range_amppi6_dgsm05.csv", squeeze(out_values(3, 2, 1, :)), {var_params.buff_amp}, ["dbuff"])
matrixToCsv("mod_buff_range_amppi3_dgsm05.csv", squeeze(out_values(3, 2, 2, :)), {var_params.buff_amp}, ["dbuff"])
matrixToCsv("mod_buff_range_amppi2_dgsm05.csv", squeeze(out_values(3, 2, 3, :)), {var_params.buff_amp}, ["dbuff"])


matrixToCsv("mod_buff_amplitude_amppi6_dgsm1.csv", squeeze(out_values(2, 3, 1, :)), {var_params.buff_amp}, ["dbuff"])
matrixToCsv("mod_buff_amplitude_amppi3_dgsm1.csv", squeeze(out_values(2, 3, 2, :)), {var_params.buff_amp}, ["dbuff"])
matrixToCsv("mod_buff_amplitude_amppi2_dgsm1.csv", squeeze(out_values(2, 3, 3, :)), {var_params.buff_amp}, ["dbuff"])

matrixToCsv("mod_buff_range_amppi6_dgsm1.csv", squeeze(out_values(3, 3, 1, :)), {var_params.buff_amp}, ["dbuff"])
matrixToCsv("mod_buff_range_amppi3_dgsm1.csv", squeeze(out_values(3, 3, 2, :)), {var_params.buff_amp}, ["dbuff"])
matrixToCsv("mod_buff_range_amppi2_dgsm1.csv", squeeze(out_values(3, 3, 3, :)), {var_params.buff_amp}, ["dbuff"])


matrixToCsv("mod_buff_amplitude_amppi6_dgsm2.csv", squeeze(out_values(2, 4, 1, :)), {var_params.buff_amp}, ["dbuff"])
matrixToCsv("mod_buff_amplitude_amppi3_dgsm2.csv", squeeze(out_values(2, 4, 2, :)), {var_params.buff_amp}, ["dbuff"])
matrixToCsv("mod_buff_amplitude_amppi2_dgsm2.csv", squeeze(out_values(2, 4, 3, :)), {var_params.buff_amp}, ["dbuff"])

matrixToCsv("mod_buff_range_amppi6_dgsm2.csv", squeeze(out_values(3, 4, 1, :)), {var_params.buff_amp}, ["dbuff"])
matrixToCsv("mod_buff_range_amppi3_dgsm2.csv", squeeze(out_values(3, 4, 2, :)), {var_params.buff_amp}, ["dbuff"])
matrixToCsv("mod_buff_range_amppi2_dgsm2.csv", squeeze(out_values(3, 4, 3, :)), {var_params.buff_amp}, ["dbuff"])


%% Monte analysis

load("Modulation_low_fast_Monte.mat");
figure
histogram(return_vec(:,1))
figure
histogram(return_vec(:,2))
figure
histogram(return_vec(:,3))

load("Modulation_high_fast_Monte.mat");
figure
histogram(return_vec(:,1))
figure
histogram(return_vec(:,2))
figure
histogram(return_vec(:,3))

load("Modulation_low_slow_Monte.mat");
figure
histogram(return_vec(:,1))
figure
histogram(return_vec(:,2))
figure
histogram(return_vec(:,3))

load("Modulation_high_slow_Monte.mat");
figure
histogram(return_vec(:,1))
figure
histogram(return_vec(:,2))
figure
histogram(return_vec(:,3))

%%

load("Modulation_low_fast_Monte.mat");
T = array2table(return_vec(:,1), 'VariableNames', ["value"]);
writetable(T, "modulation_time_low_fast_monte.csv");
T = array2table(return_vec(:,2), 'VariableNames', ["value"]);
writetable(T, "modulation_amp_low_fast_monte.csv");
T = array2table(return_vec(:,3), 'VariableNames', ["value"]);
writetable(T, "modulation_range_low_fast_monte.csv");

load("Modulation_high_fast_Monte.mat");
T = array2table(return_vec(:,1), 'VariableNames', ["value"]);
writetable(T, "modulation_time_high_fast_monte.csv");
T = array2table(return_vec(:,2), 'VariableNames', ["value"]);
writetable(T, "modulation_amp_high_fast_monte.csv");
T = array2table(return_vec(:,3), 'VariableNames', ["value"]);
writetable(T, "modulation_range_high_fast_monte.csv");

load("Modulation_low_slow_Monte.mat");
T = array2table(return_vec(:,1), 'VariableNames', ["value"]);
writetable(T, "modulation_time_low_slow_monte.csv");
T = array2table(return_vec(:,2), 'VariableNames', ["value"]);
writetable(T, "modulation_amp_low_slow_monte.csv");
T = array2table(return_vec(:,3), 'VariableNames', ["value"]);
writetable(T, "modulation_range_low_slow_monte.csv");

load("Modulation_high_slow_Monte.mat");
T = array2table(return_vec(:,1), 'VariableNames', ["value"]);
writetable(T, "modulation_time_high_slow_monte.csv");
T = array2table(return_vec(:,2), 'VariableNames', ["value"]);
writetable(T, "modulation_amp_high_slow_monte.csv");
T = array2table(return_vec(:,3), 'VariableNames', ["value"]);
writetable(T, "modulation_range_high_slow_monte.csv");