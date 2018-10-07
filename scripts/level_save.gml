///level_save(file_name)

var buff = buffer_create(256,buffer_fixed,1);

// board
for(i=0;i<board_size;i+=2)
    for(j=0;j<board_size;j++) {
        t = 0;
        for(k=0;k<2;k++) {
            tmp = global.tileSet[#k+i,j]
            if (tmp>=0 and tmp<16) {
                t = t & tmp << 4*(1-k);
            }
        }
        buffer_write(buff,buffer_u8,t);
}

// players
for(i=0;i<4;i++)
    buffer_write(buff,buffer_u8,player_spawner[i]);

// tanks
for(i=0;i<20;i+=4) {
    t = 0;
    for(j=0;j<4;j++) {
        tmp = global.tankSet[|i+j];
        t = t & tmp << 2*(3-j);
        }
    buffer_write(buff,buffer_u8,t);
    }
    
buffer_save(buff,argument0);
