/// @description	scr_collision_values_tileset_get_input_x_next()
///	@author			Army Armbuster
///	@param			_direction_x
///	@param			_direction_y
///	@param			_collision_exists[]

#region CONDITION

if !(
    (0 == argument0) ||     // Movement in x null or
    (0 != input_x_next_)) { // Movement in x previously set
	return 0;
}

if !(
    ((0  > argument1) && argument2[collision_exists.n]) || // Moving N and Collision N or
    ((0  < argument1) && argument2[collision_exists.s])) { // Moving S and Collision S
	return 0;
}

#endregion

var _margin_dx = (input_x_margin_ * ((bbox_right + 1) - bbox_left)) div 1;	// Margin of range

#region + 1

var _margin_x1 = - (bbox_left % collision_cell_w_) + collision_cell_w_;				// Margin in range

if ((0 < _margin_x1) && (_margin_x1 <= _margin_dx)) {

	var _offset_x1 = (bbox_left   + _margin_x1) div collision_cell_w_;
	var _offset_x2 = (bbox_right  + _margin_x1) div collision_cell_w_;
	var _offset_y1 = (bbox_top                ) div collision_cell_h_ + argument1;
	var _offset_y2 = (bbox_bottom             ) div collision_cell_h_ + argument1;

	if (!ds_grid_value_exists(collision_grid_, _offset_x1, _offset_y1, _offset_x2, _offset_y2, noone)) {
		return + 1;
	}
}

#endregion
#region - 1

var _margin_x2 = + (bbox_right % collision_cell_w_) + 1;							// Margin in range

if ((0 < _margin_x2) && (_margin_x2 <= _margin_dx)) {

	var _offset_x1 = (bbox_left   - _margin_x2) div collision_cell_w_;
	var _offset_x2 = (bbox_right  - _margin_x2) div collision_cell_w_;
	var _offset_y1 = (bbox_top                ) div collision_cell_h_ + argument1;
	var _offset_y2 = (bbox_bottom             ) div collision_cell_h_ + argument1;

	if (!ds_grid_value_exists(collision_grid_, _offset_x1, _offset_y1, _offset_x2, _offset_y2, noone)) {
		return - 1;
	}
}

#endregion

return 0;