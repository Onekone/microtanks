///scr_init( DO NOT RUN MANUALLY RISKING MEMORY LEAKS )

gml_pragma("global", "scr_init()"); 
//gml_release_mode(true);

global.tileSet = ds_grid_create(256,256);
global.mapPack = "default";

global.engine_sound_active = 0
global.engine_sound_idle   = 0

global.surfaceCart = -1;

global.player_spawner[0] = 245;
global.player_spawner[1] = 250;
global.player_spawner[2] = 229;
global.player_spawner[3] = 234;

for(var i=0;i<4;i++) {
    global.input_key[i,key_left]   = 0
    global.input_key[i,key_right]  = 0
    global.input_key[i,key_up]     = 0
    global.input_key[i,key_down]   = 0
    global.input_key[i,key_b]      = 0
    global.input_key[i,key_a]      = 0
    global.input_key[i,key_start]  = 0
    global.input_key[i,key_select] = 0
    }
    
    global.input_key[0,key_left]   = vk_left
    global.input_key[0,key_right]  = vk_right
    global.input_key[0,key_up]     = vk_up
    global.input_key[0,key_down]   = vk_down
    global.input_key[0,key_b]      = ord('Z')
    global.input_key[0,key_a]      = ord('X')
    global.input_key[0,key_start]  = vk_enter
    global.input_key[0,key_select] = vk_shift    

global.tankSet = ds_list_create()    
for(var i=0;i<255;i++)
    ds_list_add(global.tankSet,0);

global.players = 1;

if os_browser != browser_not_a_browser
    global.os_name = "HTML5";
else
switch os_type {
    case os_windows: global.os_name = "Windows"; break;
    case os_android: global.os_name = "Android"; break;
    case os_ios: global.os_name = "iOS"; break;
}

var t = ' !"\#$%&'+"'"+'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}';

for(var i=0;i<4;i++)
 for(var j=0;j<8;j++) {
   global.input_pressed[i,j]=0;
   global.input_released[i,j]=0;
   global.input[i,j] = 0;
 }
 
global.ExtraTankScoreSecond = 50000
global.ExtraTankScoreEvery  = 30000;

global.RoundStatus = round_ok;

for(i=0;i<4;i++)
global.input_control[i] = i;

global.PlayerColor[0] = p_yellow;
global.PlayerColor[1] = p_cyan;
global.PlayerColor[2] = p_lime;
global.PlayerColor[3] = p_red;

global.fontMini = font_add_sprite_ext(fontPico8,t,0,1);
global.fontNormal = font_add_sprite_ext(fontArcade,t,0,0);
draw_set_font(global.fontNormal);

global.paused = 2;

for(var i=0;i<boardSize;i++)
    for(var j=0;j<boardSize;j++)
        tile_replace(i,j,tile_none);
        
for(var i=0;i<4;i++) {
    global.Score[i] = 0;
    global.Lives[i] = 3;
    global.PowerUp[i] = 0;
    global.ExtraTankScore[i] = 20000;                                            
    
    for(var j=0;j<4;j++) {
     global.TotalKills[i,j]=0;
     global.RoundKills[i,j]=0; 
     }
}        

global.palette_surface = surface_create(160,144);
        
global.TimeStop = -1;
global.BunkerUp = -1;
global.timer = 0;
global.wrapping_timer = 0;
global.highScore = 20000;

global.EnemiesLeft = 20;
global.EnemiesGoal = 20;
global.Round       = 0;
