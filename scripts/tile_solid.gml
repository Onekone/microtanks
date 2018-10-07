/// tile_solid(id)

switch (argument0) {
    case tile_permamentlysolid: case tile_brokenbrick: case tile_brick: case tile_steel: case tile_brokensteel: case tile_water: return true; break;
    default: return false;
}
