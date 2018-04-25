require 'assets/scripts/utils/behaviors'

function createEncounterCardTitle( config )
	return {
		type = 'crimild::Text',
		name = 'title',
		font = 'assets/fonts/Verdana',
		textSize = 0.025,
		textColor = { 0.0, 0.0, 0.0, 1.0 },
		text = config.title,
		textAnchor = 'center',
		transformation = {
			translate = { 0.0, 0.135, 0.0 },
		},
	}
end

function createEncounterCardDescription( config )
	return {
		type = 'crimild::Text',
		name = 'description',
		font = 'assets/fonts/Verdana',
		textSize = 0.015,
		textColor = { 0.0, 0.0, 0.0, 1.0 },
		text = config.text,
		textAnchor = 'center',
		transformation = {
			translate = { 0.0, 0.1, 0.0 },
		},
	}
end

function createEncounterCardAction( config )
	return {
		type = 'crimild::Text',
		name = 'action',
		font = 'assets/fonts/Verdana',
		textSize = 0.025,
		textColor = { 1.0, 0.0, 0.0, 1.0 },
		text = 'Fight!',
		textAnchor = 'center',
		transformation = {
			translate = { 0.0, -0.16, 0.0 },
		},
	}
end

function createEncounterCard( config )
	config = config or {}
	
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
				cardType = config.cardType,
				encounters = {
					{
						id = 'e01',
						title = 'Barracks',
						description = 'aca va la descripcion',
						action = 'a pelear',
					}
				},
			},
		},
		transformation = {
			scale = 1.75,
		},
	}
end

