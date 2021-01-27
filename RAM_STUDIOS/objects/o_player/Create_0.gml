/// @description  Macros, Variables, Tilemap
#macro SPD_WALK 0.25
#macro SPD_GRAVITY 0.4
#macro MAX_WALK 6
#macro FRICTION 0.5

hsp = 0;
vsp = 0;
current_friction = FRICTION;
grv_final = SPD_GRAVITY;
prev_y = y;

enum player
{
	idle, 
	moving,
	jump,
	slide
}

state = player.idle;


