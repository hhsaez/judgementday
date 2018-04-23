require 'assets/scripts/utils/behaviors'
require 'assets/scripts/prefabs/action'

function createMonster( config )
	config = config or {}
	
	local monster = {
		type = 'crimild::Group',
		name = 'monster',
		components = {
			{
				type = 'judgementday::components::Monster',
			},
			{
				type = 'judgementday::components::Actor',
				name = config.name,
				description = config.lore,
				hp = config.maxHP,
				maxHP = config.maxHP,
				ap = 0,
				maxAP = config.maxAP,
				deck = config.actions,
			},
		},
	}

	return monster
end

monsterImp = createMonster(
	{
		name = 'Imp',
		lore = 'A humanoid lesser demon',
		maxHP = 2,
		maxAP = 3,
		actions = {
			createAction( { damage = 1, cost = 3 } ),
		},
	}
)

monsterFleshNighmare = createMonster(
	{
		name = 'Flesh Nighmare',
		lore = 'A pile of flesh and bone',
		maxHP = 8,
		maxAP = 3,
		actions = {
			createAction( { damage = 2, cost = 3 } ),
		},
	}
)

monsterCyberDemon = createMonster(
	{
		name = 'Cyber Demon',
		lore = 'A demon formed by electronic parts',
		maxHP = 5,
		maxAP = 5,
		actions = {
			createAction( { damage = 1, cost = 2 } ),
		},
	}
)

monsterDemonLord = createMonster(
	{
		name = 'Demon Knight',
		lore = 'A humanoid demon',
		maxHP = 8,
		maxAP = 5,
		actions = {
			createAction( { damage = 3, cost = 3 } ),
		},
	}
)

monsterDemonLord = createMonster(
	{
		name = 'Demon Lord',
		lore = 'A hulking demon',
		maxHP = 10,
		maxAP = 10,
		actions = {
			createAction( { damage = 4, cost = 5 } ),
		},
	}
)


