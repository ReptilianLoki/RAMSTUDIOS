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
function dust()
{
	repeat(5)
	{
		with (instance_create_layer(x,bbox_bottom+2,"Instances",o_dust))
		{
			vsp = 0;
		}
	}
}
function slide_residue()
{
	with (instance_create_layer(x,bbox_bottom+2,"Instances",o_slide_dust))
	{
		vsp = 0;
	}
}
function rainbow_shader_setup()
{
	_uniUV         = shader_get_uniform(rainbow_shader, "u_uv");
	_uniTime       = shader_get_uniform(rainbow_shader, "u_time");
	_uniSpeed      = shader_get_uniform(rainbow_shader, "u_speed");
	_uniSection    = shader_get_uniform(rainbow_shader, "u_section");
	_uniSaturation = shader_get_uniform(rainbow_shader, "u_saturation"); 
	_uniBrightness = shader_get_uniform(rainbow_shader, "u_brightness");
	_uniMix        = shader_get_uniform(rainbow_shader, "u_mix");
	_time  = 0;		_speed = 5.0;
	_section = 0.35;
	_saturation = 1;
	_brightness = 1;
	_mix = 0.65;
}
function screen_shake(magnitude,frames)
{
	/// @desc ScreenShake (magnitude,frames)
	/// @arg Magnitude sets the strength of the shake (radius in pixels)
	/// @arg Frames sets the length of the shake in frames (60 = 1 second at 60fps)
	
	with (o_camera)
	{
		if (magnitude > shake_remain)
		{
		shake_magnitude = magnitude;
		shake_remain = magnitude;
		shake_length = frames;
		}
	}
}
function squash_and_stretch(x_scale_new,x_scale_rate,y_scale_new,y_scale_rate)
{
	
	xScale = approach(xScale,x_scale_new,x_scale_rate)
	yScale = approach(yScale,y_scale_new,y_scale_rate)

}