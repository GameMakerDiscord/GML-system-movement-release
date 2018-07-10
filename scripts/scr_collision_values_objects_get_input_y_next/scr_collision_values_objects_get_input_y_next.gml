/// @description	scr_collision_values_objects_get_input_y_next()
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

for (var _i = 0; _i <= _margin_dy; _i++) {
	if (!place_meeting(x + argument0, y + _i, o_movement_collision)) {
		return + 1;
	}
}

#endregion
#region - 1

for (var _i = 0; _i <= _margin_dy; _i++) {
	if (!place_meeting(x + argument0, y - _i, o_movement_collision)) {
		return - 1;
	}
}

#endregion

return 0;