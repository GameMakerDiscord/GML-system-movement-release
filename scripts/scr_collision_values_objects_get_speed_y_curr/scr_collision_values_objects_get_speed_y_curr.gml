/// @description	scr_collision_values_objects_get_speed_y_curr()
///	@author			Army Armbuster
///	@param			_y1
///	@param			_y2
///	@param			_speed_y
///	@param			_collision_exists[]

#region CONDITION

if (!collision_enabled_objects_) {
	return argument2;
}

#endregion
#region ARGUMENTS

var _speed_y		= argument2;

#endregion
#region TEMPORARY

var _temp_y			= y;

#endregion
#region CONDITION

argument3[@ collision_exists.n] = (0 > argument0) && place_meeting(x, y + argument0 - 0.5, o_movement_collision); /// ↑
argument3[@ collision_exists.s] = (0 < argument1) && place_meeting(x, y + argument1 + 0.5, o_movement_collision); /// ↓ [+ 1 IF FLOOR]

#endregion

#region ↑

if (argument3[collision_exists.n]) {

	while (!place_meeting(x, y - 1, o_movement_collision)) {
		y -= 1;
	}

	_speed_y = y - _temp_y;
	
	#region TEMPORARY
	
	y = _temp_y;
	
	#endregion
	
	return _speed_y;
}

#endregion
#region ↓

if (argument3[collision_exists.s]) {

	while (!place_meeting(x, y + 1, o_movement_collision)) {
		y += 1;
	}

	_speed_y = y - _temp_y;
	
	#region TEMPORARY
	
	y = _temp_y;
	
	#endregion
	
	return _speed_y;
}

#endregion
#region ~

{
	return argument2;
}

#endregion
