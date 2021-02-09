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
	//move upwards
	vsp += grv_final;
	
	movement();
	collision();
}

function player_slide()
{
	//slide
	hsp -= min(abs(hsp),current_friction) * sign(hsp);
	vsp += SPD_GRAVITY
	
	movement(); 
	collision(); 

}

