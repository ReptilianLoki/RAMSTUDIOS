/// @desc GLOBAL SETUPS
global.camera = instance_create_layer(0,0,"Instances",o_camera); 
global.instance_ui = instance_create_layer(0,0,"Instances",o_ui); 
global.transition = instance_create_layer(0,0,"Instances",o_transition); 
global.game_paused = false;
global.checkpoint_pos [2] = 0;
global.checkpoint_pos [0] = o_player.x;
global.checkpoint_pos [1] = o_player.y;
