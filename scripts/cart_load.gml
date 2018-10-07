/// cart_load (file)
p = argument0;
if p != "" {
var tp = sprite_add(p,1,0,0,0,0);
    
if surface_exists(global.surfaceCart) {
    surface_free(global.surfaceCart); }
    
    global.surfaceCart = surface_create(sprite_get_width(sprite1),sprite_get_height(sprite1));
    
    surface_set_target(global.surfaceCart);
    global.output = "";
    draw_clear_alpha(0,0);    
    draw_enable_alphablend(0);   
    draw_sprite(tp,0,0,0);    
    draw_enable_alphablend(1)
    surface_reset_target();

kk = 0;

sprite_delete(tp); }
