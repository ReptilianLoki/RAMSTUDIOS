/// @description  Macros, Variables, Tilemap
macros();
animation_initialize(); 
rainbow_shader_setup(); 

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
death_timer = 0; 
tilemap = layer_tilemap_get_id("Collision");

enum player
{
	idle, 
	moving,
	jump,
	slide,
	boost,
	death
}

state = player.idle;