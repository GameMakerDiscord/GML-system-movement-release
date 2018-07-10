/// @description	scr_collision_values_objects_get_input_x_next()
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

for (var _i = 0; _i <= _margin_dx; _i++) {
	if (!place_meeting(x + _i, y + argument1, o_movement_collision)) {
		return + 1;
	}
}

#endregion
#region - 1

for (var _i = 0; _i <= _margin_dx; _i++) {
	if (!place_meeting(x - _i, y + argument1, o_movement_collision)) {
		return - 1;
	}
}

#endregion

return 0;