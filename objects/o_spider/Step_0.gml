/// @desc State Machine

//inherit parent variables
event_inherited();

var distance = distance_to_object(o_player);
if (distance < sight_threshold)
{
	//reduce timer
	spider_jump_timer -= 1;
	
	//when it hits 0, JUMP! 
	if (spider_jump_timer = 0) and (grounded)
	{
		//jump
		vsp = -15;
		//reset timer
		spider_jump_timer = SPIDER_JUMP_FREQ;
	}
}


