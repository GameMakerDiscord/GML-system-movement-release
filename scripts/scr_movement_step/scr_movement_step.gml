/// @description	scr_movement_step()
///	@author			Army Armbuster
///	@param			_input_angle/undefined
///	@param			_input_enabled

#region INPUT_XY

if (argument1 && ((0 != input_x_) || (0 != input_x_next_) || (0 != input_y_) || (0 != input_y_next_) || (undefined != argument0))) {

	scr_movement_set_input(scr_movement_get_input(argument0));
} else {
	scr_movement_set_input_friction();
}

#endregion
#region 

if (0 != move_speed_) {

	scr_collision_calculate();
	scr_collision_normalize(collision_exists_);
	scr_movement_set_values(collision_values_);
}

#endregion

return;

#region INPUT_Z

if (argument1 && ((0 != input_z_) || (0 != input_z_next_))) {

} else {

}

#endregion
