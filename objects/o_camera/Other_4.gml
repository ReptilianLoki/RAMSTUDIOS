/// @desc Update to Player's New Position
x = o_player.x;
y = o_player.y;
cam = view_camera[0];
follow_object = o_player; 
view_width_half = camera_get_view_width(cam) * 0.5; 
view_height_half = camera_get_view_height(cam) * 0.55;
xTo = o_player.x;
yTo = o_player.y;

shake_length = 0; 
shake_magnitude = 0; 
shake_remain = 0;
buff = 32;