function out_val = monteCarloTest(params, var_params, model, eval_params, nb_par)
    load_system(model)
    
    fixed_param_fields = fieldnames(params);
    updatable_params_fields = fieldnames(var_params);
    
    ind = 0;
    out_val = zeros(eval_params.nbEval, eval_params.nbOut);
    for i = 1:eval_params.nbEval
        sim_tmp = Simulink.SimulationInput(model);
        for j = 1:length(fixed_param_fields)
            name = fixed_param_fields{j};
            sim_tmp = setVariable(sim_tmp, name, params.(name));
        end

        for j = 1:length(updatable_params_fields)
            name = updatable_params_fields{j};
            distrib_param = var_params.(name);
            r = normrnd(distrib_param(1), distrib_param(2));
            sim_tmp = setVariable(sim_tmp, name, r);
        end
        
        sim_tmp = setModelParameter(sim_tmp, "StopTime", num2str(eval_params.StopTime));

        sim_tmp = setPostSimFcn(sim_tmp, @(o) (eval_params.func(o, eval_params.StartAnalyseTime)));
        
        ind = ind+1;
        sim_in(ind) = sim_tmp;

        if (ind == nb_par)
            out = parsim(sim_in);
            disp(i)
            for j = 1:nb_par
                out_val(i+j-ind, :) = out(j).val;
            end
            ind = 0;
        end
    end

    if ind > 0
        sim_in = sim_in(1:ind);
        out = parsim(sim_in);
        for j = 1:ind
            out_val(nb_eval+j-ind, :) = out(j).val;
        end
    end
end