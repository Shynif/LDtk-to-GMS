/// @description Reload entities

// Destroy all entities
with (all) {
	if (depth == -10000) instance_destroy();
}

// Re generate them
LDtk_entities_all(file, 1, -10000);