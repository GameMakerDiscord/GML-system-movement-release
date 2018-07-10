/// @description	scr_collision_values_get_speed_x_next()
///	@author			Army Armbuster
///	@param			_speed_x
///	@param			_collision_exists[]

if (argument1[collision_exists.w] || argument1[collision_exists.e]) {

	return move_bounce_enabled_ ? - (move_bounce_ * argument0) : 0;
} else {
	return argument0;
}