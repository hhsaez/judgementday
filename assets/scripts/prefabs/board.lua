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
					createWaypoint( { position = { 14.0, 0.5, 14.0 } } ),
					createWaypoint( { position = { 15.0, 0.5, 0.0 } } ),
					createWaypoint( { position = { 14.0, 0.5, -15.0 } } ),
					createWaypoint( { position = { 0.0, 0.5, -15.0 } } ),
					createWaypoint( { position = { -14.0, 0.5, -14.0 } } ),
					createWaypoint( { position = { -16.0, 0.5, -4.0 } } ),
					createWaypoint( { position = { -16.0, 0.5, 6.0 } } ),
					createWaypoint( { position = { -14.0, 0.5, 15.0 } } ),
					createWaypoint( { position = { 1.0, 0.5, 15.0 } } ),
					createWaypoint( { position = { 9.0, 0.5, 7.0 } } ),
					createWaypoint( { position = { 9.0, 0.5, -3.0 } } ),
					createWaypoint( { position = { 8.0, 0.5, -9.0 } } ),
					createWaypoint( { position = { -3.0, 0.5, -9.0 } } ),
					createWaypoint( { position = { -10.0, 0.5, -8.0 } } ),
					createWaypoint( { position = { -10.0, 0.5, 0.0 } } ),
					createWaypoint( { position = { -10.0, 0.5, 7.0 } } ),
					createWaypoint( { position = { 0.0, 0.5, 9.0 } } ),
					createWaypoint( { position = { 0.0, 0.5, 0.0 } } ),
				},
				components = {
					{ type = 'judgementday::components::Board' },
					{ type = 'judgementday::components::Navigation', },
					{
						type = 'crimild::navigation::NavigationMeshContainer',
						navmesh = 'assets/models/board.navmesh',
					},
				},
			},
		},
		transformation = {
			translate = { 0.0, 0.0, 0.0 },
		},
	}
end
