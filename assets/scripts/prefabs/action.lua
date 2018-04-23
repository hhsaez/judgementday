function createAction( config )
	return {
		name = config.name,
		description = config.description,
		cost = config.cost or 0,
		damage = config.damage or 0,
		hp = config.hp or 0,
	}
end

function createActionPunch()
	return createAction(
		{
			name = 'Punch',
			description = 'Deals 1 point of damage to target',
			damage = 1,
			cost = 2,
		}
	)
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

function createActionClaws()
	return createAction(
		{
			name = 'Claws',
			description = 'Deals 1 damage',
			damage = 1,
			cost = 3,
		}
	)
end

