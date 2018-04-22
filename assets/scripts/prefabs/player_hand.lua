require 'assets/scripts/prefabs/action_card'

function createPlayerHand( config )
	return {
		type = 'crimild::Group',
		nodes = {
			createActionCard( { transformation = { translate = { -0.5, 0.0, -0.2 } } } ),
			createActionCard( { transformation = { translate = { -0.25, 0.0, -0.1 } } } ),
			createActionCard( { transformation = { translate = { 0.0, 0.0, 0.0 } } } ),
			createActionCard( { transformation = { translate = { 0.25, 0.0, -0.1 } } } ),
			createActionCard( { transformation = { translate = { 0.5, 0.0, -0.2 } } } ),
		},
		transformation = config.transformation,
	}
end

