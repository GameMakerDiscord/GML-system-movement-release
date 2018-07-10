/// @description	scr_collision_exists_objects()
///	@author			Army Armbuster
///	@param			_x1
///	@param			_y1
///	@param			_x2
///	@param			_y2

#region CONDITION

if (!collision_enabled_objects_) {
	return false;
}

#endregion
#region ARGUMENTS

var _offset_x1		= (bbox_left   - 1 + argument0);
var _offset_y1		= (bbox_top    - 1 + argument1);
var _offset_x2		= (bbox_right  + 1 + argument2);
var _offset_y2		= (bbox_bottom + 1 + argument3);

#endregion

return (noone != collision_rectangle(_offset_x1, _offset_y1, _offset_x2, _offset_y2, o_movement_collision, true, true));