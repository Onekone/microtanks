///levelLoadFromBuffer(buffer);

buff = argument0;

for(i=-1;i<5;i++)
tile_layer_delete(i);

buffer_seek(buff,buffer_seek_start,0);

instance_destroy(obj_tankspawner);
instance_destroy(obj_defensetarget);

show_debug_message('Reading tiles..');
for(i=0;i<boardSize*boardSize;i++) {
    t = buffer_read(buff,buffer_u8);
    switch t {
    case tile_enemyspawner: instance_create((i mod boardSize) * tileSize,(i div boardSize)*tileSize,obj_tankspawner); break;
    case tile_eagle: instance_create((i mod boardSize) * tileSize,(i div boardSize)*tileSize,obj_defensetarget); break;
    default: break;
    }
    tile_replace( i mod boardSize,i div boardSize, t);
    }
show_debug_message('..done!');
    
for(i=0;i<4;i++) {
    show_debug_message('Placing player '+string(i)+' spawner');
    player_spawner[i] = buffer_read( buff , buffer_u8 );
    }

ds_list_clear( global.tankSet );

p = buffer_read(buff,buffer_u8);
show_debug_message('Number of enemies : '+string(p));
    ds_list_clear(global.tankSet);
    
for(i=0;i<p;i++)
    ds_list_add( global.tankSet, buffer_read(buff,buffer_u8) );

