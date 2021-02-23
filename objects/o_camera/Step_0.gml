/// @desc Moving Camera 

//update destination
if instance_exists(follow_object)
{
	xTo = follow_object.x; 
	yTo = follow_object.y; 
}

//update object position
x += (xTo - x) / 15; 
y += (yTo - y) / 15

//keeps camera center in the room
x = clamp(x,view_width_half+buff,room_width-view_width_half-buff);
y = clamp(y,view_height_half+buff,room_height-view_height_half-buff);

//Screen shake 
x += random_range(-shake_remain,+shake_remain); 
y += random_range(-shake_remain,+shake_remain); 
shake_remain = max(0,shake_remain - ((1/shake_length)*shake_magnitude));  

//Update camera view
camera_set_view_pos(cam, x - view_width_half, y - view_height_half); 