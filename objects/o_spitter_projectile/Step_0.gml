//bullets move
x += lengthdir_x(spd,direction);
y += lengthdir_y(spd,direction);

//update floor coordinates
grounded = (in_floor(tilemap,x,y) >= 0);

//if bullet hits floor, destroy
if (grounded) instance_destroy(); 