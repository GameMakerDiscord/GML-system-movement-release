/// @description	STATE_MOVE

/// Movement execute, enabled
scr_movement_step(move_angle_, true);

/// Movement alarm
if (0 >= alarm[0]) {
	
	/// state -> IDLE
	movement_state_	= STATE.idle;
	
	/// Duration
	alarm[0] = random_range(3, 6) * global.one_second;
}
