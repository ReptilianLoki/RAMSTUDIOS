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


