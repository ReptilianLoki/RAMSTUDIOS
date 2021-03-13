function player_idle()
{
	//sprite update
	sprite = s_player;
	
	//check moving state
	if (left or right)
	{
		state = player.moving;
	}
	
	//check slide state
	if (slide) and (hsp > MAX_WALK) 
	{
		state = player.slide; 
	}
	
	//check jump state
	if (jump) 
	{
		state = player.jump;
	}
	
	//check death state
	if (place_meeting(x,y,o_death))
	{
		state = player.death; 
		death_timer = DEATH_TIMER; 
		hsp = 0; 
		vsp = 0; 
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
	
	//check death state
	if (place_meeting(x,y,o_death))
	{
		state = player.death; 
		death_timer = DEATH_TIMER; 
		hsp = 0; 
		vsp = 0; 
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
	
	//check death state
	if (place_meeting(x,y,o_death))
	{
		state = player.death; 
		death_timer = DEATH_TIMER;
		hsp = 0; 
		vsp = 0; 
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
	
	if (is_sliding) and (grounded) 
	{
		slide_residue();
	}
	
	if (global.coin_count >= 3)
	{
		can_boost = true;
	}
	else
	{
		can_boost = false; 
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
	if (boost) and (can_boost)
	{
		state = player.boost; 
	}
	
	//check death state
	if (place_meeting(x,y,o_death))
	{
		state = player.death; 
		death_timer = DEATH_TIMER; 
		hsp = 0; 
		vsp = 0; 
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
		can_boost = false; 
	}

	//boost
	if (grounded) and (can_boost) 
	{
		is_boosting = true; 
		can_boost = false; 
		global.coin_count -= 3; 
		hsp = MAX_SLIDE * BOOST_SPD * sign(hsp);
		screen_shake(SCREEN_MAGNITUDE*2,SCREEN_FRAMES*2);
		dust();
	}
	
	if (is_boosting) and (grounded) 
	{
		repeat(5) slide_residue(); 
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
	
	//check death state
	if (place_meeting(x,y,o_death))
	{
		state = player.death; 
		death_timer = DEATH_TIMER; 
		hsp = 0; 
		vsp = 0; 
	}
	
	movement(); 
	collision();
}
function player_death()
{
	//temp room fix 
	if (room = Room1) 
	{	
		return_room = Room1;
	}
	else
	{
		return_room = room_last; 
	}
	
	//subtract 1 from the death timer every frame
	death_timer -= 1;
	
	//if timer hits 0, do the transition and restart room
	if (death_timer <= 0)
	{	
		transition(TRANS_MODE.GOTO, return_room);
		death_timer = 0; 
	}
}

