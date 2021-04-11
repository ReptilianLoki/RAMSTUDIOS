if (!grounded) 
{
	shader_set(red_flash);
	draw_sprite_ext(sprite,frame,x,y,xScale * facing,yScale,angle,color,alpha);
	shader_reset(); 
}
else
{
	draw_sprite_ext(sprite,frame,x,y,xScale * facing,yScale,angle,color,alpha);
}