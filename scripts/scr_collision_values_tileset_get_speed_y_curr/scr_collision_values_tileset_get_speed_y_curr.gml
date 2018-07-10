/// @description	scr_collision_values_tileset_get_speed_y_curr()
///	@author			Army Armbuster
///	@param			_y1
///	@param			_y2
///	@param			_speed_y
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

var _offset_y1		= (bbox_top    - 0 + argument0) div collision_cell_h_;
var _offset_y2		= (bbox_bottom + 0 + argument1) div collision_cell_h_; /// [+ 1 IF FLOOR]

#endregion
#region CONDITION

argument3[@ collision_exists.n] = ds_grid_value_exists(collision_grid_, _index_x1, _index_y1, _index_x2, _offset_y1, noone); /// ↑
argument3[@ collision_exists.s] = ds_grid_value_exists(collision_grid_, _index_x1, _index_y2, _index_x2, _offset_y2, noone); /// ↓

#endregion

#region ↑

if (argument3[collision_exists.n]) {

	return - (bbox_top    - 0) + ((bbox_top    - 0 + argument0) & (~ (collision_cell_h_ - 1))) + collision_cell_h_;
}

#endregion
#region ↓

if (argument3[collision_exists.s]) {

	return - (bbox_bottom + 1) + ((bbox_bottom + 0 + argument1) & (~ (collision_cell_h_ - 1))); /// [+ 1 IF FLOOR]
}

#endregion
#region ~

{
	return argument2;
}

#endregion
