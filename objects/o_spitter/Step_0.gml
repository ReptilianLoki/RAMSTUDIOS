var distance = distance_to_object(o_player);

firing_delay = firing_delay - 1; 

if (distance < sight_threshold)
{
	with (instance_create_layer(x,y,"Instances",o_spitter_projectile))
	{
		firing_delay = 40; 
		spd = 10;
		direction = other.image_angle; // + random_range(-2,2);
		image_angle = direction;
	}
}