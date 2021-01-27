/// @desc Set Up Camera
cam = view_camera[0];
follow_object = o_player; 
view_width_half = camera_get_view_width(cam) * 0.5; 
view_height_half = camera_get_view_height(cam) * 0.5;
xTo = xstart;
yTo = ystart; 

shake_length = 0; 
shake_magnitude = 0; 
shake_remain = 0;
buff = 32;