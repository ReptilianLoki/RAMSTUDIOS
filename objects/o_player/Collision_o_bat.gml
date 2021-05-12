/// @desc Kill/PlayerDeath
if (state != player.slide) and (state != player.boost)
{
	if (state != player.death)
	{
		player_death_settings(); 
		state = player.death;
	}
}
else
{
	if (!o_bat.grounded_bat)
	{
		player_death_settings(); 
		state = player.death;
	}
	else
	{
		instance_destroy(other);
		screen_shake(5,10); 
		effect_create_above(ef_firework,x,y,0,c_red)
	}
}