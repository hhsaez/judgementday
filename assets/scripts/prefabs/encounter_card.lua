require 'assets/scripts/utils/behaviors'

function createEncounterCardTitle( config )
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

function createEncounterCardDescription( config )
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

function createEncounterCardAction( config )
	return {
		type = 'crimild::Text',
		font = 'assets/fonts/Verdana',
		textSize = 0.025,
		textColor = { 1.0, 0.0, 0.0, 1.0 },
		text = 'Fight!',
		textAnchor = 'center',
		components = {
			{
				type = 'judgementday::components::UIEventButton',
				eventName = 'combatWillStart',
			},
		},
		transformation = {
			translate = { 0.0, -0.1, 0.0 },
		},
	}
end

function createEncounterCard( config )
	local title = 'Encounter Title'
	local text = 'Lorem Ipsum'
	
	return {
		type = 'crimild::Group',
		nodes = {
			{
				filename = 'assets/models/encounter_card.obj',
				transformation = {
					scale = 0.2,
					translate = { 0.0, 0.0, -0.1 },
				},
			},
			createEncounterCardTitle( { title = title } ),
			createEncounterCardDescription( { text = text } ),
			createEncounterCardAction(),
		},
		components = {
			{
				type = 'judgementday::components::EncounterCard',
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
		transformation = {
			translate = { 0.0, 0.0, 0.0 },
		},
	}
end

