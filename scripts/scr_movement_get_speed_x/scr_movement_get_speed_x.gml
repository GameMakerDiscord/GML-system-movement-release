/// @description	scr_movement_get_speed_x()
///	@author			Army Armbuster
///	@param			_input_angle

var _speed_x = lengthdir_x(move_speed_, move_angle_);
var _accel_x = lengthdir_x(((0 != input_x_next_) ? move_accel_next_ : move_accel_), argument0);

if (0 != _accel_x) {
	return _speed_x + _accel_x;
} else {
	return scr_misc_approach(_speed_x, 0, move_friction_);
}
