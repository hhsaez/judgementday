require 'assets/scripts/utils/behaviors'

function createEncounterFailedCardTitle( config )
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

function createEncounterFailedCardDescription( config )
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

function createEncounterFailedCardAction( config )
	return {
		type = 'crimild::Text',
		font = 'assets/fonts/Verdana',
		textSize = 0.025,
		textColor = { 0.0, 1.0, 0.0, 1.0 },
		text = 'Start Again',
		textAnchor = 'center',
		components = {
			{
				type = 'judgementday::components::UIEventButton',
				eventName = 'restartGame',
			},
		},
		transformation = {
			translate = { 0.0, -0.1, 0.0 },
		},
	}
end

function createEncounterFailedCard( config )
	config = config or {}
	
	local title = 'Encounter Failed'
	local text = 'Better Luck Next Time'
	
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
			createEncounterFailedCardTitle( { title = title } ),
			createEncounterFailedCardDescription( { text = text } ),
			createEncounterFailedCardAction(),
		},
		components = {
			{
				type = 'judgementday::components::EncounterCard',
			},
		},
		transformation = config.transformation,
	}
end

