//if the game isn't paused, do this
if (!global.game_paused)
{
	//for collision
	grounded = (in_floor(tilemap,x,bbox_bottom+1) >= 0);
	
	//apply enemy collision
	enemy_collision(); 
	
	//applies gravity
	vsp += SPD_GRAVITY
	
	// y setup 
	prev_y = y;
}

//enemy walk timer
enemy_walk_timer -= 1; 

//change direction when timer hits 0 
if (enemy_walk_timer <= 0)
{
	hsp = -hsp; 
	enemy_walk_timer = ENEMY_WALK_TIMER;
}

