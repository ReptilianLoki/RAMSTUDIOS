if (can_collide) 
{
	enemy_hsp = 0
	can_collide = false; 
}
else if (!can_collide)
{
	hsp = hsp;
	can_collide = true; 
}