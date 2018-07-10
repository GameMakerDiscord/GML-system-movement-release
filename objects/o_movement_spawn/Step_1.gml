///	@description	Spawn

#region CONDITION

if (!spawn_enabled_) {
	return;
}

#endregion

if (0 >= alarm[0]) {

	#region CONDITION

	if (spawn_count_max_ <= spawn_count_) {
		spawn_enabled_ = false;
		return;
	}

	if (!instance_exists(o_movement_controller)) {
		spawn_enabled_ = false;
		return;
	}

	#endregion
	#region ARGUMENTS

	var _x1 = x - o_movement_controller.tileset_cell_w_ / 2;
	var _y1 = y - o_movement_controller.tileset_cell_h_ / 2;
	var _x2 = x + o_movement_controller.tileset_cell_w_ / 2;
	var _y2 = y + o_movement_controller.tileset_cell_h_ / 2;

	#endregion

	/// Instance spawn
	if (noone == collision_rectangle(_x1, _y1, _x2, _y2, o_movement_collision, true, true)) {

		instance_create_depth(x, y, 0, spawn_object_);

		spawn_count_++;

		global.spawn_count++;
	}

	/// Instance spawn cooldown
	alarm[0] = (global.one_second * spawn_period_);
}