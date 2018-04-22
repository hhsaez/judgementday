require 'assets/scripts/prefabs/encounter_card'
require 'assets/scripts/prefabs/board'

scene = {
	type = 'crimild::Group',
	nodes = {
		createBoard(),
		{
			type = 'crimild::Camera',
			nodes = {
				{
					type = 'crimild::Group',
					nodes = {
						createEncounterCard(),
					},
					transformation = {
						translate = { 0.0, 0.0, -1.0 },
					},
				},
			},
			transformation = {
				translate = { 0.0, 60.0, 20.0 },
				lookAt = { 0.0, 0.0, 0.0 },
			},
		}
	}
}
