function player_idle()
{
	//sprite update
	sprite = s_player;
	
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
	//sprite update
	sprite = s_player;
	
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
	//sprite update
	sprite = s_player;
	
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
	//update sprite index
	sprite = s_player_slide; 
	
	//Can't slide unless we are moving near max speed.
	if (abs(hsp) > (MAX_WALK - 1))
	{
		if (!is_sliding)
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
		is_sliding = true;
		can_slide = false;
		hsp = MAX_WALK * 1.8 * sign(hsp);
		screen_shake(SCREEN_MAGNITUDE,SCREEN_FRAMES);
		dust(); 
	}
	
	//check idle state
	if (hsp == 0) and (!left and !right)
	{
		state = player.idle;
	}
	
	//check moving state
	if (left or right) and (!slide)
	{
		state = player.moving;
	}
	
	//check boost state
	if (can_boost) and (boost) 
	{
		state = player.boost; 
	}
	
	movement(); 
	collision(); 
}
function player_boost()
{
	//update sprite
	sprite = s_player_boost; 
	
	//Cannot immediatly slide after direction change
	if ((left and hsp > 0) or (right and hsp < 0))
	{
		can_slide = false; 
	}

	//boost
	if (can_boost) and (grounded) and (global.coin_count >= 3) 
	{
		is_boosting = true; 
		global.coin_count -= 3; 
		hsp = MAX_WALK * BOOST_SPD * sign(hsp);
		screen_shake(SCREEN_MAGNITUDE*2,SCREEN_FRAMES*2);
		dust();
	}

	//check idle state
	if (hsp == 0) and (!left and !right)
	{
		state = player.idle;
	}
	
	//check moving state
	if (left or right) and (!slide)
	{
		state = player.moving;
	}
	
	movement(); 
	collision();
}

