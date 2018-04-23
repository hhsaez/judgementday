require 'assets/scripts/utils/behaviors'

function createPlayerCardName( config )
	return {
		type = 'crimild::Text',
		font = 'assets/fonts/Verdana',
		textSize = 0.025,
		textColor = { 0.0, 0.0, 0.0, 1.0 },
		text = 'Player',
		textAnchor = 'center',
		transformation = {
			translate = { 0.0, 0.1, 0.0 },
		},
	}
end

function createPlayerCardHP( config )
	return {
		type = 'crimild::Text',
		name = 'hp',
		font = 'assets/fonts/Verdana',
		textSize = 0.025,
		textColor = { 0.0, 0.0, 0.0, 1.0 },
		text = '0/0',
		textAnchor = 'center',
		transformation = {
			translate = { 0.0, 0.0, 0.0 },
		},
	}
end

function createPlayerCardAP( config )
	return {
		type = 'crimild::Text',
		name = 'ap',
		font = 'assets/fonts/Verdana',
		textSize = 0.025,
		textColor = { 0.0, 0.0, 0.0, 1.0 },
		text = '0/0',
		textAnchor = 'center',
		transformation = {
			translate = { 0.0, -0.1, 0.0 },
		},
	}
end

function createPlayerCard( config )
	return {
		type = 'crimild::Group',
		nodes = {
			{
				filename = 'assets/models/player_card.obj',
				transformation = {
					scale = 0.2,
					translate = { 0.0, 0.0, -0.01 },
				},
			},
			createPlayerCardName(),
			createPlayerCardHP(),
			createPlayerCardAP(),
		},
		components = {
			{
				type = 'judgementday::components::PlayerCard',
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
		},
		transformation = config.transformation,
	}
end

