/// @desc State Machine

//inherit parent variables
event_inherited();

enemy_friction();

distance = distance_to_object(o_player);
distance_dir = sign(o_player.x - x);

if(grounded)
{
	if(enemy_hsp == 0)
	{
		timer--;
		charging = false;
	}
	
	if(distance < sight_threshold and !charging and timer <= 0)
	{
		enemy_hsp = 8 * distance_dir;
		charging = true;
		timer = charging_timer;
	}
}
