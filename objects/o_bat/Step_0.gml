/// @desc State Machine

//inherit parent variables
if (!global.game_paused)
{
	//for collision
	grounded_bat = (in_floor(tilemap,x,bbox_bottom+2) >= 0);
	
	//apply collision
	enemy_collision(); 
	
	// y setup 
	prev_y = y;

	var player_enemy_dist = point_distance(x,y,o_player.x,o_player.y);
	
	var player_above = false;
	
	if (o_player.bbox_top < bbox_bottom) 
	{
		player_above = true; 
	}
	else
	{
		player_above = false; 
	}
	
	if (big_bat_timer <= 0)
	{
		if (player_enemy_dist < sight_threshold) /*and (!bat_activated)*/and (!player_above)
		{
			if (!bat_activated)
			{
				bat_activated = true; 
			}
			
			//if (player_enemy_dist > sight_threshold)
			//{
			//	bat_activated = false; 
			//}
		}
		else if (player_enemy_dist > sight_threshold)
		{
			bat_activated = false; 
		}
		
		if (bat_activated) and (!bat_move)
		{
			if (o_player.grounded)
			{
				dir = point_direction(x,y,o_player.x + (o_player.hsp * 18),o_player.y);
				bat_activated = true;
				bat_move = true; 
			}
		}
		
		
		if (bat_move)
		{
			enemy_hsp = lengthdir_x(max_bat_speed, dir);
			enemy_vsp = lengthdir_y(max_bat_speed, dir);
		}
		
		if (grounded_bat)
		{
			if (count_down > 0)
			{
				enemy_hsp = 0; 
				enemy_vsp = 0;
			}
			count_down--;
		}
		
		if (count_down <= 0)
		{
			grounded_bat = false; 
			dir = point_direction(x,y,bat_origin_x,bat_origin_y);
			if (x == bat_origin_x) or (y == bat_origin_y)
			{
				enemy_vsp = 0;
				enemy_hsp = 0;
				bat_move = false;
				bat_activated = true; 
				count_down = bat_timer;
				big_bat_timer = BAT_TIMER; 
			}
		}
	}
	
	big_bat_timer--;
	
}