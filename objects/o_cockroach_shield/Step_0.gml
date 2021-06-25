/// @desc Timer + Switch Direction

//inherit parent variables
event_inherited();

//enemy walk timer
enemy_walk_timer -= 1;

//shield timer 
shield_timer -= 1;

//check shield timer
if (shield_timer <= 120)
{
	//set shield timer
	//shield_timer = random_range(180,300);
	shielded = true
	enemy_walk_timer += 1;
	enemy_hsp = 0;
	if(shield_timer <= 0)
	{
		shield_timer = random_range(180,300);
	}
}
//change direction when timer hits 0 
else if (enemy_walk_timer <= 0)
{
	enemy_hsp = -enemy_hsp; 
	enemy_walk_timer = ENEMY_WALK_TIMER;
}
else 
{
	if(enemy_hsp == 0)
	{
		enemy_hsp = 1;
	}
	shielded = false;
}



