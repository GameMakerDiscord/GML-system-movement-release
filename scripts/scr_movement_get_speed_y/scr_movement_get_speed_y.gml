/// @description	scr_movement_get_speed_y()
///	@author			Army Armbuster
///	@param			_input_angle

var _speed_y = lengthdir_y(move_speed_, move_angle_);
var _accel_y = lengthdir_y(((0 != input_y_next_) ? move_accel_next_ : move_accel_), argument0);

if (0 != _accel_y) {
	return _speed_y + _accel_y;
} else {
	return scr_misc_approach(_speed_y, 0, move_friction_);
}
