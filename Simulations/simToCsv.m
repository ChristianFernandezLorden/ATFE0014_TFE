function out = simToCsv(filename, model, params, stopTime, timed_inputs)
    fixed_param_fields = fieldnames(params);
    sim_in = Simulink.SimulationInput(model);
    for k = 1:length(fixed_param_fields)
        name = fixed_param_fields{k};
        sim_in = setVariable(sim_in, name, params.(name));
    end

    if nargin >= 5
        sim_in = setExternalInput(sim_in, timed_inputs);
    end
    
    sim_in = setModelParameter(sim_in, "StopTime", num2str(stopTime));

    out = sim(sim_in);

    fields = out.who;
    for i = 1:length(fields)
        name = fields{i};
        if strcmp(name, 'tout')
            continue
        end

        T_vec = out.(name).time;
        Val_mat = out.(name).signals.values;
        nb_val = size(Val_mat, 2);

        output_table = zeros(length(T_vec), 1+nb_val);
        output_table(:, 1) = T_vec;
        name_list = ["time"];
        for j = 1:nb_val
            name_list = [name_list, string(j)];
            output_table(:, j+1) = Val_mat(:, j);
        end

        T = array2table(output_table, 'VariableNames', name_list);
        writetable(T, name+"_"+filename);
    end
end