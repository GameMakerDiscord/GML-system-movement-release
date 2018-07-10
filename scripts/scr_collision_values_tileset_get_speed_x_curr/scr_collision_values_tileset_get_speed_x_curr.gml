/// @description	scr_collision_values_tileset_get_speed_x_curr()
///	@author			Army Armbuster
///	@param			_x1
///	@param			_x2
///	@param			_speed_x
///	@param			_collision_exists[]

#region CONDITION

if (!collision_enabled_tileset_) {
	return argument2;
}

#endregion
#region ARGUMENTS

var _index_x1		= (bbox_left                  ) div collision_cell_w_;
var _index_y1		= (bbox_top                   ) div collision_cell_h_;
var _index_x2		= (bbox_right                 ) div collision_cell_w_;
var _index_y2		= (bbox_bottom                ) div collision_cell_h_;

var _offset_x1		= (bbox_left   - 0 + argument0) div collision_cell_w_;
var _offset_x2		= (bbox_right  + 0 + argument1) div collision_cell_w_; /// [+ 1 IF FLOOR]

#endregion
#region CONDITION

argument3[@ collision_exists.w] = ds_grid_value_exists(collision_grid_, _index_x1, _index_y1, _offset_x1, _index_y2, noone); /// ←
argument3[@ collision_exists.e] = ds_grid_value_exists(collision_grid_, _index_x2, _index_y1, _offset_x2, _index_y2, noone); /// →

#endregion

#region ←

if (argument3[collision_exists.w]) {

	return - (bbox_left   - 0) + ((bbox_left   - 0 + argument0) & (~ (collision_cell_w_ - 1))) + collision_cell_w_;
}

#endregion
#region →

if (argument3[collision_exists.e]) {

	return - (bbox_right  + 1) + ((bbox_right  + 0 + argument1) & (~ (collision_cell_w_ - 1))); /// [+ 1 IF FLOOR]
}

#endregion
#region ~

{
	return argument2;
}

#endregion
