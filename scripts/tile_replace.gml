/// tile_replace( x px, y px, index) 

if argument0 < 0 or argument0 >= boardSize or argument1 < 0 or argument1 >= boardSize
    return 0;

var p = global.tileSet[#argument0,argument1];

switch p {
    case tile_jungle:
        var p1 = tile_layer_find(-1,argument0*8,argument1*8);
        if p1>0 tile_delete(p1);
            break;
    
    case tile_water:
        var p1 = tile_layer_find(2,argument0*8,argument1*8)
        var p2 = tile_layer_find(3,argument0*8,argument1*8)        
        if p1>0 tile_delete(p1);
        if p2>0 tile_delete(p2);    
            break;
    
    case tile_none: case tile_permamentlysolid:
        break;
        
    case tile_enemyspawner: case tile_eagle:
    var p1 = tile_layer_find(4,argument0*8,argument1*8)
    if p1>0 tile_delete(p1);            
    break;
        
    default:
    var p1 = tile_layer_find(1,argument0*8,argument1*8)
    if p1>0 tile_delete(p1);        

}

global.tileSet[#argument0,argument1] = argument2;

switch( argument2 ) {
    case tile_brokenbrick:  tile_add(background2,8,0,8,8,argument0*8,argument1*8,1) break;
    case tile_brick:        tile_add(background2,16,0,8,8,argument0*8,argument1*8,1) break;
    case tile_brokensteel:  tile_add(background2,24,0,8,8,argument0*8,argument1*8,1) break;
    case tile_steel:        tile_add(background2,32,0,8,8,argument0*8,argument1*8,1) break;
    case tile_jungle:       tile_add(background2,0,8,8,8,argument0*8,argument1*8,-1) break;
    case tile_snow:         tile_add(background2,8,8,8,8,argument0*8,argument1*8,1) break;
    case tile_water:        tile_add(background2,16,8,8,8,argument0*8,argument1*8,3)
                            tile_add(background2,24,8,8,8,argument0*8,argument1*8,2) break;
    case tile_sand:         tile_add(background2,32,8,8,8,argument0*8,argument1*8,1) break;
    case tile_swamp:        tile_add(background2,8,16,8,8,argument0*8,argument1*8,1) break;
    case tile_eagle:        tile_add(background2,8,24,8,8,argument0*8,argument1*8,4) break;
    case tile_enemyspawner: tile_add(background2,24,24,8,8,argument0*8,argument1*8,4) break;
}

