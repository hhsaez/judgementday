require 'assets/scripts/utils/behaviors'
require 'assets/scripts/prefabs/action'

-- Player Behaviors

function createPlayerBehaviorMove( config )
	config = config or {}

	return createBehaviorSequence(
		{
			behaviors = {
				createBehaviorClearTargets(),
				createBehaviorRollMovement(),
				createBehaviorHasTargets(),
				createBehaviorTrigger( { eventName = 'playerWillMove' } ),
				createBehaviorMotionReset(),
				createBehaviorRepeatUntilFail(
					{
						behavior = createBehaviorSequence(
							{
								behaviors = {
									createBehaviorInverter(
										{
											behavior = createBehaviorIsAtTarget( config ),
										}
									),
									createBehaviorMotionComputePathToTarget(),
									createBehaviorSetContextValue( { key = 'motion.steering.x', value = '0' } ),
									createBehaviorSetContextValue( { key = 'motion.steering.y', value = '0' } ),
									createBehaviorSetContextValue( { key = 'motion.steering.z', value = '0' } ),
									createBehaviorMotionSeek(),
									createBehaviorMotionAvoidWalls(),
									createBehaviorMotionAvoidOthers(),
									createBehaviorMotionApply(),
								}
							}
						),
					}
				),
				createBehaviorMotionReset(),
				createBehaviorTrigger( { eventName = 'playerDidMove' } ),
				createBehaviorExecuteBehaviorOnTarget( { behaviorName = 'encounter' } ),
			},
		}
	)
end

-- Player

function createPlayer() 
	local player = {
		type = 'crimild::Group',
		name = 'player',
		nodes = {
			{
				filename = 'assets/models/marine.obj',
			},
		},
		components = {
			{
				type = 'judgementday::components::Player',
			},
			{
				type = 'crimild::navigation::NavigationController',
			},					
			{
				type = 'crimild::BehaviorController',
				context = {
					{ key = 'motion.max_velocity', value = '6.0', },
					{ key = 'motion.slowing_radius', value = '2.0', },
				},
				events = {
					createEventBehavior( 'move', createPlayerBehaviorMove() ),
				},
			},
			{
				type = 'judgementday::components::Actor',
				hp = 10,
				maxHP = 10,
				ap = 0,
				maxAP = 10,
				deck = {
					createActionPistol(),
					createActionPistol(),
					createActionPistol(),
					createActionMedKit(),
					createActionMedKit(),
				}
			},
		},
	}

	return player
end

