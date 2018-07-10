/// @description	scr_movement_get_input_x()
///	@author			Army Armbuster
///	@param			_input_angle/undefined

if (0 != input_x_next_) {
	return input_x_next_;
}

if (0 != input_x_) {
	return input_x_;
}

if (undefined != argument0) {
	return lengthdir_x(1, argument0);
}

return 0;
