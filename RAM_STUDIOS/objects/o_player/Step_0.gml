//Get inputs
key_right = keyboard_check_direct(vk_right);
key_left = keyboard_check_direct(vk_left);

prev_y = y;

//Calculate Movement
move = (key_right - key_left) //* SPD_WALK
//hsp = move;
if(key_right or key_left)
{
	hsp += SPD_WALK * move;
	if(hsp >= MAX_WALK)
	{
		hsp = MAX_WALK
	}
	else if(hsp <= -MAX_WALK)
	{
		hsp = -MAX_WALK;
	}
}
else
{
	hsp -= min(abs(hsp),current_friction) * sign(hsp);
}

vsp += SPD_GRAVITY

x += hsp;
y += vsp;
