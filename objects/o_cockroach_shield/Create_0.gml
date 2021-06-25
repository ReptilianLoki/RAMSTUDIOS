/// @desc Set Speed + Timer

//inherit parent variables
event_inherited();
animation_initialize();

enemy_hsp = 1;
enemy_vsp = 0;
enemy_walk_timer = ENEMY_WALK_TIMER; 
shield_timer = random_range(180,300);
shielded = false