/// @description	scr_movement_get_input_y()
///	@author			Army Armbuster
///	@param			_input_angle/undefined

if (0 != input_y_next_) {
	return input_y_next_;
}

if (0 != input_y_) {
	return input_y_;
}

if (undefined != argument0) {
	return lengthdir_y(1, argument0);
}

return 0;
