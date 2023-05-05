%% Speed map
load("Speed_Sensory_ParamChart.mat")

model = "test_stability_link_auto_speed";
speed_val = out_values;
speed_gup_vec = var_params.gup;
speed_gsm_vec = var_params.gsm;
speed_Iapp_vec = var_params.Iapp;
speed_rlfx_vec = var_params.rflx_g;
speed_torque_vec = var_params.max_torque;

Disp3DMap(squeeze(speed_val(1, :, :, :, 2, 2)), speed_Iapp_vec, speed_gsm_vec, speed_gup_vec, 1)

disp(var_params)
u_params = struct();
variable_params_fields = fieldnames(var_params);
for k = 1:length(variable_params_fields)
    name = variable_params_fields{k};
    u_params.(name) = var_params.(name)(1);
end

SelectValAndPlot(model, params, u_params);


%% Sin map
load("Sin_Sensory_ParamChart.mat")

model = "test_stability_link_auto";
speed_val = out_values;
speed_gup_vec = var_params.gup;
speed_gsm_vec = var_params.gsm;
speed_Iapp_vec = var_params.Iapp;
speed_rlfx_vec = var_params.rflx_g;
speed_torque_vec = var_params.max_torque;

Disp3DMap(squeeze(speed_val(:, :, :, 1, 1)), speed_gup_vec, speed_gsm_vec, speed_Iapp_vec, 1)

u_params = struct();
variable_params_fields = fieldnames(var_params);
for k = 1:length(variable_params_fields)
    name = variable_params_fields{k};
    u_params.(name) = var_params.(name)(1);
end

%SelectValAndPlot(model, params, u_params);

%% Speed Monte 
model = "test_stability_link_auto_speed";

load("Speed_monteCarloNormal.mat");
figure
histogram(return_vec(:,1))

load("Speed_monteCarloEliptic.mat");
figure
histogram(return_vec(:,1))

u_params = struct();
variable_params_fields = fieldnames(var_params);
for k = 1:length(variable_params_fields)
    name = variable_params_fields{k};
    u_params.(name) = var_params.(name)(1);
end

SelectValAndPlot(model, params, u_params);

%% Sin Monte
model = "test_stability_link_auto";

load("Sin_monteCarloNormal.mat");
figure
histogram(return_vec(:,1))

load("Sin_monteCarloEliptic.mat");
figure
histogram(return_vec(:,1))

u_params = struct();
variable_params_fields = fieldnames(var_params);
for k = 1:length(variable_params_fields)
    name = variable_params_fields{k};
    u_params.(name) = var_params.(name)(1);
end

SelectValAndPlot(model, params, u_params);

%% Neuron Monte
model = "test_stability_link_auto_neuron_sense";

load("Neuron_monteCarloNormal.mat");
figure
histogram(return_vec(:,1))

load("Neuron_monteCarloEliptic.mat");
figure
histogram(return_vec(:,1))

u_params = struct();
variable_params_fields = fieldnames(var_params);
for k = 1:length(variable_params_fields)
    name = variable_params_fields{k};
    u_params.(name) = var_params.(name)(1);
end

SelectValAndPlot(model, params, u_params);

%% Good Monte

load("monteCarloBursting.mat");
figure
histogram(return_vec(:,1))

load("monteCarloEliptic.mat");
figure
histogram(return_vec(:,1))

u_params = struct();
variable_params_fields = fieldnames(var_params);
for k = 1:length(variable_params_fields)
    name = variable_params_fields{k};
    u_params.(name) = var_params.(name)(1);
end

SelectValAndPlot(model, params, u_params);