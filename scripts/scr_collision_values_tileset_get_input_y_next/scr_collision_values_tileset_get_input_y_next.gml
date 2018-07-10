/// @description	scr_collision_values_tileset_get_input_y_next()
///	@author			Army Armbuster
///	@param			_direction_x
///	@param			_direction_y
///	@param			_collision_exists[]

#region CONDITION

if !(
    (0 == argument1) ||     // Movement in y null or
	(0 != input_y_next_)) { // Movement in y previously set
	return 0;
}

if !(
    ((0  > argument0) && argument2[collision_exists.w]) || // Moving W and Collision W or
    ((0  < argument0) && argument2[collision_exists.e])) { // Moving E and Collision E
	return 0;
}

#endregion

var _margin_dy = (input_y_margin_ * ((bbox_bottom + 1) - bbox_top)) div 1;	// Margin of range

#region + 1

var _margin_y1 = - (bbox_top  % collision_cell_h_) + collision_cell_h_;				// Margin in range

if ((0 < _margin_y1) && (_margin_y1 <= _margin_dy)) {

	var _offset_x1 = (bbox_left               ) div collision_cell_w_ + argument0;
	var _offset_x2 = (bbox_right              ) div collision_cell_w_ + argument0;
	var _offset_y1 = (bbox_top    + _margin_y1) div collision_cell_h_;
	var _offset_y2 = (bbox_bottom + _margin_y1) div collision_cell_h_;

	if (!ds_grid_value_exists(collision_grid_, _offset_x1, _offset_y1, _offset_x2, _offset_y2, noone)) {
		return + 1;
	}
}

#endregion
#region - 1

var _margin_y2 = + (bbox_bottom % collision_cell_h_) + 1;							// Margin in range

if ((0 < _margin_y2) && (_margin_y2 <= _margin_dy)) {

	var _offset_x1 = (bbox_left               ) div collision_cell_w_ + argument0;
	var _offset_x2 = (bbox_right              ) div collision_cell_w_ + argument0;
	var _offset_y1 = (bbox_top    - _margin_y2) div collision_cell_h_;
	var _offset_y2 = (bbox_bottom - _margin_y2) div collision_cell_h_;

	if (!ds_grid_value_exists(collision_grid_, _offset_x1, _offset_y1, _offset_x2, _offset_y2, noone)) {
		return - 1;
	}
}

#endregion

return 0;