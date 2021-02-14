function movement()
{
	//Calculate Movement
	move = (right - left) //* SPD_WALK
	//hsp = move;
	if (right or left) and (!is_sliding)
	{
		hsp += SPD_WALK * move;
		if (hsp >= MAX_WALK)
		{
			hsp = MAX_WALK
		}
		else if (hsp <= -MAX_WALK)
		{
			hsp = -MAX_WALK;
		}
	}
	else
	{
		hsp -= min(abs(hsp),current_friction) * sign(hsp);
	}
	
	vsp += SPD_GRAVITY

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
		vsp = 0;
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
		checkslide(); 
		check_inclinedecline(y);
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
function checkslide()
{
	if (abs(hsp) > (MAX_WALK - 1))
	{
		if(!is_sliding) and (!incline_check)
		{
			can_slide = true;
		}
		else
		{
			can_slide = false;
		}
	}
	
	if ((left and hsp > 0) or (right and hsp < 0))
	{
		can_slide = false;
	}
	
	//check if we are holding down the slide button
	if (can_slide and slide)
	{
		is_sliding = true;
		can_slide = false;
		hsp = MAX_WALK * 1.8 * sign(hsp);
		state = player.slide;
	}
	
	//check if we are sliding but just released the slide key
	if (is_sliding and !slide)
	{
		is_sliding = false;
	}
	
	//do animation and friction logic
	if (is_sliding)
	{
		current_friction = slide_friction;
	}
	else
	{
		current_friction = FRICTION;
		is_sliding = false;
	}
}
function check_inclinedecline(y_pos)
{
	
	if (y_pos < prev_y)
	{
		incline_check = true;
		
		if (is_sliding) //stops player from sliding up
		{
			hsp *= incline_friction;
		}
		else //player walks UP slowly 
		{
			hsp *= incline_walk_friction;
		}
	}
	else
	{
		incline_check = false;
		
		if (y_pos > prev_y) and (!is_sliding) //player walks DOWN slowly 
		{
			hsp *= decline_friction;
		}
	}
}
