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
player_pos_x = 0;
player_pos_y = 0; 
max_bat_speed = 5;
spider_jumping = false; 
bat_move = false;
dir = 0
dir_origin = 0
bat_origin_x = x
bat_origin_y = y
bat_timer = 60;
count_down = bat_timer
grounded = false

