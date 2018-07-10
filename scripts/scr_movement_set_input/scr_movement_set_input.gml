/// @description	scr_movement_set_input()
///	@author			Army Armbuster
///	@param			_input_angle

var _speed_x		= scr_movement_get_speed_x(argument0);
var _speed_y		= scr_movement_get_speed_y(argument0);

move_speed_			= point_distance (0, 0, _speed_x, _speed_y);
move_speed_			= min(move_speed_, move_speed_max_);

move_angle_			= point_direction(0, 0, _speed_x, _speed_y);
move_angle_index_	= move_angle_ div move_angle_div_;
