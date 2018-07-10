/// @description	scr_collision_values_get_input_y_next()
///	@author			Army Armbuster
///	@param			_direction_x
///	@param			_direction_y
///	@param			_collision_type_x
///	@param			_collision_type_y
///	@param			_collision_exists[]

#region ARGUMENTS

var _collision_type_x = argument2;
var _collision_type_y = argument3;

#endregion

switch (_collision_type_x) {

	case collision_type.tileset: {
		return scr_collision_values_tileset_get_input_y_next(argument0, argument1, argument4);
	}
	break;
	case collision_type.objects: {
		return scr_collision_values_objects_get_input_y_next(argument0, argument1, argument4);
	}
	break;
	default: {
		return 0;
	}
}
