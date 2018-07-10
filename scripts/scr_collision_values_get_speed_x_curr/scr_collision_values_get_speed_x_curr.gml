/// @description	scr_collision_values_get_speed_x_curr()
///	@author			Army Armbuster
///	@param			_x1
///	@param			_x2
///	@param			_speed_x
///	@param			_collision_exists[]
///	@param			_collision_values[]

#region ARGUMENTS

var _exists_tileset	= array_create(collision_exists_size, false);
var _exists_objects	= array_create(collision_exists_size, false);

#endregion

var _tileset_speed_x = scr_collision_values_tileset_get_speed_x_curr(argument0, argument1, argument2, _exists_tileset);
var _tileset_exist_x = _exists_tileset[collision_exists.w] || _exists_tileset[collision_exists.e];

var _objects_speed_x = scr_collision_values_objects_get_speed_x_curr(argument0, argument1, argument2, _exists_objects);
var _objects_exist_x = _exists_objects[collision_exists.w] || _exists_objects[collision_exists.e];

#region CALCULATE

var _collision_exists = ((_tileset_exist_x << 1) | _objects_exist_x);

#endregion

switch (_collision_exists) {

	#region [TILESET OBJECTS] [0 0]
	case 0:
	{
		_exists_tileset = 0;
		_exists_objects = 0;

		x = round(xprevious + argument2);

		argument4[@ collision_values.speed_x_curr] = argument2;

		return undefined;
	}
	break;
	#endregion
	#region [TILESET OBJECTS] [0 1]
	case 1:
	{
		argument3[@ collision_exists.w] = _exists_objects[collision_exists.w];
		argument3[@ collision_exists.e] = _exists_objects[collision_exists.e];

		_exists_tileset = 0;
		_exists_objects = 0;

		x += _objects_speed_x;

		argument4[@ collision_values.speed_x_curr] = _objects_speed_x;

		return collision_type.objects;
	}
	break;
	#endregion
	#region [TILESET OBJECTS] [1 0]
	case 2:
	{
		argument3[@ collision_exists.w] = _exists_tileset[collision_exists.w];
		argument3[@ collision_exists.e] = _exists_tileset[collision_exists.e];

		_exists_tileset = 0;
		_exists_objects = 0;

		x += _tileset_speed_x;

		argument4[@ collision_values.speed_x_curr] = _tileset_speed_x;

		return collision_type.tileset;
	}
	break;
	#endregion
	#region [TILESET OBJECTS] [1 1]
	case 3:
	{
		{
			argument3[@ collision_exists.w] = _exists_objects[collision_exists.w] || _exists_tileset[collision_exists.w];
			argument3[@ collision_exists.e] = _exists_objects[collision_exists.e] || _exists_tileset[collision_exists.e];

			_exists_tileset = 0;
			_exists_objects = 0;
		}

		if (abs(_tileset_speed_x) < abs(_objects_speed_x)) {

			x += _tileset_speed_x;

			argument4[@ collision_values.speed_x_curr] = _tileset_speed_x;

			return collision_type.tileset;
		}

		if (abs(_objects_speed_x) < abs(_tileset_speed_x)) {

			x += _objects_speed_x;

			argument4[@ collision_values.speed_x_curr] = _objects_speed_x;

			return collision_type.objects;
		}
		
		{
			x += _tileset_speed_x;

			argument4[@ collision_values.speed_x_curr] = _tileset_speed_x;

			return undefined;
		}
	}
	break;
	#endregion

}
