require 'assets/scripts/utils/behaviors'

function createMonsterCardTitle( config )
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

function createMonsterCardDescription( config )
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

function createMonsterCard( config )
	local title = 'Monster'
	local text = '10/10'
	
	return {
		type = 'crimild::Group',
		nodes = {
			{
				filename = 'assets/models/monster_card.obj',
				transformation = {
					scale = 0.2,
					translate = { 0.0, 0.0, -0.01 },
				},
			},
			createMonsterCardTitle( { title = title } ),
			createMonsterCardDescription( { text = text } ),
			--createMonsterCardAction(),
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
		},
		transformation = config.transformation,
	}
end

