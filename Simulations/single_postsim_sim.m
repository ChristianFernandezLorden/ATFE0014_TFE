function out = single_postsim_sim(model, params, eval_params, timed_inputs)
    fixed_param_fields = fieldnames(params);
    sim_in = Simulink.SimulationInput(model);
    for k = 1:length(fixed_param_fields)
        name = fixed_param_fields{k};
        sim_in = setVariable(sim_in, name, params.(name));
    end

    if nargin >= 4
        sim_in = setExternalInput(sim_in, timed_inputs);
    end
    
    sim_in = setModelParameter(sim_in, "StopTime", num2str(eval_params.StopTime));
    
    sim_in = setPostSimFcn(sim_in, @(o) (eval_params.func(o, eval_params, params)));

    out = sim(sim_in);
end