/// @description	scr_collision_exists_tileset()
///	@author			Army Armbuster
///	@param			_x1
///	@param			_y1
///	@param			_x2
///	@param			_y2

#region CONDITION

if (!collision_enabled_tileset_) {
	return false;
}

#endregion
#region ARGUMENTS

var _offset_x1		= (bbox_left   - 1 + argument0) div collision_cell_w_;
var _offset_y1		= (bbox_top    - 1 + argument1) div collision_cell_h_;
var _offset_x2		= (bbox_right  + 1 + argument2) div collision_cell_w_;
var _offset_y2		= (bbox_bottom + 1 + argument3) div collision_cell_h_;

#endregion

return ds_grid_value_exists(collision_grid_, _offset_x1, _offset_y1, _offset_x2, _offset_y2, noone);