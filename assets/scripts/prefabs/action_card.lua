require 'assets/scripts/utils/behaviors'

function createActionCardTitle( config )
	return {
		type = 'crimild::Text',
		name = 'title',
		font = 'assets/fonts/Verdana',
		textSize = 0.025,
		textColor = { 0.0, 0.0, 0.0, 1.0 },
		textAnchor = 'center',
		transformation = {
			translate = { 0.0, 0.1, 0.0 },
		},
	}
end

function createActionCardDescription( config )
	return {
		type = 'crimild::Text',
		name = 'description',
		font = 'assets/fonts/Verdana',
		textSize = 0.025,
		textColor = { 0.0, 0.0, 0.0, 1.0 },
		textAnchor = 'center',
		transformation = {
			translate = { 0.0, 0.0, 0.0 },
		},
	}
end

function createActionCardCost( config )
	return {
		type = 'crimild::Text',
		name = 'cost',
		font = 'assets/fonts/Verdana',
		textSize = 0.025,
		textColor = { 0.0, 0.0, 0.0, 1.0 },
		textAnchor = 'center',
		transformation = {
			translate = { 0.0, -0.1, 0.0 },
		},
	}
end

function createActionCard( config )
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
			createActionCardTitle(),
			createActionCardDescription(),
			createActionCardCost(),
		},
		components = {
			{
				type = 'judgementday::components::ActionCard',
			},
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

