/// @description  Macros, Variables, Tilemap
#macro SPD_WALK 0.9
#macro SPD_GRAVITY 0.4
#macro MAX_WALK 2
#macro FRICTION 0.5 
#macro SLIDE_FRICTION 0.022 
#macro INCLINE_SLIDE_FRICTION .96
#macro INCLINE_WALK_FRICTION 0.1
#macro SPD_JUMP 5
#macro BOOST_JUMP 6
#macro BOOST_SPD 3
#macro MAX_BOOST 5.5
#macro SCREEN_MAGNITUDE 2
#macro SCREEN_FRAMES 5

animation_initialize(); 

hsp = 0;
vsp = 0;
current_friction = FRICTION;
//decline_friction = .1;
is_sliding = false;
can_slide = false;
can_squish = false;
//grv_final = SPD_GRAVITY;
prev_y = y;
hsp_fraction = 0;
vsp_fraction = 0;
can_boost = false;
decline_check = false;
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