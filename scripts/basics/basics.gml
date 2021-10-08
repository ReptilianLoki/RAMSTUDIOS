function movement()
{	
	sprite_angle();
	
	//can_jump timer
	can_jump--;

	//Calculate Movement
	move = (right - left) //* SPD_WALK
	
	//do friction logic
	current_friction = FRICTION
	
	if (is_sliding) or (is_boosting)
	{
		current_friction = SLIDE_FRICTION
		if (decline_check)
		{
			current_friction = DECLINE_SLIDE_FRICTION
			if (hsp > 0)
			{
				hsp = hsp + DECLINE_MOMENTUM
			}
			else if (hsp < 0) 
			{	
				hsp = hsp - DECLINE_MOMENTUM
			}
		} 
		if (incline_check) 
		{
			current_friction = INCLINE_SLIDE_FRICTION
			hsp = hsp - INCLINE_MOMENTUM 
			if (hsp > 0)
			{
				hsp = hsp - INCLINE_MOMENTUM
			}
			else if (hsp < 0) 
			{	
				hsp = hsp + INCLINE_MOMENTUM
			}
		}
	}
	else if (!is_sliding) or (!is_boosting)
	{
		current_friction = FRICTION 
	}
	
	//cap slide speed
	//if (hsp >= MAX_SLIDE)
	//{
	//	hsp = MAX_SLIDE;
	//}
	//else if (hsp <= -MAX_SLIDE)
	//{
	//	hsp = -MAX_SLIDE;
	//}
	
	//hsp = move;
	if (right or left) and (!is_sliding)
	{
		hsp += SPD_WALK * move;
		
		if (hsp >= MAX_WALK)
		{
			hsp = MAX_WALK;

		}
		else if (hsp <= -MAX_WALK)
		{
			hsp = -MAX_WALK;
		}
	}
	else
	{
		//slide friction applied here
		hsp -= min(abs(hsp),current_friction) * sign(hsp);
	}

	//check if we are sliding but just released the slide key.
	if (is_sliding and !slide)
	{
		is_sliding = false;
	}

	//check if we are boosting but just released the boost key.
	if (is_boosting and !boost_key_check)
	{
		is_boosting = false; 

	}
	
	//jump
	if (jump) and (can_jump > 0)
	{
		if (is_boosting)
		{
			//can't get boost jump unless near max slide speed
			if (abs(hsp) > (MAX_SLIDE - boost_jump_buffer))
			{
				vsp = -BOOST_JUMP;
				is_jumping = true;
				can_jump = 0; 
			}
			else
			{
				vsp = -SPD_JUMP;
				is_jumping = true; 
				can_jump = 0; 
			}
		}
		else
		{
			vsp = -SPD_JUMP;
			is_jumping = true; 
			can_jump = 0; 
		}
		if (grounded) dust(); 
		grounded = false;
		can_squish = true; 
		squash_and_stretch(0.8,0.15,1.3,0.15);
	}
	else if (grounded)
	{
		can_squish = false;
		is_jumping = false; 
	}

	//apply gravity
	vsp += SPD_GRAVITY;

	
}
function collision()
{
	//Temp Vars
	var p1,p2,bbox_side;

	//Re apply fractions
	hsp += hsp_fraction;
	vsp += vsp_fraction;
	
	//Store and Remove fractions
	//Important: go into collision with whole integers ONLY!
	hsp_fraction = hsp - (floor(abs(hsp)) * sign(hsp));
	hsp -= hsp_fraction;
	vsp_fraction = vsp - (floor(abs(vsp)) * sign(vsp));
	vsp -= vsp_fraction;
	
	
	//Horizontal Collision
	if (hsp > 0) bbox_side = bbox_right; else bbox_side = bbox_left;
	p1 = tilemap_get_at_pixel(tilemap,bbox_side+hsp,bbox_top);
	p2 = tilemap_get_at_pixel(tilemap,bbox_side+hsp,bbox_bottom);
	if (tilemap_get_at_pixel(tilemap,x,bbox_bottom) > 1) p2 = 0;
	if (p1 == 1) || (p2 == 1) //Inside a tile with collision
	{
		if (hsp > 0) x = x - (x mod TILE_SIZE) + (TILE_SIZE-1) - (bbox_right - x);
		else x = x - (x mod TILE_SIZE) - (bbox_left - x);
		hsp = 0;
	}
	x += hsp;
	
	//Vertical Collision
	//is this not a slope?
	if (vsp >= 0) bbox_side = bbox_bottom; else bbox_side = bbox_top;
	p1 = tilemap_get_at_pixel(tilemap,bbox_left,bbox_side+vsp) 
	p2 = tilemap_get_at_pixel(tilemap,bbox_right,bbox_side+vsp)
	if (p1 == 1) || (p2 == 1)
	{
		if (vsp >= 0) y = y - (y mod TILE_SIZE) + (TILE_SIZE-1) - (bbox_bottom - y);
		else y = y - (y mod TILE_SIZE) - (bbox_top - y);
		if (grounded)
		{
			vsp = 0;
		}
	}
	
	var floordist = in_floor(tilemap,x,bbox_bottom+vsp);
	if (floordist >= 0)
	{
		y += vsp;
		y -= (floordist + 1);
		vsp = 0; 
		floordist = -1;
	}
	y += vsp;
	
	//Walk down slopes
	if (grounded)
	{
		y += abs(floordist)-1;
		//if at base of current tile
		if ((bbox_bottom mod TILE_SIZE) == TILE_SIZE-1)
		{
			// if slope continues
			if (tilemap_get_at_pixel(tilemap,x,bbox_bottom+1) > 1)
			{
				//move there
				y += abs(in_floor(tilemap,x,bbox_bottom+1));
			}
		}
		check_inclinedecline(y);
		//incline/decline walk friction "slowdown" 
		if (incline_check) and (!o_player.is_sliding) hsp *= INCLINE_WALK_SLOWDOWN;
		if (decline_check) and (!o_player.is_sliding) hsp *= DECLINE_WALK_SLOWDOWN; 
		can_jump = COYOTE_TIME;
	} 

}
function enemy_collision()
{
	//Temp Vars
	var p1,p2,bbox_side;

	//Re apply fractions
	enemy_hsp += enemy_hsp_fraction;
	enemy_vsp += enemy_vsp_fraction;
	
	//Store and Remove fractions
	//Important: go into collision with whole integers ONLY!
	enemy_hsp_fraction = enemy_hsp - (floor(abs(enemy_hsp)) * sign(enemy_hsp));
	enemy_hsp -= enemy_hsp_fraction;
	enemy_vsp_fraction = enemy_vsp - (floor(abs(enemy_vsp)) * sign(enemy_vsp));
	enemy_vsp -= enemy_vsp_fraction;
	
	
	//Horizontal Collision
	if (enemy_hsp > 0) bbox_side = bbox_right; else bbox_side = bbox_left;
	p1 = tilemap_get_at_pixel(tilemap,bbox_side+enemy_hsp,bbox_top);
	p2 = tilemap_get_at_pixel(tilemap,bbox_side+enemy_hsp,bbox_bottom);
	if (tilemap_get_at_pixel(tilemap,x,bbox_bottom) > 1) p2 = 0;
	if (p1 == 1) || (p2 == 1) //Inside a tile with collision
	{
		if (enemy_hsp > 0) x = x - (x mod TILE_SIZE) + (TILE_SIZE-1) - (bbox_right - x);
		else x = x - (x mod TILE_SIZE) - (bbox_left - x);
		enemy_hsp = 0;
	}
	x += enemy_hsp;
	
	//Vertical Collision
	//is this not a slope?
	if (enemy_vsp >= 0) bbox_side = bbox_bottom; else bbox_side = bbox_top;
	p1 = tilemap_get_at_pixel(tilemap,bbox_left,bbox_side+enemy_vsp) 
	p2 = tilemap_get_at_pixel(tilemap,bbox_right,bbox_side+enemy_vsp)
	if (p1 == 1) || (p2 == 1)
	{
		if (enemy_vsp >= 0) y = y - (y mod TILE_SIZE) + (TILE_SIZE-1) - (bbox_bottom - y);
		else y = y - (y mod TILE_SIZE) - (bbox_top - y);
		if (grounded)
		{
			enemy_vsp = 0;
		}
	}
	
	var floordist = in_floor(tilemap,x,bbox_bottom+enemy_vsp);
	if (floordist >= 0)
	{
		y += enemy_vsp;
		y -= (floordist + 1);
		enemy_vsp = 0; 
		floordist = -1;
	}
	y += enemy_vsp;
	
	//Walk down slopes
	if (grounded)
	{
		if (!spider_jumping) y += abs(floordist)-1; 
		//if at base of current tile
		if ((bbox_bottom mod TILE_SIZE) == TILE_SIZE-1)
		{
			// if slope continues
			if (tilemap_get_at_pixel(tilemap,x,bbox_bottom+1) > 1)
			{
				//move there
				y += abs(in_floor(tilemap,x,bbox_bottom+1));
			}
		}
		check_inclinedecline(y);
	} 

}

