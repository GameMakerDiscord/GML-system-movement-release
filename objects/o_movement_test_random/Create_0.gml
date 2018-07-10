/// @description	State Movement Variables

/// o_movement
event_inherited();

/// Movement State
enum STATE {
	idle,
	move
}

/// Movement State Start
movement_state_	= STATE.idle;