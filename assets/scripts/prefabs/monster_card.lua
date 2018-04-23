require 'assets/scripts/utils/behaviors'

function createMonsterCardName( config )
	return {
		type = 'crimild::Text',
		name = 'name',
		font = 'assets/fonts/Verdana',
		textSize = 0.025,
		textColor = { 1.0, 1.0, 1.0, 1.0 },
		textAnchor = 'center',
		transformation = {
			translate = { 0.0, 0.1, 0.0 },
		},
	}
end

function createMonsterCardDescription( config )
	return {
		type = 'crimild::Text',
		name = 'description',
		font = 'assets/fonts/Verdana',
		textSize = 0.025,
		textColor = { 1.0, 1.0, 1.0, 1.0 },
		textAnchor = 'center',
		transformation = {
			translate = { 0.0, 0.05, 0.0 },
		},
	}
end

function createMonsterCardHP( config )
	return {
		type = 'crimild::Text',
		name = 'hp',
		font = 'assets/fonts/Verdana',
		textSize = 0.025,
		textColor = { 1.0, 1.0, 1.0, 1.0 },
		textAnchor = 'center',
		transformation = {
			translate = { 0.0, -0.05, 0.0 },
		},
	}
end

function createMonsterCardAP( config )
	return {
		type = 'crimild::Text',
		name = 'ap',
		font = 'assets/fonts/Verdana',
		textSize = 0.025,
		textColor = { 1.0, 1.0, 1.0, 1.0 },
		textAnchor = 'center',
		transformation = {
			translate = { 0.0, -0.1, 0.0 },
		},
	}
end

function createMonsterCard( config )
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
			createMonsterCardName(),
			createMonsterCardDescription(),
			createMonsterCardHP(),
			createMonsterCardAP(),
		},
		components = {
			{
				type = 'judgementday::components::MonsterCard',
			},
		},
		transformation = config.transformation,
	}
end

