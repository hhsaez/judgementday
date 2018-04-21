require 'assets/scripts/prefabs/board'
require 'assets/scripts/prefabs/ui_board'
require 'assets/scripts/prefabs/player'

local player = createPlayer()

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

