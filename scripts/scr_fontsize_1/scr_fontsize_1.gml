// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_fontsize_1(){
/// draw_set_font_ext(font,size) // string,real
global.current_font = "fn_"+argument[0];
if argument_count==2 draw_set_size(argument[1]);
}