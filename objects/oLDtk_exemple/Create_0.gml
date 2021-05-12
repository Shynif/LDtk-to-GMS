// Open file
var file = "tile_LDTK_test.ldtk" //get_open_filename("", "");
if (!file_exists(file)) show_message("Oupsy ! Wrong or missing file :(");

/// NEW : two ways to load your file !

// Simple :
//global.layer_tilemap = LDtk(file, tkNewTile, 0);
#region Arguments
// Arguments :
// - the file
// - the tileset in GMS
// - OPTIONNAL : the level to load
// - OPTIONNAL : "change", GMS uses tile 0 for a blank tile. If you changed the tile and moved it
//				 in another position, give the new position number
#endregion


// Extended :
global.layer_tilemap = LDtk_ext(file, tkNewTile, 1, 0, "all", 0);
#region Arguments and Tips
// Arguments :
// - the file
// - the tileset in GMS
// - the level to load
// - "change", GMS uses tile 0 for a blank tile. If you changed the tile and moved it
//	in another position, give the new position number
// - the number of layers to get (if you use all of them write "all")
// - the starting layer

// Tip : if you have 5 layers, and you want to get only the 3rd and 4th,
//		set the number of layers to 2 and the starting layer to 3
// Also, the starting layer number uses 0 refers to the highest one in LDtk
#endregion

//    Tile used  : https://adamatomic.itch.io/azul


/// NEW : Load entities !
LDtk_entities(file, 1, -10000, "Player_test", oPlayerLDtk);
LDtk_entities(file, 1, "LDTK_test_layer", "Test_object", second_test_object);
//LDtk_entities_all(file, 1, "LDTK_test_layer");    UNSTABLE       ALL ENTITIES NEED AN INSTANCE WITH THE EXACT NAME
#region Arguments and Tips
/// Arguments :
// - the file
// - the level
// - the GMS layer OR the depth,       yes you can do depth or layers !
// - the LDTK entity's name
// - the GMS object to create

// Tips :
// if you set Value Fields to your entities, you can acces them in a variable named : values_ldtk
// It stores every values in an array. Look at oPlayerLDtk for more details and exemples
#endregion