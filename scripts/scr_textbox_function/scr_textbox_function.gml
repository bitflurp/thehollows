function scr_set_defaults_for_text() {
	
line_break_pos[0, page_number] = 999;
line_break_num[page_number] = 0;
line_break_offset[page_number] = 0;


txtb_spr[page_number] = spr_menu;
speaker_sprite[page_number] = noone;
speaker_side[page_number] = 1;
text_length[page_number] = string_length(text[0]);

}
/// @param text
///@param [character]
function scr_text(_text){

scr_set_defaults_for_text()

text[page_number] = _text; 
//get character info
	if argument_count > 1 {
	switch(argument[1])
	{
		case "key-keyless":
			speaker_sprite[page_number] = spr_Keyless_Talk;
			txtb_spr[page_number] = spr_menu;
		break;
	}
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