// becasue the createing the textbox and the accept are both e it keeps creating thr text box
key_accept = keyboard_check_pressed(ord("E"));

textbox_hor = camera_get_view_x(view_camera[0]);
textbox_vert = camera_get_view_y(view_camera[0])+650;

//setup
if setup == false
	{
	
	setup = true;
	draw_set_font(global.font_main);
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	
	//loop through the pages
	
	for(var p = 0; p < page_number; p++)
		{
			//find how many charaters are on each page and store that number in the "text_lenght" array
			text_length[p] = string_length(text[p]);
			//get the x position for the textbox
			
			//character on the left
			text_hor_offset[p] = 320;
			portrait_hor_offset[p] = 38;
			portrait_vert_offset[p] =-127;
			//character on right
			if speaker_side[p] == -1
			{
				text_hor_offset[p] = 320;
				portrait_hor_offset[p] = 827;
				portrait_vert_offset[p] =-127;
			}
			//cutscene config
			if speaker_side[p] == 2
			{
			text_hor_offset[p] = 320;
			portrait_hor_offset[p] = 0;
			portrait_vert_offset[p] = -700;
			}
			//no character
			if speaker_sprite[p] == noone {
				text_hor_offset[p] =320;	
			}
			
			
			//setting the indevedual numbers and where lines should break
			
			for (var c = 0; c < text_length[p]; c++)
			{
				var _char_pos = c+1;
			
			//store indevidual characters in the char array
			char[c, p] = string_char_at(text[p], _char_pos)
			
			//get current width of the line
			var _txt_up_to_char = string_copy (text[p], 1, _char_pos);
			var _current_txt_w = string_width(_txt_up_to_char)- string_width( char[c, p]);
			
			//get the last free space
			if char[c, p] == " " { last_free_space = _char_pos+1};
			
			//get line break
			if _current_txt_w - line_break_offset[p] > line_width
			{
				line_break_pos[ line_break_num[p] , p] = last_free_space;
				line_break_num[p]++;
				var _txt_up_to_last_space = string_copy( text[p], 1, last_free_space);
				var _last_free_space_string = string_char_at(text[p], last_free_space);
				line_break_offset[p] = string_width(_txt_up_to_last_space) - string_width( _last_free_space_string);
			}
			
			}
			
			// getting each characters coordinates
			for (var c = 0;  c < text_length[p]; c++)
				{
					
					var _char_pos = c+1;
					var _txt_hor = textbox_hor + text_hor_offset[p] + border;
					var _txt_vert = textbox_vert + border;
						//get current width of the line
					var _txt_up_to_char = string_copy (text[p], 1, _char_pos);
					var _current_txt_w = string_width(_txt_up_to_char)- string_width( char[c, p]);
					var _txt_line = 0;
					
					//compinsate for string breaks 
					for (var lb = 0 ; lb < line_break_num[p]; lb++)
					{
						// if current looping character is after linebreak
						if _char_pos >= line_break_pos[lb, p]
						{
							var _scr_copy = string_copy( text[p], line_break_pos[lb, p], _char_pos-line_break_pos[lb, p] );
							_current_txt_w = string_width(_scr_copy);
							
							//record the line this character should be on
							_txt_line = lb+1;// +1 since lb start at 0
						}
					}
					
					//add to x and y position coords
					char_hor[c, p] = _txt_hor + _current_txt_w;
					char_vert[c, p] = _txt_vert + _txt_line*line_sep;
					
				}
			
			
			
		}
	
	
	}

//typing the text
if text_pause_timer <= 0 {
if draw_char < text_length[page]
	{
		draw_char += text_spd;
		draw_char =clamp(draw_char,0,text_length[page]);
		var _check_char = string_char_at( text[page], draw_char);
		if _check_char == "." ||  _check_char == "?" ||  _check_char == "!" ||  _check_char == ","
		{
			text_pause_timer = text_pause_time;
			if !audio_is_playing(snd[page]){
			 audio_play_sound(snd[page], 8,false);
			}
		}
		
		else{
			//typring sound
			if snd_count < snd_delay { snd_count++;}
			else{snd_count = 0; audio_play_sound(snd[page], 8,false);}
		}
		
	}
} else{
		text_pause_timer --;
}
	
