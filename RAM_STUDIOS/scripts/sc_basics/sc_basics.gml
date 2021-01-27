function movement()
{
	//Calculate Movement
	move = (right - left) //* SPD_WALK
	//hsp = move;
	if (right or left)
	{
		hsp += SPD_WALK * move;
		if (hsp >= MAX_WALK)
		{
			hsp = MAX_WALK
		}
		else if (hsp <= -MAX_WALK)
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
}
function collision()
{
	
}