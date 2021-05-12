function LDtk(file, tileSet, level, change){
	if (change == undefined) change = 0;
	if (level      == undefined) level      = 0;
	
	var layer_ = layer_create(-1);
	var layer_tilemap = layer_tilemap_create(layer_, 0, 0, tileSet, room_width, room_height);
	
	// Manage data
	///////////////////////////////// LoadString  by  @itsmatharoo
	var _buffer = buffer_load(file);
	var _string = buffer_read(_buffer, buffer_string);
	buffer_delete(_buffer);
	var _json = _string;
	/////////////////////////////////
	var _rootStruct = json_parse(_json);
	
	// _rootStruct.levels[0].layerInstances[0].gridTiles;
	
	/// Go through the data ->
	for (var lay=array_length(_rootStruct.levels[level].layerInstances)-1; lay>-1; lay--) { // For all layers
		var array_ = _rootStruct.levels[level].layerInstances[lay].gridTiles; // Receive the tile data
		for (var i=0; i<array_length(array_); i++) { // Go throught every tiles' data
			var a = array_[i].t; // The tile
			if (a==0) a=change;
			var x_ = array_[i].px[0]; // X position
			var y_ = array_[i].px[1]; // Y position
	
			tilemap_set_at_pixel(layer_tilemap, a, x_, y_);
			
			//// Checks for X-flip or Y-flip
			var f = array_[i].f;
			switch(f) {
				case 1 :
					var mx = tilemap_get_cell_x_at_pixel(layer_tilemap, x_, y_);
					var my = tilemap_get_cell_y_at_pixel(layer_tilemap, x_, y_);
					var data = tilemap_get(layer_tilemap, mx, my);
					data = tile_set_mirror(data, 1);
					tilemap_set(layer_tilemap, data, mx, my);
				break;
				case 2 :
					var mx = tilemap_get_cell_x_at_pixel(layer_tilemap, x_, y_);
					var my = tilemap_get_cell_y_at_pixel(layer_tilemap, x_, y_);
					var data = tilemap_get(layer_tilemap, mx, my);
					data = tile_set_flip(data, 1);
					tilemap_set(layer_tilemap, data, mx, my);
				break;
				case 3 :
					var mx = tilemap_get_cell_x_at_pixel(layer_tilemap, x_, y_);
					var my = tilemap_get_cell_y_at_pixel(layer_tilemap, x_, y_);
					var data = tilemap_get(layer_tilemap, mx, my);
					data = tile_set_mirror(data, 1);
					data = tile_set_flip(data, 1);
					tilemap_set(layer_tilemap, data, mx, my);
				break;
			}
		}
	}
	
	return layer_tilemap;
}