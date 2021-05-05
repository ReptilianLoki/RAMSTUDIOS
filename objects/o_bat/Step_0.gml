/// @desc State Machine

//inherit parent variables
if (!global.game_paused)
{
	//for collision
	grounded = (in_floor(tilemap,x,bbox_bottom+2) >= 0);
	
	//apply collision
	enemy_collision(); 
	
	// y setup 
	prev_y = y;

	var dir = point_direction(x,y,player_pos_x,player_pos_y);
	var distance = point_distance(x,y,o_player.x,o_player.y);
	
	if (distance < sight_threshold) and (!bat_move)
	{
		player_pos_x = o_player.x + (o_player.hsp * 18);
		player_pos_y = o_player.y;
		bat_move = true; 
	}
	
	if (bat_move)
	{
		enemy_hsp = lengthdir_x(max_bat_speed, dir);
		enemy_vsp = lengthdir_y(max_bat_speed, dir);
	}
	
	if (grounded)
	{
		bat_move = false;
		enemy_hsp = 0; 
		enemy_vsp = 0; 
		player_pos_x = 0;
		player_pos_y = 0; 
	}
}