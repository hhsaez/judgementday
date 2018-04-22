function createAction( config )
	return {
		name = config.name,
		description = config.description,
		cost = config.cost or 0,
		damage = config.damage or 0,
		hp = config.hp or 0,
	}
end

function createActionPistol()
	return createAction(
		{
			name = 'Pistol',
			description = 'Damage: 1',
			damage = 1,
			cost = 3,
		}
	)
end

function createActionMedKit()
	return createAction(
		{
			name = 'Med Kit',
			description = 'Heals: 4',
			hp = 4,
			cost = 2,
		}
	)
end

