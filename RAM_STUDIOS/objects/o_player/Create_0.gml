/// @description  Macros, Variables, Tilemap
#macro SPD_WALK 0.1
#macro SPD_GRAVITY 0.4
#macro MAX_WALK 2
#macro FRICTION 0.5

hsp = 0;
vsp = 0;
current_friction = FRICTION;
grv_final = SPD_GRAVITY;
prev_y = y;
hsp_fraction = 0;
vsp_fraction = 0;
tilemap = layer_tilemap_get_id("Collision");

enum player
{
	idle, 
	moving,
	jump,
	slide
}

state = player.idle;


