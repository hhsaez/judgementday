require 'assets/scripts/utils/behaviors'

function createWaypoint( config )

	local radius = config.radius or 0.1
	local encounterEventName = 'begin_encounter_' .. config.encounter
	
	return {
		type = 'crimild::Group',
		name = config.encounter,
		components = {
			{
				type = 'judgementday::components::Waypoint',
			},
			{
				type = 'crimild::BehaviorController',
				events = {
					createEventBehavior(
						'encounter',
						createBehaviorSequence(
							{
								behaviors = {
									createBehaviorTrigger( { eventName = 'encounterWillStart' } ),
									createBehaviorTrigger( { eventName = encounterEventName } ),
								},
							}
						)
					),
				},
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
					createWaypoint( { encounter = 'e01', position = { 14.0, 0.5, 14.0 } } ),
					createWaypoint( { encounter = 'e02', position = { 15.0, 0.5, 0.0 } } ),
					createWaypoint( { encounter = 'e03', position = { 14.0, 0.5, -15.0 } } ),
					createWaypoint( { encounter = 'e04', position = { 0.0, 0.5, -15.0 } } ),
					createWaypoint( { encounter = 'e05', position = { -14.0, 0.5, -14.0 } } ),
					createWaypoint( { encounter = 'e06', position = { -16.0, 0.5, -4.0 } } ),
					createWaypoint( { encounter = 'e07', position = { -16.0, 0.5, 6.0 } } ),
					createWaypoint( { encounter = 'e08', position = { -14.0, 0.5, 15.0 } } ),
					createWaypoint( { encounter = 'e09', position = { 1.0, 0.5, 15.0 } } ),
					createWaypoint( { encounter = 'e10', position = { 9.0, 0.5, 7.0 } } ),
					createWaypoint( { encounter = 'e11', position = { 9.0, 0.5, -3.0 } } ),
					createWaypoint( { encounter = 'e12', position = { 8.0, 0.5, -9.0 } } ),
					createWaypoint( { encounter = 'e13', position = { -3.0, 0.5, -9.0 } } ),
					createWaypoint( { encounter = 'e14', position = { -10.0, 0.5, -8.0 } } ),
					createWaypoint( { encounter = 'e15', position = { -10.0, 0.5, 0.0 } } ),
					createWaypoint( { encounter = 'e16', position = { -10.0, 0.5, 7.0 } } ),
					createWaypoint( { encounter = 'e17', position = { 0.0, 0.5, 9.0 } } ),
					createWaypoint( { encounter = 'e18', position = { 0.0, 0.5, 0.0 } } ),
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
