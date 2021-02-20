/// @description  Macros, Variables, Tilemap
#macro SPD_WALK 0.9
#macro SPD_GRAVITY 0.4
#macro MAX_WALK 2
#macro FRICTION 0.5
#macro SPD_JUMP 5
#macro BOOST_SPD 2

hsp = 0;
vsp = 0;
current_friction = FRICTION;
slide_friction = 0.022;
incline_friction = .1;
incline_walk_friction = .1;
//decline_friction = .1;
is_sliding = false;
can_slide = true;
//grv_final = SPD_GRAVITY;
prev_y = y;
hsp_fraction = 0;
vsp_fraction = 0;
can_boost = false;
incline_check = false;
tilemap = layer_tilemap_get_id("Collision");

enum player
{
	idle, 
	moving,
	jump,
	slide
}

state = player.idle;