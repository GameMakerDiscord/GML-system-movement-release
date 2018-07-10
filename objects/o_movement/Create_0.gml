/// @description	Movement
///	@author			Army Armbuster

collision_exists_	= array_create(collision_exists_size, 0);
collision_values_	= array_create(collision_values_size, 0);

#region CONDITION

if ((undefined == collision_controller_) || !instance_exists(collision_controller_)) {

	/// Collision tileset disabled
	collision_enabled_tileset_ = false;
	return;
}

#endregion

collision_grid_		= collision_controller_.tileset_grid_;
collision_cell_w_	= collision_controller_.tileset_cell_w_;
collision_cell_h_	= collision_controller_.tileset_cell_h_;
