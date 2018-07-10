///	@description	Tileset Collision Constants
///	@author			Army Armbuster

#macro movement_direction_size	4

enum movement_direction {

	e,
	n,
	w,
	s
}

#macro collision_type_size		2

enum collision_type {

	tileset,
	objects
}

#macro collision_exists_size	4

enum collision_exists {

	e,
	n,
	w,
	s
}

#macro collision_values_size	6

enum collision_values {

	speed_x_curr,
	speed_y_curr,
	speed_x_next,
	speed_y_next,
	input_x_next,
	input_y_next
}
