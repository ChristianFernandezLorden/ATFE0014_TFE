function Disp3DMap(img, vec1, vec2, vec3, axis)
    if axis == 1
        offset = vec1(1);
        factor = (vec1(end)-vec1(1))/(length(vec1)-1);
    
        x = [vec2(1), vec2(end)];
        y = [vec3(1), vec3(end)];

        img = permute(img, [2 3 1]);

        disp_str = "Iapp = ";
        y_lab = "gsm";
        x_lab = "gup";
    elseif axis == 2
        offset = vec2(1);
        factor = (vec2(end)-vec2(1))/(length(vec2)-1);
    
        x = [vec1(1), vec1(end)];
        y = [vec3(1), vec3(end)];

        img = permute(img, [1 3 2]);
        disp_str = "gsm = ";
        y_lab = "Iapp";
        x_lab = "gup";
    elseif axis == 3
        offset = vec3(1);
        factor = (vec3(end)-vec3(1))/(length(vec3)-1);
    
        x = [vec1(1), vec1(end)];
        y = [vec2(1), vec2(end)];

        disp_str = "gup = ";
        y_lab = "Iapp";
        x_lab = "gsm";
    else
        disp("axis "+axis+" not supported")
    end
    
    lims = [min(img, [], 'all'), max(img, [], 'all')];
    figure
    data = img(:,:,1);
    image(y, x, data, 'CDataMapping','scaled', 'AlphaData',~isnan(data));
    ax = gca;
    ax.CLim = lims;
    xlabel(x_lab);
    ylabel(y_lab);
    colorbar
    s = uicontrol('Style','slider','Value',1,'Min',1,'Max',size(img,3),...
              'SliderStep',[1 1]/(size(img,3)-1),'CallBack',{@SlideThroughSlices,img, x, y, lims, x_lab, y_lab},...
              'Position',[130,10,400,20]);
    
    ht = uicontrol('style','edit','Position',[20,10,70,20]);
    fun = @(~,e)set(ht,'String',strcat(disp_str,num2str(offset + factor*(round(get(e.AffectedObject,'Value')-1)))));
    addlistener(s, 'Value', 'PostSet',fun);
end

function SlideThroughSlices(slider,~,img, x, y, lims, x_lab, y_lab)
    data = img(:,:,round(slider.Value));
    image(y, x, data, 'CDataMapping','scaled', 'AlphaData',~isnan(data));
    ax = gca;
    ax.CLim = lims;
    xlabel(x_lab);
    ylabel(y_lab);
    colorbar
end