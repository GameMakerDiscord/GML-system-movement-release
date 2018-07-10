/// @description	STATE_IDLE

/// Movement execute, disabled
scr_movement_step(move_angle_, false);

/// Movement alarm
if (0 >= alarm[0]) {
	
	/// state -> MOVE
	movement_state_	= STATE.move;
	
	/// Duration
	alarm[0] = random_range(2, 4) * global.one_second;
	
	/// Random direction
	move_angle_	= random(360);
}
