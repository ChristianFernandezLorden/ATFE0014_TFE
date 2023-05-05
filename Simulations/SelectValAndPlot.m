function SelectValAndPlot(model, params, updatable_params)
    load_system(model);
    sim_in = Simulink.SimulationInput(model);
    fixed_param_fields = fieldnames(params);
    for i = 1:length(fixed_param_fields)
        name = fixed_param_fields{i};
        sim_in = setVariable(sim_in, name, params.(name));
    end

    updatable_params_fields = fieldnames(updatable_params);
    N_params = length(updatable_params_fields);

    fig = uifigure;
    gl = uigridlayout(fig, [1, 2]);
    gl.ColumnWidth = {'1x', '4x'};
    
    gparam = uigridlayout(gl, [N_params+6, 2]);
    tmp = cell(1, N_params+6);
    tmp(:) = {'2x'};
    gparam.RowHeight = tmp;
    gparam.ColumnWidth = {'1x', '1x'};
    
    gparam.RowHeight(1) = {'1x'};
    label = uilabel(gparam);
    label.Layout.Row = 1;
    label.Layout.Column = [1 2];
    label.Text = "Parameters";
    label.FontWeight = 'bold';
    label.FontSize = 20;
    label.HorizontalAlignment = 'center';

    text_fields = cell(N_params, 1);
    for i = 1:N_params
        name = updatable_params_fields{i};
        
        %text_fields(i) = uicontrol(gl, 'style', 'edit', 'string', '', ...
        %                           'Units', 'normalized', ...
        %                           'BackgroundColor', 'w', 'Tag', 'EditField');
        label = uilabel(gparam);
        label.Layout.Row = i+1;
        label.Layout.Column = 1;
        label.HorizontalAlignment = 'right';
        label.Text = name;
        label.WordWrap = 'on';
        text = uieditfield(gparam, 'numeric');
        text.Layout.Row = i+1;
        text.Layout.Column = 2;
        text.Value = updatable_params.(name);
        text_fields{i} = text;
    end

    N_curr = N_params+1;
    
    label = uilabel(gparam);
    gparam.RowHeight(N_curr+1) = {'1x'};
    label.Layout.Row = N_curr+1;
    label.Layout.Column = [1 2];
    label.Text = "Parameters";
    label.FontWeight = 'bold';
    label.FontSize = 20;
    label.Text = "Simulations and Plots";
    label.HorizontalAlignment = 'center';

    label_name = uilabel(gparam);
    label_name.Layout.Row = N_curr+2;
    label_name.Layout.Column = 1;
    label_name.HorizontalAlignment = 'right';
    label_name.Text = "Output Name";
    label_name.WordWrap = 'on';
    name_signal = uieditfield(gparam);
    name_signal.Layout.Row = N_curr+2;
    name_signal.Layout.Column = 2;

    label_num = uilabel(gparam);
    label_num.Layout.Row = N_curr+3;
    label_num.Layout.Column = 1;
    label_num.HorizontalAlignment = 'right';
    label_num.Text = "Output Num";
    label_num.WordWrap = 'on';
    num_signal = uieditfield(gparam, 'numeric');
    num_signal.Layout.Row = N_curr+3;
    num_signal.Layout.Column = 2;
    num_signal.Value = 1;
    
    label = uilabel(gparam);
    label.Layout.Row = N_curr+4;
    label.Layout.Column = 1;
    label.HorizontalAlignment = 'right';
    label.Text = "End Time";
    label.WordWrap = 'on';
    end_time = uieditfield(gparam, 'numeric');
    end_time.Layout.Row = N_curr+4;
    end_time.Layout.Column = 2;
    end_time.Value = 20;

    N_end = N_curr+4;

    btn = uibutton(gparam);
    btn.Layout.Row = N_end+1;
    btn.Layout.Column = [1 2];
    btn.Text = "Simulate";

    ax = uiaxes(gl);
    ax.Layout.Column = 2;

    fig.UserData = struct("out",[]);

    btn.ButtonPushedFcn = {@SimulateSystem, sim_in, updatable_params_fields, text_fields, name_signal, label_name, num_signal, label_num, end_time, ax};
    name_signal.ValueChangedFcn = {@plotOutput, name_signal, label_name, num_signal, label_num, ax};
    num_signal.ValueChangedFcn = {@plotOutput, name_signal, label_name, num_signal, label_num, ax};
end

function SimulateSystem(src, ~, sim_in, updatable_params_fields, text_fields, name_signal, label_name, num_signal, label_num, end_time, ax)
    fig = ancestor(src,"figure","toplevel");
    src.Text = "Simulating";
    src.Enable = 'Off';
    for i = 1:length(updatable_params_fields)
        name = updatable_params_fields{i};
        val = text_fields{i}.Value;
        sim_in = setVariable(sim_in, name, val);
    end
    time = end_time.Value;
    sim_in = setModelParameter(sim_in, "StopTime", num2str(time));

    out = sim(sim_in);
    
    fig.UserData.out = out;

    src.Text = "Simulate";
    src.Enable = 'On';

    plotOutput(src, [], name_signal, label_name, num_signal, label_num, ax);
end


function plotOutput(src, ~, name_signal, label_name, num_signal, label_num, ax)
    fig = ancestor(src,"figure","toplevel");
    out = fig.UserData.out;
    name = name_signal.Value;
    num = num_signal.Value;

    if ~isempty(out)
        try
            X = out.(name).time;
            label_name.FontColor = "black";
            try
                Y = squeeze(out.(name).signals.values(:, num));
                label_num.FontColor = "black";
                plot(ax, X, Y);
            catch
                label_num.FontColor = "red";
            end
        catch
            label_name.FontColor = "red";
        end
    end
end