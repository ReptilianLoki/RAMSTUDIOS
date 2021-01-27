function screen_shake()
{
	/// @desc ScreenShake (magnitude,frames)
	/// @arg Magnitude sets the strength of the shake (radius in pixels)
	/// @arg Frames sets the length of the shake in frames (60 = 1 second at 60fps)
	
	with (o_camera)
	{
		if (argument0 > shake_remain)
		{
		shake_magnitude = argument0;
		shake_remain = argument0;
		shake_length = argument1;
		}
	}
}
function transition()
{
	/// @desc SlideTransition(mode, targetroom)
	/// @arg Mode sets transition mode between next, restart, and goto.
	/// @arg Target sets target room when using the goto mode.
	
	with (o_transition)
	{
		mode = argument[0];
		if(argument_count > 1) target = argument[1];
	}
		
		
}