/// @description	scr_collision_values_objects_get_speed_x_curr()
///	@author			Army Armbuster
///	@param			_x1
///	@param			_x2
///	@param			_speed_x
///	@param			_collision_exists[]

#region CONDITION

if (!collision_enabled_objects_) {
	return argument2;
}

#endregion
#region ARGUMENTS

var _speed_x		= argument2;

#endregion
#region TEMPORARY

var _temp_x			= x;

#endregion
#region CONDITION

argument3[@ collision_exists.w] = (0 > argument0) && place_meeting(x + argument0 - 0.5, y, o_movement_collision); /// ←
argument3[@ collision_exists.e] = (0 < argument1) && place_meeting(x + argument1 + 0.5, y, o_movement_collision); /// → [+ 1 IF FLOOR]

#endregion

#region ←

if (argument3[collision_exists.w]) {

	while (!place_meeting(x - 1, y, o_movement_collision)) {
		x -= 1;
	}

	_speed_x = x - _temp_x;
	
	#region TEMPORARY
	
	x = _temp_x;
	
	#endregion
	
	return _speed_x;
}

#endregion
#region →

if (argument3[collision_exists.e]) {

	while (!place_meeting(x + 1, y, o_movement_collision)) {
		x += 1;
	}

	_speed_x = x - _temp_x;
	
	#region TEMPORARY
	
	x = _temp_x;
	
	#endregion
	
	return _speed_x;
}

#endregion
#region ~

{
	return argument2;
}

#endregion
