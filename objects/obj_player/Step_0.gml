
///Movement
Key_Left = keyboard_check_direct(ord("A")) || keyboard_check_direct(vk_left);
Key_Right = keyboard_check_direct(ord("D"))|| keyboard_check_direct(vk_right);
Key_Up = keyboard_check_direct(ord("W"))|| keyboard_check_direct(vk_up);
Key_Down = keyboard_check_direct(ord("S"))|| keyboard_check_direct(vk_down);
Key_Sprint = keyboard_check_direct(vk_lshift);


key_hor = ( Key_Right - Key_Left) * playerSpeed;
key_vert = ( Key_Down - Key_Up) *playerSpeed;


//pause
if instance_exists(obj_pauser)
{
 key_hor = 0;
 key_vert = 0;
}

 //SET SPRITE
 
 mask_index = sprite[DOWN];
 if key_vert == 0
 {
 if key_hor > 0 {face = RIGHT}
 if key_hor < 0 {face = LEFT}
 }
 
 if key_hor > 0 && face = RIGHT{sprite_index = spr_KeyWalkR };
 if key_hor < 0 && face = LEFT{sprite_index = spr_KeyWalkL};
 if key_vert > 0 && face = RIGHT{sprite_index =spr_KeyWalkR};
 if key_vert < 0 && face = RIGHT{sprite_index =spr_KeyWalkR};
 if key_vert > 0 && face = LEFT{sprite_index = spr_KeyWalkL};
 if key_vert > 0 && face = RIGHT{sprite_index =spr_KeyWalkR};
 if key_vert > 0 && face = LEFT{sprite_index = spr_KeyWalkL};
 if key_vert < 0 && face = RIGHT{sprite_index=spr_KeyWalkR};
 if key_vert < 0 && face = LEFT{sprite_index=spr_KeyWalkL};
 
 if key_hor == 0 && key_vert == 0 {sprite_index = spr_key_idle};
 
//Collisions and Movement
//x
if place_meeting(x + key_hor , y, obj_wall) ==true
	{
		while !place_meeting(x+sign(key_hor),y,obj_wall)
		{
			x+=sign(key_hor)
		}

		key_hor = 0;
	}
//y
if place_meeting(x, y+  key_vert, obj_wall)==true  
	{
		while !place_meeting(x,y+sign(key_vert),obj_wall)
		{
			y+=sign(key_vert)
		}

		key_vert = 0;
	}


x += key_hor;
y += key_vert;


if (Key_Sprint){
    sprinting = true;
    playerSpeed = 9;
	
}
else{
    sprinting = false;
    playerSpeed = 7;
}
 
 // animations //

if key_vert == 0 && key_hor == 0
	{
	image_index = 0;
	}

//depth
depth= -bbox_bottom;