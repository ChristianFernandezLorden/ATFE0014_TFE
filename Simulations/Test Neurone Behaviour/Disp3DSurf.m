function Disp3DSurf(img, vec1, vec2, vec3)
    offset = vec3(1);
    factor = (vec3(end)-vec3(1))/(length(vec3)-1);
    
    lims = [min(img, [], 'all'), max(img, [], 'all')];
    figure
    y = vec1;
    x = vec2;
    surf(x, y, img(:,:,1));
    ax = gca;
    ax.CLim = lims;
    ax.ZLim = lims;
    colorbar
    s = uicontrol('Style','slider','Value',1,'Min',1,'Max',size(img,3),...
              'SliderStep',[1 1]/(size(img,3)-1),'CallBack',{@SlideThroughSlices,img, x, y, lims},...
              'Position',[130,10,400,20]);
    
    ht = uicontrol('style','edit','Position',[20,10,70,20]);
    fun = @(~,e)set(ht,'String',strcat("gsm = ",num2str(offset + factor*(round(get(e.AffectedObject,'Value')-1)))));
    addlistener(s, 'Value', 'PostSet',fun);
end

function SlideThroughSlices(slider,~,img, x, y, lims)
    surf(x, y, img(:,:,round(slider.Value)));
    ax = gca;
    ax.CLim = lims;
    ax.ZLim = lims;
    colorbar
end