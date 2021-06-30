/// @description Insert description here
// You can write your code in this editor
if(o_spider_charge.charging)
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