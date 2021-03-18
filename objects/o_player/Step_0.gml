//Get inputs
right = keyboard_check_direct(ord("D"));
left = keyboard_check_direct(ord("A"));
jump = keyboard_check_pressed(vk_space);
slide = keyboard_check_direct(ord("J")); 
boost = keyboard_check_pressed(ord("K")); 
boost_key_check = keyboard_check_direct(ord("K"));


//for collision
grounded = (in_floor(tilemap,x,bbox_bottom+1) >= 0);

//for decline/incline checks
prev_y = y;

//rainbow shader _time variable
_time += 1 / room_speed;

//flash timer
flash--; 

#region State Machine
if (!global.game_paused)
{
	switch (state)
	{
		case player.idle:
		player_idle();
		break;
		
		case player.moving:
		player_walk();
		break;
		
		case player.jump:
		player_jump();
		break;
		
		case player.slide:
		player_slide();
		break;
		
		case player.boost: 
		player_boost();
		break;
		
		case player.death:
		player_death(); 
		break; 
	}
}
#endregion