function animation_initialize()
{
	//initialize variables for drawing, and animation
	//used as script so we can apply to any object
	
	//draw
	sprite = sprite_index;
	frame = 0;
	// xPos = x;
	// yPos = y;
	xScale = 1;
	yScale = 1;
	angle = 0;
	color = c_white;
	alpha = 1;

	//animation
	// frameSpeed = 1;
	facing = 1;

}

function sprite_angle()
{
	//no squish if !can_squish
	if (!can_squish)
	{
		xScale = 1;
		yScale = 1;
	}	
	
	//changes angle of sprite on decling slopes
	if (sprite != s_player)
	{
		var pos = tilemap_get_at_pixel(tilemap,x,y);
		if (decline_check) 
		{
	
			if (hsp <= 0)
			{
				angle = 45;
			}
			if (hsp >= 0) 
			{
				angle = -45;
			}
		}
		else if (incline_check) 
		{
			if (hsp <= 0)
			{
				angle = -45;
			}
			if (hsp >= 0) 
			{
				angle = 45;
			}
		}
		else if (pos == 2) or (pos == 3)
		{
			angle = angle; 
		}
		else
		{
			angle = 0;
		}
	}
	else
	{
		angle = 0; 
	}
	

}

function in_floor(tilemap_id,x_pos,y_pos)
{
	var pos = tilemap_get_at_pixel(tilemap_id,x_pos,y_pos);
	if (pos > 0)
	{
		if (pos == 1) return (y_pos mod TILE_SIZE); //solid block, would end up returning true anyway but this is FASTER, GOTTAGOFAST.
		var thefloor = global.heights[(x_pos mod TILE_SIZE) + pos*TILE_SIZE];
		return ((y_pos mod TILE_SIZE) - thefloor);
	} else return -(TILE_SIZE - (y_pos mod TILE_SIZE))
}

