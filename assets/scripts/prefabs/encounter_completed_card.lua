require 'assets/scripts/utils/behaviors'

function createEncounterCompletedCardTitle( config )
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

function createEncounterCompletedCardDescription( config )
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

function createEncounterCompletedCardAction( config )
	return {
		type = 'crimild::Text',
		font = 'assets/fonts/Verdana',
		textSize = 0.025,
		textColor = { 0.0, 1.0, 0.0, 1.0 },
		text = 'Continue',
		textAnchor = 'center',
		components = {
			{
				type = 'judgementday::components::UIEventButton',
				eventName = 'encounterDidEnd',
			},
		},
		transformation = {
			translate = { 0.0, -0.1, 0.0 },
		},
	}
end

function createEncounterCompletedCard( config )
	config = config or {}
	
	local title = 'Encounter Completed'
	local text = 'Good Work!'
	
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
			createEncounterCompletedCardTitle( { title = title } ),
			createEncounterCompletedCardDescription( { text = text } ),
			createEncounterCompletedCardAction(),
		},
		components = {
			{
				type = 'judgementday::components::EncounterCard',
			},
		},
		transformation = config.transformation,
	}
end

