/// @desc Timer + Switch Direction

//inherit parent variables
event_inherited();

//enemy walk timer
enemy_walk_timer -= 1; 

//change direction when timer hits 0 
if (enemy_walk_timer <= 0)
{
	hsp = -hsp; 
	enemy_walk_timer = ENEMY_WALK_TIMER;
}

