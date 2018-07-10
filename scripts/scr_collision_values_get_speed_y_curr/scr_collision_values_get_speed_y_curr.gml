/// @description	scr_collision_values_get_speed_y_curr()
///	@author			Army Armbuster
///	@param			_y1
///	@param			_y2
///	@param			_speed_y
///	@param			_collision_exists[]
///	@param			_collision_values[]

#region ARGUMENTS

var _exists_tileset	= array_create(collision_exists_size, false);
var _exists_objects	= array_create(collision_exists_size, false);

#endregion

var _tileset_speed_y = scr_collision_values_tileset_get_speed_y_curr(argument0, argument1, argument2, _exists_tileset);
var _tileset_exist_y = _exists_tileset[collision_exists.n] || _exists_tileset[collision_exists.s];

var _objects_speed_y = scr_collision_values_objects_get_speed_y_curr(argument0, argument1, argument2, _exists_objects);
var _objects_exist_y = _exists_objects[collision_exists.n] || _exists_objects[collision_exists.s];

#region CALCULATE

var _collision_exists = ((_tileset_exist_y << 1) | _objects_exist_y);

#endregion

switch (_collision_exists) {

	#region [TILESET OBJECTS] [0 0]
	case 0:
	{
		_exists_tileset = 0;
		_exists_objects = 0;

		y = round(yprevious + argument2);

		argument4[@ collision_values.speed_y_curr] = argument2;

		return undefined;
	}
	break;
	#endregion
	#region [TILESET OBJECTS] [0 1]
	case 1:
	{
		argument3[@ collision_exists.n] = _exists_objects[collision_exists.n];
		argument3[@ collision_exists.s] = _exists_objects[collision_exists.s];

		_exists_tileset = 0;
		_exists_objects = 0;

		y += _objects_speed_y;

		argument4[@ collision_values.speed_y_curr] = _objects_speed_y;

		return collision_type.objects;
	}
	break;
	#endregion
	#region [TILESET OBJECTS] [1 0]
	case 2:
	{
		argument3[@ collision_exists.n] = _exists_tileset[collision_exists.n];
		argument3[@ collision_exists.s] = _exists_tileset[collision_exists.s];

		_exists_tileset = 0;
		_exists_objects = 0;

		y += _tileset_speed_y;

		argument4[@ collision_values.speed_y_curr] = _tileset_speed_y;

		return collision_type.tileset;
	}
	break;
	#endregion
	#region [TILESET OBJECTS] [1 1]
	case 3:
	{
		{
			argument3[@ collision_exists.n] = _exists_objects[collision_exists.n] || _exists_tileset[collision_exists.n];
			argument3[@ collision_exists.s] = _exists_objects[collision_exists.s] || _exists_tileset[collision_exists.s];

			_exists_tileset = 0;
			_exists_objects = 0;
		}

		if (abs(_tileset_speed_y) < abs(_objects_speed_y)) {

			y += _tileset_speed_y;

			argument4[@ collision_values.speed_y_curr] = _tileset_speed_y;

			return collision_type.tileset;
		}

		if (abs(_objects_speed_y) < abs(_tileset_speed_y)) {

			y += _objects_speed_y;

			argument4[@ collision_values.speed_y_curr] = _objects_speed_y;

			return collision_type.objects;
		}
		
		{
			y += _tileset_speed_y;

			argument4[@ collision_values.speed_y_curr] = _tileset_speed_y;

			return undefined;
		}
	}
	break;
	#endregion

}
