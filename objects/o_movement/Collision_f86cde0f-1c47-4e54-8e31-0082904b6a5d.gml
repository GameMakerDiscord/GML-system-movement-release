/// @description	Movement Collision Soft

#region CONDITION

if (0 == move_speed_) {
	return;
}

if (!collision_enabled_ || !other.collision_enabled_) {
	return;
}

#endregion
#region ARGUMENTS

var _move_direction_x = sign(lengthdir_x(1, move_angle_));
var _move_direction_y = sign(lengthdir_y(1, move_angle_));

var _inst_direction   = point_direction(x, y, other.x, other.y);
var _inst_direction_x = sign(lengthdir_x(1, _inst_direction));
var _inst_direction_y = sign(lengthdir_y(1, _inst_direction));

#endregion
#region CONDITION

if ((_move_direction_x != _inst_direction_x) && (_move_direction_y != _inst_direction_y)) {
	return;
}

#endregion

#region ARGUMENTS

var _push_angle	= point_direction(other.x, other.y, x, y);
var _push_x		= lengthdir_x(move_accel_, _push_angle);
var _push_y		= lengthdir_y(move_accel_, _push_angle);

#endregion
#region COLLISION PUSH

/// + 1 / - 1 IGNORE INTERNAL WINDOW
if (!scr_collision_exists(_push_x, + 1, _push_x, - 1)) {
	x += _push_x;
}

/// + 1 / - 1 IGNORE INTERNAL WINDOW
if (!scr_collision_exists(+ 1, _push_y, - 1, _push_y)) {
	y += _push_y;
}

#endregion
#region COLLISION FEEDBACK

if (move_bounce_enabled_) {

	input_x_next_ = sign(_push_x);
	input_y_next_ = sign(_push_y);

	move_speed_	= - move_bounce_ * move_speed_;
} else {
	move_speed_ = + 0;
}

#endregion
