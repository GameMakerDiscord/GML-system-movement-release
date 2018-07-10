///	@description	Information

/// Header
#region ARGUMENTS

var _xx = 0;
var _yy = 0;

_xx = (window_get_width() / 2) - 80;
_yy = 8;

#endregion
#region DRAW TEXT

draw_text(_xx, _yy,

@"FPS:             " + string(fps) + "\n" +
@"FPS REAL (av):   " + string(global.average_fps div 10 * 10) + "\n" +
@"FPS REAL:        " + string(fps_real) + "\n" +
@"SPAWN COUNT:     " + string(global.spawn_count) + "\n" +
@"'Z' toggle spawn " + "\n" +
@"'X' toggle debug " + "\n" +
@"'C' cycle size * "

);

#endregion

/// Footer
#region ARGUMENTS

_xx = 0;
_yy = (display_get_gui_height() - 24);

#endregion
#region DRAW TEXT

draw_text(_xx, _yy,

"NOTE: Cycling size may result in object getting stuck in wall. This command is only provided to demonstrate that the object size does not matter in the tileset collisions."

);

#endregion

/// Movement
#region MOVEMENT DEBUG

#region CONDITION

if (!debug_gui_enabled_) {
	return;
}

#endregion

var _xx = debug_gui_x_;
var _yy = debug_gui_y_;

with (o_movement_test_player) {

	#region ARGUMENTS

	var _w = 224;
	var _h = 538;

	var _margin_dx = (input_x_margin_ * ((bbox_right + 1) - bbox_left)) div 1;
	var _margin_dy = (input_y_margin_ * ((bbox_bottom + 1) - bbox_top)) div 1;

	var _margin_x1 = -bbox_left   % collision_cell_w_ + collision_cell_w_;
	var _margin_x2 = +bbox_right  % collision_cell_w_ + 1;
	var _margin_y1 = -bbox_top    % collision_cell_h_ + collision_cell_h_;
	var _margin_y2 = +bbox_bottom % collision_cell_h_ + 1;

	#endregion
	#region RECTANGLE

	draw_set_alpha(0.25);
	draw_rectangle_color(_xx, _yy, _xx + _w, _yy + _h, c_dkgray, c_dkgray, c_dkgray, c_dkgray, false);
	draw_set_alpha(1.0);
	draw_rectangle_color(_xx, _yy, _xx + _w, _yy + _h, c_white, c_white, c_white, c_white, true);

	#endregion

	draw_text(_xx + 8, _yy + 8, 

	@"x-coord         " + string(x) + "\n" +
	@"y-coord         " + string(y) + "\n" +
	@"z-coord         " + string(z) + "\n" +
	@"" + "\n" +
	@"x-speed         " + string(lengthdir_x(move_speed_, move_angle_)) + "\n" +
	@"y-speed         " + string(lengthdir_y(move_speed_, move_angle_)) + "\n" +
	@"x-speed average " + string(x - xprevious) + "\n" +
	@"y-speed average " + string(y - yprevious) + "\n" +
	@"z-speed         " + string(move_speed_z_) + "\n" +
	@"  speed         " + string(move_speed_) + "\n" +
	@"  angle         " + string(move_angle_) + "\n" +
	@"  angle index   " + string(move_angle_index_) + "\n" +
	@"" + "\n" +
	@"bbox L          " + string(bbox_left) + "\n" +
	@"bbox R          " + string(bbox_right) + "\n" +
	@"bbox T          " + string(bbox_top) + "\n" +
	@"bbox B          " + string(bbox_bottom) + "\n" +
	@"" + "\n" +
	@"dx-margin       " + string(_margin_dx) + "\n" +
	@"dy-margin       " + string(_margin_dy) + "\n" + 
	@"" + "\n" +
	@"x1-margin       " + string(_margin_x1) + "\n" +
	@"x2-margin       " + string(_margin_x2) + "\n" +
	@"y1-margin       " + string(_margin_y1) + "\n" +
	@"y2-margin       " + string(_margin_y2) + "\n" +
	@""

	);
}

#endregion