/// @desc State Machine

//inherit parent variables
event_inherited();

//apply friction
enemy_friction(); 
	
var distance = distance_to_object(o_player);
var spider_lunge = 0.05;
var max_spider_speed = 3;
var distance_difference = (o_player.x - x);
var future_pos_check = (in_floor(tilemap,x + (distance_difference/2),bbox_bottom+1) >= 0);
var player_below_check = false;


if (o_player.bbox_top > bbox_bottom) 
{
	player_below_check = true;
}
else
{
	player_below_check = false; 
}

if (distance < sight_threshold)
{
	//reduce timer
	spider_jump_timer -= 1;
	
	//when it hits 0, JUMP! 
	if (spider_jump_timer <= 0) and (grounded) 
	{
		
		//jump check
		spider_jumping = true;
		//jump
		if (future_pos_check)
		{
			enemy_vsp = -7;
		}
		else if (!future_pos_check) and (player_below_check)
		{
			enemy_vsp = -7; 
		}
		
		//reset timer
		spider_jump_timer = SPIDER_JUMP_FREQ;
		player_pos = o_player.x;
	}
	else if (!grounded)
	{
		//jump check
		spider_jumping = false;
	
		//apply lunge
		enemy_hsp = (player_pos - x) * spider_lunge;
	}
	
	//limit spider speed
	if (enemy_hsp >= max_spider_speed)
	{
		enemy_hsp = max_spider_speed;
	}
	else if (enemy_hsp <= -max_spider_speed)
	{
		enemy_hsp = -max_spider_speed;
	}
}
