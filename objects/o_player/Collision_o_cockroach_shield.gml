/// @desc Kill/PlayerDeath
if(o_cockroach_shield.shielded) //and ((state == player.slide) or (state == player.boost))
{
	if (state != player.death)
	{
		player_death_settings(); 
		state = player.death;
	}
}
else
{
	instance_destroy(other); 
	screen_shake(5,10); 
	effect_create_above(ef_firework,x,y,0,c_red)
}