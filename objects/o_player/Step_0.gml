//Get inputs
right = keyboard_check_direct(vk_right);
left = keyboard_check_direct(vk_left);
jump = keyboard_check_pressed(vk_up) or keyboard_check_pressed(ord("W"));
slide = keyboard_check_direct(vk_space); 
boost = keyboard_check_pressed(vk_shift); 
boost_key_check = keyboard_check_direct(vk_shift); 

//for collision
grounded = (in_floor(tilemap,x,bbox_bottom+1) >= 0);

//for decline/incline checks
prev_y = y;

#region State Machine
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
}
#endregion
