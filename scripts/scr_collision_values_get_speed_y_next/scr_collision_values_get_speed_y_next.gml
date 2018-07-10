/// @description	scr_collision_values_get_speed_y_next()
///	@author			Army Armbuster
///	@param			_speed_y
///	@param			_collision_exists[]

if (argument1[collision_exists.n] || argument1[collision_exists.s]) {

	return move_bounce_enabled_ ? - (move_bounce_ * argument0) : 0;
} else {
	return argument0;
}