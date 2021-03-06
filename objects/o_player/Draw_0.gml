draw_sprite_ext(sprite,frame,x,y,xScale * facing,yScale,angle,color,alpha)

if (!can_squish)
{
	xScale = 1;
	yScale = 1;
}	

if (state == player.slide) and (slide) 
{
	//slide sprite
	sprite = s_player_slide;
	
	//boost sprite
	if (is_boosting) 
	{
		sprite = s_player_boost;
	} 
	else 
	{
		sprite = s_player_slide; 
	}
	
	//changes angle of sprite on decling slopes
	var pos = tilemap_get_at_pixel(tilemap,x,y);
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
	else if (pos == 2) or (pos == 3)
	{
		angle = angle; 
	}
	else
	{
		angle = 0;
	}
}
else
{
	sprite = s_player; 
	angle = 0; 
}

