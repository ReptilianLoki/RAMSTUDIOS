/// @description  Macros, Variables, Tilemap

//basic movement
#macro SPD_WALK 0.9
#macro SPD_GRAVITY 0.4
#macro SPD_JUMP 5
#macro MAX_WALK 2
#macro MAX_SLIDE 5.75
#macro BOOST_JUMP 6
#macro BOOST_SPD 3

//friction macros
#macro FRICTION 0.5 
#macro SLIDE_FRICTION 0.015
#macro INCLINE_SLIDE_FRICTION 0.2
#macro DECLINE_SLIDE_FRICTION 0.004
#macro DECLINE_MOMENTUM 0.013
#macro INCLINE_MOMENTUM 0.10
#macro INCLINE_WALK_SLOWDOWN .1
#macro DECLINE_WALK_SLOWDOWN .9

//screenshake
#macro SCREEN_MAGNITUDE 2
#macro SCREEN_FRAMES 5

//timers
#macro COYOTE_TIME 4

animation_initialize(); 

hsp = 0;
vsp = 0;
hsp_fraction = 0;
vsp_fraction = 0;
current_friction = FRICTION;
can_squish = false;
can_jump = 0;
can_slide = false;
can_boost = false; 
boost_jump_buffer = 1; 
is_boosting = false; 
is_sliding = false;
prev_y = y;
decline_check = false;
incline_check = false;
tilemap = layer_tilemap_get_id("Collision");
//grv_final = SPD_GRAVITY;


enum player
{
	idle, 
	moving,
	jump,
	slide,
	boost
}

state = player.idle;