/// @description Collision Basics

//if the game isn't paused, do this
if (!global.game_paused)
{
	//for collision
	grounded = (in_floor(tilemap,x,bbox_bottom+1) >= 0);
	
	//apply gravity
	enemy_vsp += SPD_GRAVITY; 
	
	//apply collision
	enemy_collision(); 
	
	// y setup 
	prev_y = y;
}