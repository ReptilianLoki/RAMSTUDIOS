/// @desc Moving Camera 

//update destination
if instance_exists(follow_object)
{

	if (o_player.hsp > 0) 
	{
		//follow the player x
		xTo = follow_object.x + 75; 
		//update camera to player x position with rate
		x += (xTo - x) / 18; 
		//if we're decling, adjust y position to decline 
		if (o_player.decline_check) 
		{
			yTo = follow_object.y + 25;
			y += (yTo - y) / 22;
		}
		//if we're not declining, update y position without adjustments
		else
		{
			yTo = follow_object.y;
			y += (yTo - y) / 18;
		}
	}
	else if (o_player.hsp < 0)
	{
		//follow the player x
		xTo = follow_object.x - 75; 
		//update camera to player x position with rate
		x += (xTo - x) / 18; 
		//if we're inclining, adjust y position for incline
		if (o_player.incline_check) 
		{
			yTo = follow_object.y - 25;
			y += (yTo - y) / 22;
		}
		//if we're not inclining, update y position without adjustments
		else
		{
			yTo = follow_object.y;
			y += (yTo - y) / 18; 
		}
	}
	//update the camera to our position when we stop moving
	else if (o_player.hsp == 0)
	{
		x += (xTo - x) / 18; 
		y += (yTo - y) / 18;
	}
}

//keeps camera center in the room
x = clamp(x,view_width_half+buff,room_width-view_width_half-buff);
y = clamp(y,view_height_half+buff,room_height-view_height_half-buff);

//Screen shake 
x += random_range(-shake_remain,+shake_remain); 
y += random_range(-shake_remain,+shake_remain); 
shake_remain = max(0,shake_remain - ((1/shake_length)*shake_magnitude));  

//Update camera view
camera_set_view_pos(cam, x - view_width_half, y - view_height_half); 

