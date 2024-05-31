var _s = id;

//interact with text needs to be changed to be based on player location not mouse
if place_meeting(x,y,obj_player) && keyboard_check_pressed(ord("E")) && !instance_exists(obj_textbox)

{
	create_textbox(text_id);



}

if instance_exists(obj_textbox) &&  instance_exists(obj_witch)
{
	alarm[0] =3;
}

if instance_exists(obj_textbox) &&  instance_exists(obj_me)
{
	alarm[1] =3;
}