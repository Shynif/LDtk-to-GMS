// Open file
file = "tile_LDTK_test.ldtk" //get_open_filename("", "");
if (!file_exists(file)) show_message("Oupsy ! Wrong or missing file :(");


global.layer_tilemap = LDtk_ext(file, tkNewTile, 1, 0, "all", 0);


/// Watch out !!! This script is "dangerous"         You NEED to have objects named like in LDtk
LDtk_entities_all(file, 1, -10000); // Imports every objects and their value fields B)