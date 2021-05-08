/// @desc State Machine

//inherit parent variables
if (!global.game_paused)
{
	//for collision
	grounded_bat = (in_floor(tilemap,x,bbox_bottom+2) >= 0);
	
	if(count_down <= 0)
	{
		grounded_bat = false;
	}
	
	//apply collision
	enemy_collision(); 
	
	// y setup 
	prev_y = y;

	var distance = point_distance(x,y,o_player.x,o_player.y);
	
	if (distance < sight_threshold) and (!bat_move)
	{
		dir = point_direction(x,y,o_player.x + (o_player.hsp * 18),o_player.y);
		bat_move = true; 
	}
	
	if (bat_move)
	{
		enemy_hsp = lengthdir_x(max_bat_speed, dir);
		enemy_vsp = lengthdir_y(max_bat_speed, dir);
	}
	
	if (grounded_bat)
	{
		if(count_down > 0)
		{
			enemy_hsp = 0; 
			enemy_vsp = 0;
		}
		//enemy_hsp = 0; 
		//enemy_vsp = 0;
		count_down--;
	}
	
	if(count_down <= 0)
	{
		dir = point_direction(x,y,bat_origin_x ,bat_origin_y);
	}
	
	if(x == bat_origin_x and y == bat_origin_y and bat_move)
	{
		count_down = bat_timer;
		bat_move = false;
	}
	
}