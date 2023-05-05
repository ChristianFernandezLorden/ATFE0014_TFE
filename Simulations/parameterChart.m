function out_val = parameterChart(params, var_params, model, eval_params, nb_par)
    load_system(model)

    fixed_param_fields = fieldnames(params);
    updatable_params_fields = fieldnames(var_params);
    
    dim = [];
    for i = 1:length(updatable_params_fields)
        name = updatable_params_fields{i};
        dim(i) = length(var_params.(name));
    end
    
    out_dim = [eval_params.nbOut, dim];
    out_val = zeros(out_dim);
    off = cumprod([1, dim(1:end-1)])';
    
    ind = 0;
    pos = ones(size(dim));
    pos_vec = zeros(nb_par, 1);
    for i = 1:prod(dim, 'all')
        pos_ind = (pos-1)*off + 1;

        for j = 1:eval_params.nbEval
            sim_tmp = Simulink.SimulationInput(model);
            for k = 1:length(fixed_param_fields)
                name = fixed_param_fields{k};
                sim_tmp = setVariable(sim_tmp, name, params.(name));
            end
    
            for k = 1:length(updatable_params_fields)
                name = updatable_params_fields{k};
                vec_param = var_params.(name);
                sim_tmp = setVariable(sim_tmp, name, vec_param(pos(k)));
            end
            
            sim_tmp = setModelParameter(sim_tmp, "StopTime", num2str(eval_params.StopTime));
    
            sim_tmp = setPostSimFcn(sim_tmp, @(o) (eval_params.func(o, eval_params.StartAnalyseTime)));

            ind = ind+1;
            sim_in(ind) = sim_tmp;
            pos_vec(ind) = pos_ind;
    
            if (ind == nb_par)
                ind = 0;
                out = parsim(sim_in);
                disp(i)
                for k = 1:nb_par
                    out_val(:, pos_vec(k)) = reshape(out_val(:, pos_vec(k)), 1, []) + reshape(out(k).val, 1, []);
                end
            end
        end


        p = 1;
        while p <= length(pos)
            pos(p) = pos(p)+1;
            if pos(p) > dim(p)
                pos(p) = 1;
                p = p+1;
            else
                break
            end
        end
    end

    if ind > 0
        sim_in = sim_in(1:ind);
        out = parsim(sim_in);
        for k = 1:ind
            out_val(:, pos_vec(k)) = reshape(out_val(:, pos_vec(k)), 1, []) + reshape(out(k).val, 1, []);
        end
    end

    out_val = out_val/eval_params.nbEval;
end