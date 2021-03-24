/// @description Collision Basics

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