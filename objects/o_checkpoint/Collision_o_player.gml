if(is_enabled)
{
	is_enabled = false;
	global.checkpoint_check++;
	global.checkpoint[0] = x;
	global.checkpoint[1] = y;
}