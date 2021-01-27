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

}
function collision()
{
	//Horizontal Collision
	if (place_meeting(x+hsp,y,o_wall))
	{
		while (!place_meeting(x+sign(hsp),y,o_wall))
		{
			x = x + sign(hsp);
		}
		hsp = 0;
	}
	x = x + hsp;
	
	//Vertical Collision
	if (place_meeting(x,y+vsp,o_wall))
	{
		while (!place_meeting(x,y+sign(vsp),o_wall))
		{
			y = y + sign(vsp);
		}
		vsp = 0;
	}
	y = y + vsp;
}