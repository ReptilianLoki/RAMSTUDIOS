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
var dist_ground = 1;

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
		//reset timer
		spider_jump_timer = SPIDER_JUMP_FREQ;
	}
	else if (!grounded)
	{
		//jump check
		spider_jumping = false;
	
		//apply lunge
		enemy_hsp = (o_player.x - x) * spider_lunge; 
	}
	
	while(spider_jumping && in_floor(tilemap,x,bbox_bottom + dist_ground) <= 0)
	{
		dist_ground++;
	}
	
	if(spider_jumping && in_floor(tilemap,x + 1, bbox_bottom + dist_ground) <= 0)
	{
		enemy_hsp = 0;
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

