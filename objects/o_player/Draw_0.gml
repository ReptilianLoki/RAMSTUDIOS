//if we can_boost or the coin coint is over 3, glow like a rainbow!
if (can_boost) or (global.coin_count >= 3 and (state == player.idle or state == player.moving))
{
	//set shader
	shader_set(rainbow_shader);
		var uv = sprite_get_uvs(sprite_index, image_index);
		shader_set_uniform_f(_uniUV, uv[0], uv[2]);
		shader_set_uniform_f(_uniSpeed, _speed);
		shader_set_uniform_f(_uniTime, _time);
		shader_set_uniform_f(_uniSaturation, _saturation);
		shader_set_uniform_f(_uniBrightness, _brightness);
		shader_set_uniform_f(_uniSection, _section);
		shader_set_uniform_f(_uniMix, _mix);
	//draw sprite
	draw_sprite_ext(sprite,frame,x,y,xScale * facing,yScale,angle,color,alpha)
	//reset shader
	shader_reset(); 
}
else
{
	draw_sprite_ext(sprite,frame,x,y,xScale * facing,yScale,angle,color,alpha)
}






