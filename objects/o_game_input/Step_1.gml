/// @description	Keyboard Input Set

event_user(0);

#region MOVEMENT DEBUG

if (instance_exists(o_game)) {
	
	var _debug = action_1_pressed_;

	with (o_game) {
		
		/// Set movement debug
		if (_debug) {

			debug_gui_enabled_ = !debug_gui_enabled_;
		}
	}
}

#endregion

#region MOVEMENT INPUT

if (instance_exists(o_movement_test_player)) {

	var _input_x = action_right_ - action_left_;
	var _input_y = action_down_ - action_up_;

	var _scale = action_2_pressed_;

	var _scale_x = 1;
	var _scale_y = 1;

	if (_scale) {

		/// Cycle forward
		movement_scale_ = movement_scale_ * 2;

		/// Cycle back
		if (4 == movement_scale_) {
			movement_scale_ = 0.5;
		}

		/// Set
		_scale_x = movement_scale_;
		_scale_y = movement_scale_;
	}

	with (o_movement_test_player) {

		/// Set movement input
		input_x_ = _input_x;
		input_y_ = _input_y;

		/// Set movement scale
		if (_scale) {

			image_xscale = _scale_x;
			image_yscale = _scale_y;
		}
	}
}

#endregion

#region MOVEMENT SPAWN

if (instance_exists(o_movement_spawn)) {

	var _spawn = action_0_pressed_;

	with (o_movement_spawn) {

		/// Set movement spawn
		if (_spawn) {

			spawn_enabled_ = !spawn_enabled_;
		}
	}
}

#endregion
