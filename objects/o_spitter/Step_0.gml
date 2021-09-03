//find player position
var distance = distance_to_object(o_player);

//timers for bullet firing delay
projectile_timer = projectile_timer - 1; 

//if player is nearby, do this...
if (distance < sight_threshold)
{
	if (projectile_timer <= 0)
	{
		projectile_timer = 50; 
		with (instance_create_layer(x,y,"Instances",o_spitter_projectile))
		{
			spd = 5;
			//set direction to player's position
			direction = 0; 
			image_angle = direction;
		}
		with (instance_create_layer(x,y,"Instances",o_spitter_projectile))
		{
			spd = 5;
			//set direction to player's position
			direction = 90; 
			image_angle = direction;
		}
		with (instance_create_layer(x,y,"Instances",o_spitter_projectile))
		{
			spd = 5;
			//set direction to player's position
			direction = 180; 
			image_angle = direction;
		}
		with (instance_create_layer(x,y,"Instances",o_spitter_projectile))
		{
			spd = 5;
			//set direction to player's position
			direction = 270; 
			image_angle = direction;
		}
	}
}