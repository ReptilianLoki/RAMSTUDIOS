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
	
	//check slide state
	if (slide)
	{
		state = player.slide; 
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
	if (slide)
	{
		state = player.slide;
	}
	
	movement();
	collision();
}

function player_jump()
{	
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
	
	movement(); 
	collision(); 

}

