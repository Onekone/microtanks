var ww=max(window_get_width(),1),
    hh=max(window_get_height(),1);
   
    view_wport = ww;
    view_hport = hh;
    aspect = ww/hh;
  
if ww/hh>1.11
{
    view_wview = (ww*th)/hh;
    view_hview = th;
    var dw = ww*default_render_height/hh;
    var dh = default_render_height;
    view_xview[0] = floor(-view_wview[0] / 2 + tw / 2 - 16)
    view_yview[0] = floor(-view_hview[0] / 2 + th / 2 - 8)
}
else
{
    view_hview = (hh*tw)/ww;
    view_wview = tw;
    var dw = default_render_width;
    var dh = floor(hh*default_render_width/ww);  
    view_xview[0] = floor(-view_wview[0] / 2 + tw / 2 - 16)
    view_yview[0] = floor(-8)-40
}
    surface_resize(application_surface, view_wview, view_hview);
    if surface_exists(global.palette_surface)
        surface_resize(global.palette_surface, view_wview, view_hview);
    else global.palette_surface = surface_create(view_wview, view_hview);
    display_set_gui_size(dw, dh);
    
    dx = display_get_gui_width();
    dy = display_get_gui_height();
    show_debug_message("---------------------------------------------------------------")
    show_debug_message("time: "+string(current_time))
    show_debug_message("------")
    show_debug_message("window difference width : "+string(view_wport-ww))  
    show_debug_message("window difference height: "+string(view_hport-hh))          
    show_debug_message("------")        
    show_debug_message("view "+string_format(view_xview,6,2)+" : "+string_format(view_yview,6,2)+" ")
    show_debug_message("size "+string_format(view_wview,6,2)+" : "+string_format(view_hview,6,2)+" ")
            
    show_debug_message("port "+string_format(view_xport,6,2)+" : "+string_format(view_yport,6,2)+" ")
    show_debug_message("size "+string_format(view_wport,6,2)+" : "+string_format(view_hport,6,2)+" ")            
        
global.app_pos = application_get_position()
