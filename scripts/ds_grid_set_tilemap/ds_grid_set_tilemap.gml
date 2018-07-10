///	@description	ds_grid_set_tilemap()
///	@author			Army Armbuster
///	@param			_ds_grid
///	@param			_ds_tilemap
///	@param			_cell_w
///	@param			_cell_h
///	@param			_cell_v

var _j = 0; repeat (ds_grid_height(argument0)) {
	var _i = 0; repeat (ds_grid_width(argument0)) {

		if (0 != tilemap_get_at_pixel(argument1, _i * argument2, _j * argument3)) {
			ds_grid_set(argument0, _i, _j, argument4);
		}

		_i = _i + 1;
	}

	_j = _j + 1;
}