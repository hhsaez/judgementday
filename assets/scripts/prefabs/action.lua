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
			description = 'Deals 1 damage to target',
			damage = 1,
			cost = 2,
		}
	)
end

function createActionPistol()
	return createAction(
		{
			name = 'Pistol',
			description = 'Deals 1 damage to target',
			damage = 1,
			cost = 3,
		}
	)
end

function createActionLaserGun()
	return createAction(
		{
			name = 'Laser Gun',
			description = 'Deals 2 damage to target',
			damage = 2,
			cost = 4,
		}
	)
end

function createActionShotgun()
	return createAction(
		{
			name = 'Shutgun',
			description = 'Deals 4 damage to target',
			damage = 4,
			cost = 5,
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

