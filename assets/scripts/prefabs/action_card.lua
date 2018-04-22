require 'assets/scripts/utils/behaviors'

function createActionCardTitle( config )
	return {
		type = 'crimild::Text',
		font = 'assets/fonts/Verdana',
		textSize = 0.025,
		textColor = { 1.0, 1.0, 1.0, 1.0 },
		text = config.title,
		textAnchor = 'center',
		transformation = {
			translate = { 0.0, 0.1, 0.0 },
		},
	}
end

function createActionCardDescription( config )
	return {
		type = 'crimild::Text',
		font = 'assets/fonts/Verdana',
		textSize = 0.025,
		textColor = { 1.0, 1.0, 1.0, 1.0 },
		text = config.text,
		textAnchor = 'center',
		transformation = {
			translate = { 0.0, 0.0, 0.0 },
		},
	}
end

function createActionCard( config )
	local title = 'Action'
	local text = '10/10'
	
	return {
		type = 'crimild::Group',
		nodes = {
			{
				filename = 'assets/models/action_card.obj',
				transformation = {
					scale = 0.2,
					translate = { 0.0, 0.0, -0.01 },
				},
			},
			createActionCardTitle( { title = title } ),
			createActionCardDescription( { text = text } ),
		},
		components = {
			{
				type = 'crimild::BehaviorController',
				events = {
					createEventBehavior(
						'begin_encounter',
						createBehaviorTransform( { translate = { 0.0, 0.0, 0.0 } } )
					),
				},
			},
			{
				type = 'judgementday::components::UIEventButton',
				eventName = 'combatDidEnd',
			},
		},
		transformation = config.transformation,
	}
end

