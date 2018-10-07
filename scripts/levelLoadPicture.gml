///levelLoadPicture(file)

    var levelSprite = sprite_add(argument0,1,0,0,0,0);
    
    levelSurface = surface_create(sprite_get_width(tp),sprite_get_height(tp));
    
    surface_set_target( levelSurface );
    
    draw_clear_alpha(0,0);    
    draw_enable_alphablend(0);   
        draw_sprite(levelSprite,0,0,0);    
    draw_enable_alphablend(1)
    surface_reset_target();
    
    t = sprite_get_width(levelSprite)*sprite_get_height(levelSprite); 
    
    cartBuffer = buffer_create(t*4,buffer_fixed,1);
        buffer_get_surface(cartBuffer,levelSurface,0,0,0);
        
    levelBuffer = buffer_create(t,buffer_fixed,1);    
    for(i=0;i<t;i++) {
        var temp = 0;
        for(j=0;j<4;j++)
            temp = temp & ( ( buffer_read(cartBuffer,buffer_u8) & 3) << (3-j)*2 )
        buffer_write(levelBuffer,buffer_u8,temp);
    }

    surface_free(levelSurface);
    sprite_delete(levelSprite);         
    buffer_delete(cartBuffer);
    
    return levelBuffer;
