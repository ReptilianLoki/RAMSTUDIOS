/// @desc Pause the Game
global.game_paused = !global.game_paused;
	
if (global.game_paused)
{
	with (all)
	{
		gamePausedImageSpeed = image_speed;
		image_speed = 0;
	}		
}
else
{
	with (all)
	{
		image_speed = gamePausedImageSpeed;	
	}
}
