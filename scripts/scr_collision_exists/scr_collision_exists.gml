/// @description	scr_collision_exists()
///	@author			Army Armbuster
///	@param			_x1
///	@param			_y1
///	@param			_x2
///	@param			_y2

#region TEMPORARY

var _temp_x			= x;
var _temp_y			= y;

#endregion
#region NORMALIZE

x					= round(x);
y					= round(y);

#endregion

var _exists = scr_collision_exists_tileset(argument0, argument1, argument2, argument3) || scr_collision_exists_objects(argument0, argument1, argument2, argument3);

#region TEMPORARY

x					= _temp_x;
y					= _temp_y;

#endregion

return _exists;