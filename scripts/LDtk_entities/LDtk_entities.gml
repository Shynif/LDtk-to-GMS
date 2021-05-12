function LDtk_entities(file, level, layer_and_depth, identifier, object){
	if (level == undefined) level = 0;
	
	// Manage data
	///////////////////////////////// LoadString  by  @itsmatharoo
	var _buffer = buffer_load(file);
	var _string = buffer_read(_buffer, buffer_string);
	buffer_delete(_buffer);
	var _json = _string;
	/////////////////////////////////
	var _rootStruct = json_parse(_json);
	
	// _rootStruct.levels[0].layerInstances[0].gridTiles;
	if (is_string(layer_and_depth)) var l_ = false else var l_ = true; // Check if we use layers or depth
	
	/// Go through the data ->
	var len_Entities = array_length(_rootStruct.levels[level].layerInstances);
	for (var i=0; i<len_Entities; i++) { // For all entities group layer
		var len_Instanc = array_length(_rootStruct.levels[level].layerInstances[i].entityInstances);
		for (var j=0; j<len_Instanc; j++) { // For all entities
			var element = _rootStruct.levels[level].layerInstances[i].entityInstances[j];
			if (element.__identifier == identifier) { // If it's the searched entity
				// Get the entity
				var values_   = _rootStruct.levels[level].layerInstances[i].entityInstances[j].fieldInstances;
				
				// Create the instance by layer or depth
				if (l_ == false) var inst = instance_create_layer(element.px[0], element.px[1], layer_and_depth, object)
				else var inst = instance_create_depth(element.px[0], element.px[1], layer_and_depth, object);
				
				// Add Value Field array if it has values
				if (array_length(values_) > 0) {
					var vals_ = [];
					for (var k=0; k<array_length(values_); k++) {
						array_push(vals_, values_[k].__value);
					}
					inst.values_ldtk = vals_;
				}
			}
		}
	}
}