function check_inclinedecline(y_pos)
{
	// Incline Check
	if (y_pos < prev_y)
	{
		incline_check = true;
	}
	else
	{
		incline_check = false;	
	}

	// Decline Check
	if (y_pos > prev_y)
	{
		decline_check = true;
	}
	else
	{
		decline_check = false;
	}
	
}

function approach(start,ending,shift)
{
	//approach(start, end, shift);
	//allows you to increase a value by another value, until it reaches a maximum value.
	
	if(start < ending)
	{
	  return min(start + shift, ending); 
	}
	else
	{
	    return max(start - shift, ending);
	}
}

function player_death_settings()
{
		death_timer = DEATH_TIMER; 
		flash = DEATH_SHADER_TIMER;  
		hsp = 0; 
		vsp = 0; 
		global.player_health--; 
		global.coin_count = 0; 
		screen_shake(2,40);
}

function enemy_friction()
{
	check_inclinedecline(y);
	
	current_friction = ENEMY_FRICTION
	
	if (decline_check)
	{
		current_friction = DECLINE_ENEMY_FRICTION
	}
	else
	{
		current_friction = ENEMY_FRICTION
	}
	
	if (incline_check)
	{
		current_friction = INCLINE_ENEMY_FRICTION
	}
	else
	{
		current_friction = ENEMY_FRICTION
	}
	
	//apply friction
	enemy_hsp -= min(abs(enemy_hsp),current_friction) * sign(enemy_hsp);
	
}