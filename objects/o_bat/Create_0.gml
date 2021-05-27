/// @desc Inherit + Setup
animation_initialize();
enemy_hsp_fraction = 0;
enemy_vsp_fraction = 0;
tilemap = layer_tilemap_get_id("Collision");
prev_y = y; 
enemy_hsp = 0;
enemy_vsp = 0; 
sight_threshold = 200; 
player_pos = false;
max_bat_speed = 5;
spider_jumping = false; 
bat_move = false;
dir = 0;
bat_origin_x = x;
bat_origin_y = y;
bat_timer = 60;
grounded = false;
can_collide = false; 
count_down = bat_timer;
big_bat_timer = BAT_TIMER; 
bat_activated = false; 
//h_buff = 18;
player_speed = 0;
player_max_speed = 20;

