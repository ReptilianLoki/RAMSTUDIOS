draw_sprite_ext(sprite,frame,x,y,xScale * facing,yScale,angle,color,alpha)
if (!can_squish)
{
	xScale = 1;
	yScale = 1;
}	
if (state == player.slide) and (slide) 
{
	//slide sprite
	if (state == player.slide)
	{
		sprite = s_player_slide;
	}
	else if (!slide)
	{
		sprite = s_player;
	}
	//boost sprite
	if (boost) 
	{
		sprite = s_player_boost;
	}
	
	//changes angle of sprite on decling slopes
	if (decline_check) 
	{

		if (hsp <= 0)
		{
			angle = 45;
		}
		if (hsp >= 0) 
		{
			angle = -45;
		}
	}
	else if (incline_check) 
	{
		if (hsp <= 0)
		{
			angle = -45;
		}
		if (hsp >= 0) 
		{
			angle = 45;
		}
	}
	else if (!incline_check) and (!decline_check)
	{
		angle = 0; 
	}
}
else
{
	sprite = s_player; 
	angle = 0; 
}

