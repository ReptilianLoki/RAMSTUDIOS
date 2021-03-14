if (state != player.slide) and (state != player.boost)
{
	if (abs(hsp) >= MAX_SLIDE)
	{
		hsp = 0; 
		vsp = 0; 
		death_timer = DEATH_TIMER; 
		state = player.death;
	}
}
else
{
	instance_destroy(other); 
	screen_shake(5,10); 
	effect_create_above(ef_firework,x,y,0,c_red)
}
