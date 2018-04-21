-- Crimild components

function createComponentBehaviorController( config )
	config = config or {}
	
	return {
		type = 'crimild::BehaviorController',
		context = config.context,
		events = config.events,
	}
end

function createComponentNavigationController( config )
	return {
		type = 'crimild::navigation::NavigationController',
	}
end

function createComponentNavigationContainer( config )
	config = config or {}
	
	return {
		type = 'crimild::navigation::NavigationMeshContainer',
		navmesh = config.navmesh,
	}
end

