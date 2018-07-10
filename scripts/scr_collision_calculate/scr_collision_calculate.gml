/// @description	scr_collision_calculate()
///	@author			Army Armbuster

#region ARGUMENTS

var _speed_x		= lengthdir_x(move_speed_, move_angle_);
var _speed_y		= lengthdir_y(move_speed_, move_angle_);

var _direction_x	= sign(_speed_x);
var _direction_y	= sign(_speed_y);

var _speed_x_ceil	= (_speed_x div 1) + _direction_x;
var _speed_y_ceil	= (_speed_y div 1) + _direction_y;

var _x1				= (0 == _speed_x) ? (- 1) : _speed_x_ceil;
var _y1				= (0 == _speed_y) ? (- 1) : _speed_y_ceil;
var _x2				= (0 == _speed_x) ? (+ 1) : _speed_x_ceil;
var _y2				= (0 == _speed_y) ? (+ 1) : _speed_y_ceil;

#endregion

#region DEFAULTS

collision_exists_[collision_exists.e] = false;
collision_exists_[collision_exists.n] = false;
collision_exists_[collision_exists.w] = false;
collision_exists_[collision_exists.s] = false;

collision_values_[collision_values.speed_x_curr] = _speed_x;
collision_values_[collision_values.speed_y_curr] = _speed_y;
collision_values_[collision_values.speed_x_next] = _speed_x;
collision_values_[collision_values.speed_y_next] = _speed_y;
collision_values_[collision_values.input_x_next] = 0;
collision_values_[collision_values.input_y_next] = 0;

#endregion

if (scr_collision_exists(_x1, _y1, _x2, _y2)) {
	scr_collision_values(_x1, _y1, _x2, _y2, _speed_x, _speed_y, _direction_x, _direction_y, collision_exists_, collision_values_);
}
