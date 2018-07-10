/// @description	scr_collision_values()
///	@author			Army Armbuster
///	@param			_x1
///	@param			_y1
///	@param			_x2
///	@param			_y2
///	@param			_speed_x
///	@param			_speed_y
///	@param			_direction_x
///	@param			_direction_y
///	@param			_collision_exists[]
///	@param			_collision_values[]

#region TEMPORARY

var _temp_xprevious	= xprevious;
var _temp_yprevious	= yprevious;

var _temp_x			= x;
var _temp_y			= y;

#endregion
#region NORMALIZE

xprevious			= x;
yprevious			= y;

x					= round(x);
y					= round(y);

#endregion

/// Curr speed
var _type_x = scr_collision_values_get_speed_x_curr(argument0, argument2, argument4, argument8, argument9);
var _type_y = scr_collision_values_get_speed_y_curr(argument1, argument3, argument5, argument8, argument9);

/// Next speed
argument9[@ collision_values.speed_x_next] = scr_collision_values_get_speed_x_next(argument4, argument8);
argument9[@ collision_values.speed_y_next] = scr_collision_values_get_speed_y_next(argument5, argument8);

/// Next input
argument9[@ collision_values.input_x_next] = scr_collision_values_get_input_x_next(argument6, argument7, _type_x, _type_y, argument8);
argument9[@ collision_values.input_y_next] = scr_collision_values_get_input_y_next(argument6, argument7, _type_x, _type_y, argument8);

#region TEMPORARY

x					= _temp_x;
y					= _temp_y;

xprevious			= _temp_xprevious;
yprevious			= _temp_yprevious;

#endregion
