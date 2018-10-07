///levelSaveIntoBuffer()

var buff = buffer_create(281,buffer_grow,1);

// board

show_debug_message('Saving tiles...')
for(i=0;i<boardSize*boardSize;i++) 
    buffer_write( buff, buffer_u8, global.tileSet[#i mod boardSize,i div boardSize] );    
show_debug_message('..done!')    

// players
for(i=0;i<4;i++) {
    show_debug_message('Saving position of player '+string(i+1)+' in tile '+string(global.player_spawner[i]))    
    buffer_write( buff, buffer_u8, global.player_spawner[i]);
    }

// tanks

t = ds_list_size(global.tankSet);
show_debug_message('Saving '+string(t)+' amount of enemies');

buffer_write(buff,buffer_u8,t & 255);

for(i=0;i<t;i++) {
    show_debug_message('Tank '+string(i+1)+' is '+string(global.tankSet[|i]));
    buffer_write( buff, buffer_u8, global.tankSet[|i]);
    }

return buff;
