/// @desc GLOBAL SETUPS
global.camera = instance_create_layer(0,0,"Instances",o_camera); 
global.instance_ui = instance_create_layer(0,0,"Instances",o_ui); 
global.transition = instance_create_layer(0,0,"Instances",o_transition); 
//global.checkpoint_pos = [o_player.x,o_player.y];
global.game_paused = false;
