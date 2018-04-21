require 'assets/scripts/utils/node_utils'
require 'assets/scripts/utils/component_utils'

function createEventBehavior( eventName, behavior )
	return {
		name = eventName,
		root = behavior,
	}
end

function createSceneStartedEventBehavior( behavior )
	return createEventBehavior( '__scene_started__', behavior )
end

function attachEventBehavior( node, eventName, behavior )
	local bc = getNodeComponent( node, 'crimild::BehaviorController' )
	if bc == nil then
		io.write( string.format( 'Error: Cannot attach behaviors to node without a behavior controller\n' ) )
		os.exit()
	end

	bc.events = bc.events or {}

	table.insert( bc.events, createEventBehavior( eventName, behavior ) )
end

function attachSceneStartedBehavior( node, behavior )
	attachEventBehavior( node, '__scene_started__', behavior )
end

function appendBehaviors( composite, behaviors )
	for _, b in ipairs( behaviors ) do
		table.insert( composite.behaviors, b )
	end
end

-- Actions

function createBehaviorAnimateContextValue( config )
	return {
		type = 'crimild::behaviors::actions::AnimateContextValue',
		key = config.key,
		value = config.value,
		duration = config.duration,
	}
end

function createBehaviorClearTargets( config )
	return {
		type = 'crimild::behaviors::actions::ClearTargets',
	}
end

function createBehaviorCopyTransformFromTarget( config )
	return {
		type = 'crimild::behaviors::actions::CopyTransformFromTarget',
	}
end

function createBehaviorEnableNode( config )
	return {
		type = 'crimild::behaviors::actions::EnableNode',
		node = config.node,
		enabled = config.enabled,
	}
end

function createBehaviorExecuteBehavior( config )
	config = config or {}

	return {
		type = 'crimild::behaviors::actions::ExecuteBehavior',
		behaviorName = config.behaviorName,
	}
end

function createBehaviorExecuteBehaviorOnTarget( config )
	config = config or {}

	return {
		type = 'crimild::behaviors::actions::ExecuteBehaviorOnTarget',
		behaviorName = config.behaviorName,
		overrideTarget = config.overrideTarget or false,
	}
end

function createBehaviorFindTarget( config )
	return {
		type = 'crimild::behaviors::actions::FindTarget',
		targetName = config.targetName,
	}
end

function createBehaviorLog( config )
	return {
		type = 'crimild::behaviors::actions::PrintMessage',
		message = config.message,
	}
end

function createBehaviorLookAt( config )
	return {
		type = 'crimild::behaviors::actions::LookAt',
	}
end

function createBehaviorMotionReset()
	return {
		type = 'crimild::behaviors::actions::MotionReset',
	}
end

function createBehaviorMotionComputePathToTarget()
	return {
		type = 'crimild::behaviors::actions::MotionComputePathToTarget',
	}
end

function createBehaviorMotionSeek()
	return {
		type = 'crimild::behaviors::actions::MotionSeek',
	}
end

function createBehaviorMotionAvoidWalls()
	return {
		type = 'crimild::behaviors::actions::MotionAvoidWalls',
	}
end

function createBehaviorMotionAvoidOthers()
	return {
		type = 'crimild::behaviors::actions::MotionAvoidOthers',
	}
end

function createBehaviorMotionApply()
	return {
		type = 'crimild::behaviors::actions::MotionApply',
	}
end

function createBehaviorResetNavigation( config )
	return {
		type = 'crimild::behaviors::actions::ResetNavigation',
	}
end

function createBehaviorSetContextValue( config )
	config = config or {}
	
	return {
		type = 'crimild::behaviors::actions::SetContextValue',
		key = config.key,
		value = config.value,
	}
end

function createBehaviorTransform( config )
	return {
		type = 'crimild::behaviors::actions::Transform',
		transformation = config.transformation,
	}
end

function createBehaviorTrigger( config )
	return {
		type = 'crimild::behaviors::actions::Trigger',
		name = config.eventName,
	}
end

function createBehaviorWait( config )
	config = config or {}
	
	return {
		type = 'crimild::behaviors::actions::Wait',
		duration = config.duration or -1,
	}
end

-- Conditions

function createBehaviorHasTargets( config )
	return {
		type = 'crimild::behaviors::conditions::HasTargets',
	}
end

function createBehaviorIsAtTarget( config )
	config = config or {}
	
	return {
		type = 'crimild::behaviors::conditions::IsAtTarget',
		minDistance = config.minDistance or 0.1,
	}
end

function createBehaviorTestContextValue( config )
	config = config or {}
	
	return {
		type = 'crimild::behaviors::conditions::TestContextValue',
		key = config.key,
		value = config.value,
		comparator = config.comparator,
	}
end

function createBehaviorTestInputAxis( config )
	config = config or {}

	return {
		type = 'crimild::behaviors::conditions::TestInputAxis',
		axis = config.axis,
		value = config.value,
	}
end

-- Composites

function createBehaviorParallel( config )
	config = config or {}
	
	return {
		type = 'crimild::behaviors::composites::Parallel',
		behaviors = config.behaviors or {},
	}
end

function createBehaviorSequence( config )
	config = config or {}
	
	return {
		type = 'crimild::behaviors::composites::Sequence',
		behaviors = config.behaviors or {},
	}
end

function createBehaviorSelector( config )
	config = config or {}
	
	return {
		type = 'crimild::behaviors::composites::Selector',
		behaviors = config.behaviors or {},
	}
end

-- Decorators

function createBehaviorRepeat( config )
	config = config or {}
	
	return {
		type = 'crimild::behaviors::decorators::Repeat',
		behavior = config.behavior or {},
		times = config.times or 1,
	}
end

function createBehaviorRepeatUntilFail( config )
	config = config or {}
	
	return {
		type = 'crimild::behaviors::decorators::RepeatUntilFail',
		behavior = config.behavior or {},
	}
end

function createBehaviorRepeatUntilSuccess( config )
	config = config or {}
	
	return {
		type = 'crimild::behaviors::decorators::RepeatUntilSuccess',
		behavior = config.behavior or {},
	}
end

function createBehaviorInverter( config )
	config = config or {}
	
	return {
		type = 'crimild::behaviors::decorators::Inverter',
		behavior = config.behavior or {},
	}
end

