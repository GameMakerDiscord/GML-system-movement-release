/// @description	scr_movement_set_values()
///	@author			Army Armbuster
///	@param			_collision_values[]

#region ARGUMENTS

var _speed_x_curr	= argument0[collision_values.speed_x_curr];
var _speed_y_curr	= argument0[collision_values.speed_y_curr];
var _speed_x_next	= argument0[collision_values.speed_x_next];
var _speed_y_next	= argument0[collision_values.speed_y_next];
var _input_x_next	= argument0[collision_values.input_x_next];
var _input_y_next	= argument0[collision_values.input_y_next];

#endregion

x				   += _speed_x_curr;
y				   += _speed_y_curr;

input_x_next_		= _input_x_next;
input_y_next_		= _input_y_next;

move_speed_			= point_distance (0, 0, _speed_x_next, _speed_y_next);
move_speed_			= min(move_speed_, move_speed_max_);

#region CONDITION

if (0 == move_speed_) {
	return;
}

#endregion

move_angle_			= point_direction(0, 0, _speed_x_next, _speed_y_next);
move_angle_index_	= move_angle_ div move_angle_div_;
