require 'assets/scripts/prefabs/board'
require 'assets/scripts/prefabs/ui_board'

local player = {
	type = 'crimild::Group',
	nodes = {
		{
			filename = 'assets/models/marine.obj',
		},
	},
	components = {
		{ type = 'judgementday::components::Player', },
	},
}

local board = createBoard()

local camera = {
	type = 'crimild::Camera',
	transformation = {
		translate = { 0.0, 60.0, 20.0 },
		lookAt = { 0.0, 0.0, 0.0 },
	},
	nodes = {
		{
			type = 'crimild::Group',
			nodes = {
				createUIBoard(),
			},
			transformation = {
				translate = { 0.0, 0.0, -1.0 },
			},
		},
	},
}	

scene = {
	type = 'crimild::Group',
	nodes = {
		camera,
		player,
		board,
	},
}

