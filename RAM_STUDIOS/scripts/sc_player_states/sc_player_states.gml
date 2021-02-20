function player_idle()
{
	sprite_index = s_player;
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
	can_boost = true;
	sprite_index = s_player;
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
	if (slide)
	{
		state = player.slide;
	}
	
	movement();
	collision();
}

function player_jump()
{	
	sprite_index = s_player;
	movement();
	collision();
}

function player_slide()
{
	sprite_index = s_player_slide;
	//check if we are sliding but just released the slide key
	if (is_sliding and !slide)
	{
		state = player.moving;
	}
	
	if(is_sliding and can_boost and boost)
	{
		hsp = MAX_WALK * BOOST_SPD * sign(hsp);
		can_boost = false;
	}
	
	movement(); 
	collision(); 

}

