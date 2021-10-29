#macro TILE_SIZE 16

tiles = sprite_get_width(s_collision) / TILE_SIZE
heightstoget = tiles * TILE_SIZE;


//Make Tile layer
var layerid = layer_create(0,"Tiles");
tilemapid = layer_tilemap_create(layerid,0,0,t_collision,tiles,1);

//Create Tiles
for (var i = 0; i <= tiles; i++)
{
	tilemap_set(tilemapid, i, i, 0);
	show_debug_message("Tile " + string(i) + " set");
}

//persistent globals
global.player_health_max = 4; 
global.player_health = 4;
global.coin_count = 0;
global.checkpoint = [0,0];
global.checkpoint_check = 0;
