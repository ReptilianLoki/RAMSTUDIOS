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

}

