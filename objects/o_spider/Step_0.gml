/// @desc State Machine

//inherit parent variables
event_inherited();

var distance = distance_to_object(o_player);
var spider_lunge = 0.05;
if (distance < sight_threshold)
{
	//reduce timer
	spider_jump_timer -= 1;
	
	//when it hits 0, JUMP! 
	if (spider_jump_timer = 0) and (grounded)
	{
		//jump check
		spider_jumping = true;
		//jump
		enemy_vsp = -7;
		//reset timer
		spider_jump_timer = SPIDER_JUMP_FREQ;
	}
	else if (!grounded)
	{
		spider_jumping = false;
		enemy_hsp = (o_player.x - x) * spider_lunge;
	}
}
