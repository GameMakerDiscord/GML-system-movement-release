/// @description	Mouse Location

/// Pixel location
draw_rectangle(mouse_x, mouse_y, mouse_x, mouse_y, false);

/// Pixel coordinates
#region ARGUMENTS

var _mx = mouse_x + 2;
var _my = mouse_y - 4;
var _mm = string(string(mouse_x) + ", " + string(mouse_y));

#endregion

draw_text_transformed(_mx, _my, _mm, 0.25, 0.25, 0);