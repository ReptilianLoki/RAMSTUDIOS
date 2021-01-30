//Get inputs
right = keyboard_check_direct(vk_right);
left = keyboard_check_direct(vk_left);
jump = keyboard_check(vk_up) or keyboard_check(ord("W"));
slide = keyboard_check(vk_down) or keyboard_check(ord("S"));
boost = keyboard_check_pressed(vk_shift); 

grounded = (in_floor(tilemap,x,bbox_bottom+1) >= 0);

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
}
#endregion
