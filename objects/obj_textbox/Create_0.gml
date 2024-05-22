depth = -9999
//textbox parameters
textbox_width = 507;
textbox_height = 154;
border = 8;
line_sep =35;
line_width = textbox_width - border*2;
txtb_spr[0] = spr_menu;
textb_img = 0;
//textbox animation speed
textb_img_spd = 0;
//portrait peramiters
portrait_width = 220;
portrait_height = 220;
//text
page = 0;
page_number = 0;

text[0] ="";
text_length[0] = string_length(text[0]);

char[0, 0] = "";
char_hor[0, 0] = 0;
char_vert[0, 0] = 0;

draw_char = 0;
text_spd = 1;
//options
option[0] = "";
option_link_id[0] = -1;
option_pos = 0;
option_number = 0;

setup = false;

//effects
scr_set_defaults_for_text();
last_free_space = 0;








