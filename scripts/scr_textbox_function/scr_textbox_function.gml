function scr_set_defaults_for_text() {
	
line_break_pos[0, page_number] = 999;
line_break_num[page_number] = 0;
line_break_offset[page_number] = 0;

//var for every letters/characters
for (var c = 0; c< 700; c++)
{
	col_1[c, page_number] = c_white
	col_2[c, page_number] = c_white
	col_3[c, page_number] = c_white
	col_4[c, page_number] = c_white
	
	wave_text[c, page_number] = 0;
	wave_dir[c, page_number] = c*40;
	
	shake_text[c, page_number] = 0;
	shake_dir[c, page_number] = irandom(360);
	shake_timer[c, page_number] = irandom(4);
	
}
txtb_spr[page_number] = spr_menu;
speaker_sprite[page_number] = noone;
speaker_side[page_number] = 1;
text_length[page_number] = string_length(text[0]);
snd[page_number] = snd_talking1;

}
	
//text vfx
///@param 1st_char
///@param last_char
///@param col1
///@param col2
///@param col3
///@param col4
	function scr_text__color(_start, _end, _col1, _col2, _col3,_col4){
	
	for (var c = _start; c<= _end; c++){
	col_1[c, page_number-1] = _col1;
	col_2[c, page_number-1] = _col2;
	col_3[c, page_number-1] = _col3;
	col_4[c, page_number-1] = _col4;
	

	}
	
	}
	
	///@param 1st_char
	///@param last_char
function scr_text_wave(_start, _end){
	
for (var c = _start; c<= _end; c++){
	
	wave_text [c, page_number -1] = true;

	}

	}
	///@param 1st_char
	///@param last_char
function scr_text_shake(_start, _end){
	
for (var c = _start; c<= _end; c++){
	
	shake_text [c, page_number -1] = true;

	}

	}

/// @param text
/// @param [character]
/// @param [side]
function scr_text(_text){

scr_set_defaults_for_text()

text[page_number] = _text; 
//get character info
	if argument_count > 1 {
	switch(argument[1])
	{
		//key
		case "key-keyless":
			speaker_sprite[page_number] = spr_Keyless_Talk;
			txtb_spr[page_number] = spr_menu;
			snd[page_number] = snd_talking1;
		break;
		case "key-key":
			speaker_sprite[page_number] = spr_Key_Talks;
			txtb_spr[page_number] = spr_menu;
			snd[page_number] = snd_talking1;
		break;
		//witch
		case "Scheik-neutral":
			speaker_sprite[page_number] = spr_scheik_neutral;
			txtb_spr[page_number] = spr_menu;
			snd[page_number] = snd_talking1;
			break;
			case "Scheik-happy":
			speaker_sprite[page_number] = spr_scheik_happy;
			txtb_spr[page_number] = spr_menu;
			snd[page_number] = snd_talking1;
			break;
			case "Scheik-angry":
			speaker_sprite[page_number] = spr_scheik_angry;
			txtb_spr[page_number] = spr_menu;
			snd[page_number] = snd_talking1;
			break;
	}
	}
//side character is on
if argument_count > 2 {
	speaker_side[page_number] = argument[2];
}
page_number++;

}
/// @param option
/// @param link_id
function scr_option(_option, _link_id)	{
	
	option[option_number] = _option;
	option_link_id[option_number] = _link_id;
	
	option_number++;
}





/// @param text_id
function create_textbox(_text_id) {
	
	with(instance_create_depth(0,0,-9999, obj_textbox))
			{
				scr_game_script(_text_id);
			}
	
	
}