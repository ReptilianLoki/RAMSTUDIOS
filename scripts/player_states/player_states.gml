function player_idle()
{
	//check moving state
	if (left or right)
	{
		state = player.moving;
	}
	
	//check jump state
	if (jump) 
	{
		state = player.jump;
	}
	
	movement();
	collision();
}
function player_walk()
{
	
	//check idle state
	if (hsp == 0 or !left and !right)
	{
		state = player.idle;
	}
	
	//check jump state
	if (jump)
	{
		state = player.jump;
	}
	
	//check slide state
	if (slide) // and !incline_check)
	{
		state = player.slide;
	}
	
	movement();
	collision();
}
function player_jump()
{	
	//check idle state
	if (hsp == 0 or !left and !right)
	{
		state = player.idle;
	}
	
	//check slide state
	if (slide) // and !incline_check)
	{
		state = player.slide;
	}
	
	//check moving state
	if (left or right)
	{
		state = player.moving;
	}
	
	movement();
	collision();
}
function player_slide()
{
	//check if we are sliding but just released the slide key
	if (is_sliding and !slide)
	{
		state = player.moving;
	}
	
	//Slide Boost
	if (is_sliding and can_boost and boost)
	{
		hsp = MAX_WALK * BOOST_SPD * sign(hsp);
		if (hsp >= MAX_BOOST)
		{
			hsp = MAX_BOOST;
		}
		else if (hsp <= -MAX_BOOST)
		{
			hsp = -MAX_BOOST;
		}
		can_boost = false;
		screen_shake(SCREEN_MAGNITUDE*2,SCREEN_FRAMES*2);
		dust();
	}
	
	movement(); 
	collision(); 
}

