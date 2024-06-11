

// variables
if instance_exists(obj_block_vault)
{
var target_obj = instance_nearest(x, y, obj_block_vault);
}
else if instance_exists(obj_player) and !instance_exists(obj_block_vault)
{
	var target_obj = instance_nearest(x, y, obj_player);
}
if instance_exists(obj_player)
{
var dist = distance_to_object(target_obj); 



//loop naar makker toe
var dir = point_direction(x, y, target_obj.x, target_obj.y); 
image_angle = dir-90;

var aspeed = 0.3 ;

var spd_x = lengthdir_x(aspeed, dir); 
var spd_y = lengthdir_y(aspeed, dir); 

aspeed = point_distance(x, y, target_obj.x, target_obj.y) / dist * aspeed;

if place_meeting(x + spd_x, y, obj_collission) || place_meeting(x + spd_x, y, obj_collission_wall)
{
    while (!place_meeting(x + sign(spd_x), y, obj_collission)) && !place_meeting(x + sign(spd_x), y, obj_collission_wall)
    {
        x += sign(spd_x);
    }
    spd_x = 0;
}
if place_meeting(x, y + spd_y, obj_collission) || place_meeting(x, y + spd_y, obj_collission_wall)
{
    while (!place_meeting(x, y + sign(spd_y), obj_collission) && !place_meeting(x, y + sign(spd_y), obj_collission_wall))
    {
        y += sign(spd_y);
    }
    spd_y = 0;    
}

vaultdamagetimer--;
damageTimer -= 1;
if place_meeting(x, y, obj_player) && damageTimer <= 0
{
	obj_player.hitPoints -= 20;
	damageTimer = 30;
}
if place_meeting(x, y, obj_block_wall) && damageTimer <= 0
{
	instance_place(x,y, obj_block_wall).hitPoints -= 20;
	damageTimer = 30;
}

if hitPoints <= 0
{
  instance_destroy();
}

if place_meeting(x, y, obj_block_vault) && vaultdamagetimer <= 0
{
	obj_block_vault.hitPoints -= 20
	vaultdamagetimer = 30
}


//beweging
x += spd_x * movesp;
y += spd_y * movesp;
}
