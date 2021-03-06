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
#macro SLIDE_FRICTION 0.022 
#macro INCLINE_SLIDE_FRICTION 0.1
#macro INCLINE_WALK_FRICTION 0.8
#macro DECLINE_SLIDE_FRICTION 0.005
#macro DECLINE_WALK_FRICTION 0.55
#macro DECLINE_MOMENTUM 0.010
#macro INCLINE_MOMENTUM 0.010

//screenshake
#macro SCREEN_MAGNITUDE 2
#macro SCREEN_FRAMES 5

//timers
#macro BOOST_TIMER 0
#macro COYOTE_TIME 4

animation_initialize(); 

hsp = 0;
vsp = 0;
current_friction = FRICTION;
is_sliding = false;
can_slide = false;
can_squish = false;
//grv_final = SPD_GRAVITY;
prev_y = y;
hsp_fraction = 0;
vsp_fraction = 0;
// can_boost = false;
can_jump = 0; 
boost_timer = 0; 
is_boosting = false; 
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