//flip through pages
if key_accept
	{
	
	//if the typing is done
	if draw_char == text_length[page]{
		
			//next page
			if page< page_number-1{
				page++;
				draw_char = 0;
			}
				//destroy textbox
				else{
				//link dialog
				if option_number > 0{
				create_textbox(option_link_id[option_pos]);
				}
				
				instance_destroy();
			
				}
				
		}
	//if not done typing
	else{
		
	draw_char = text_length[page];
	
	}
	
	}
	

	//draw the textbox
	var _txtb_hor =  textbox_hor + text_hor_offset[page];
	var _txtb_vert = textbox_vert;
	textb_img += textb_img_spd;
	txtb_spr_w = sprite_get_width(txtb_spr[page]);
	txtb_spr_h = sprite_get_height(txtb_spr[page]);
	//draw speaker
	if speaker_sprite[page] != noone
	{
		sprite_index = speaker_sprite[page];
		if draw_char == text_length[page]{image_index = 0}
		var _speaker_hor = textbox_hor + portrait_hor_offset[page];
		var _speaker_vert = textbox_vert + portrait_vert_offset[page];
		if speaker_side[page] == -1 {_speaker_hor += sprite_width};
		
	//draw the speaker
		
		draw_sprite_ext(sprite_index, image_index, _speaker_hor, _speaker_vert, speaker_side[page], 1, 0, c_white,1);
	}
	//back of the textbox
	
	draw_sprite_ext(txtb_spr[page], textb_img, _txtb_hor, _txtb_vert, textbox_width/txtb_spr_w, textbox_height/txtb_spr_h, 0, c_white,1);
	
		//options; _op_space = the virtical distance between the options; _op_board = border around the text  
	
	
	
	if draw_char == text_length[page] && page == page_number -1 {
	//option select
	option_pos += keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up);
	option_pos = clamp(option_pos, 0, option_number -1);
	//draw options	
		var _op_space = 50;
		var _op_board = 25;
		for (var op = 0; op < option_number; op++){
			

		//option box _o_w is option width
		var _o_w = string_width(option[op]) + _op_board*2;
		draw_sprite_ext(txtb_spr[page], textb_img, _txtb_hor + 80, _txtb_vert - _op_space*option_number + _op_space*op, _o_w/txtb_spr_w, (_op_space -1)/txtb_spr_h, 0, c_white, 1)
		
		//arrow broken for some reason
	if option_pos == op {
		draw_sprite(spr_arrow,0,_txtb_hor, _txtb_vert - _op_space*option_number + _op_space*op)
		}	
				
			
		//option text
		draw_text(_txtb_hor + 80 + _op_board, _txtb_vert - _op_space*option_number + _op_space*op +2, option[op]);
		
		
		
		
		
		}
	
	}
	
	
	
	
	//draw the text
for (var c = 0; c < draw_char; c++)
{
	//special stuff
	//wavy text
	var _wave_y = 0;
	if wave_text[c, page] == true
		{
			//beteen 4-8 is a good speed
			wave_dir[c,page] += -10;
			_wave_y = dsin (wave_dir[c,page])*3;
		}
	//shake text
		var _shake_x = 0;
		var _shake_y = 0;
		if shake_text[c, page] == true
		{
			shake_timer[c,page] --;
			if shake_timer[c,page] <= 0 {
				shake_timer[c,page] = irandom_range(4, 8);
				shake_dir[c,page] = irandom(360);
			}
			_shake_x =lengthdir_x(3, shake_dir[c,page]);
			_shake_y =lengthdir_y(3, shake_dir[c,page]);
		}
 draw_text_color(char_hor[c, page] + _shake_x, char_vert[c, page] + _wave_y + _shake_y, char[c, page], col_1[c,page], col_1[c,page], col_1[c,page], col_1[c,page], 1);

}




