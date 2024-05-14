// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_fontsize_2(){
/// draw_set_size(size) // real
var font = asset_get_index(global.current_font+string(argument0));
if font_exists(font){
  draw_set_font(font);
  return true;
}
}