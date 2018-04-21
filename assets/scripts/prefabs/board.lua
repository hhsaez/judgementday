function createWaypoint( config )
	return {
		type = 'crimild::Group',
		components = {
			{
				type = 'judgementday::components::Waypoint',
			},
		},
		transformation = {
			translate = config.position,
		},
	}
end

function createBoard( config )
	return {
		type = 'crimild::Group',
		nodes = {
			{
				filename = 'assets/models/board.obj',
			},
			{
				type = 'crimild::Group',
				nodes = {					
					createWaypoint( { position = { 14.0, 0.0, 14.0 } } ),
					createWaypoint( { position = { 15.0, 0.0, 0.0 } } ),
					createWaypoint( { position = { 14.0, 0.0, -15.0 } } ),
					createWaypoint( { position = { 0.0, 0.0, -15.0 } } ),
					createWaypoint( { position = { -14.0, 0.0, -14.0 } } ),
					createWaypoint( { position = { -16.0, 0.0, -4.0 } } ),
					createWaypoint( { position = { -16.0, 0.0, 6.0 } } ),
					createWaypoint( { position = { -14.0, 0.0, 15.0 } } ),
					createWaypoint( { position = { 1.0, 0.0, 15.0 } } ),
					createWaypoint( { position = { 9.0, 0.0, 7.0 } } ),
					createWaypoint( { position = { 9.0, 0.0, -3.0 } } ),
					createWaypoint( { position = { 8.0, 0.0, -9.0 } } ),
					createWaypoint( { position = { -3.0, 0.0, -9.0 } } ),
					createWaypoint( { position = { -10.0, 0.0, -8.0 } } ),
					createWaypoint( { position = { -10.0, 0.0, 0.0 } } ),
					createWaypoint( { position = { -10.0, 0.0, 7.0 } } ),
					createWaypoint( { position = { 0.0, 0.0, 9.0 } } ),
					createWaypoint( { position = { 0.0, 0.0, 0.0 } } ),
				},
				components = {
					{
						type = 'judgementday::components::Navigation',
					},
				},
				transformation = {
					translate = { 0.0, 0.5, 0.0 },
				},
			},
		},
		transformation = {
			translate = { 0.0, 0.0, 0.0 },
		},
	}
end
