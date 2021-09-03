//find player position
var distance = distance_to_object(o_player);

//timers for bullet firing delay
firing_delay = firing_delay - 1; 
projectile_timer = projectile_timer - 1; 

//if player is nearby, do this...
if (distance < sight_threshold)
{
	if (projectile_timer <= 0)
	{
		projectile_timer = PROJECTILE_TIMER; 
		with (instance_create_layer(x,y,"Instances",o_spitter_projectile))
		{
			firing_delay = 40; 
			spd = 5;
			//set direction to player's position
			direction = point_direction(x,y,o_player.x + (spd),o_player.y) + random_range (2,-2); 
			image_angle = direction;
		}
	}
}