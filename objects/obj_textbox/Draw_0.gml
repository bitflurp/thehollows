// becasue the createing the textbox and the accept are both e it keeps creating thr text box
key_accept = keyboard_check_pressed(ord("Q"));

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
			text_hor_offset[p] = 600
			portrait_hor_offset[p] = 25
			//character on right
			if speaker_side == -1
			{
				text_hor_offset[p] = 25;
				portrait_hor_offset = 316;
			
			}
			//no character
			if speaker_sprite[p] == noone{
				text_hor_offset[p] =300;
			
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
if draw_char < text_length[page]
	{
		draw_char += text_spd;
		draw_char =clamp(draw_char,0,text_length[page]);
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
 draw_text(char_hor[c, page], char_vert[c, page], char[c, page]);

}




