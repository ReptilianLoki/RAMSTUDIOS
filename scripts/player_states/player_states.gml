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

	//Can't slide unless we are moving near max speed.
	if (abs(hsp) > (MAX_WALK - 1))
	{
		if (!is_sliding) // and (!incline_check)
		{
			can_slide = true;
		}
		else
		{
			can_slide = false;
		}
	}
	
	//Cannot immediatly slide after direction change
	if ((left and hsp > 0) or (right and hsp < 0))
	{
		can_slide = false; 
	}
	
	//Check if we are holding down the slide button.
	if (can_slide and slide)
	{
		boost_timer = 15; 
		is_sliding = true;
		can_slide = false;
		hsp = MAX_WALK * 1.8 * sign(hsp);
		state = player.slide;
		screen_shake(SCREEN_MAGNITUDE,SCREEN_FRAMES);
		dust(); 
	}
	
	//check if we are sliding but just released the slide key.
	if (is_sliding and !slide)
	{
		is_sliding = false;
	}
	
	//check if we are boosting but just released the boost key.
	if (is_boosting and !boost_key_check)
	{
		is_boosting = false; 
	}
	
	//slide boost
	if (is_sliding and boost and grounded and (global.coin_count >= 3))
	{
		boost_timer = BOOST_TIMER; 
		is_boosting = true; 
		// can_boost = false;
		global.coin_count -= 3; 
		hsp = MAX_WALK * BOOST_SPD * sign(hsp);
		screen_shake(SCREEN_MAGNITUDE*2,SCREEN_FRAMES*2);
		dust();
	}
	
	movement(); 
	collision(); 
}

