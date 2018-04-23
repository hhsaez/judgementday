require 'assets/scripts/utils/behaviors'
require 'assets/scripts/prefabs/action'

function createMonster() 
	local monster = {
		type = 'crimild::Group',
		name = 'monster',
		components = {
			{
				type = 'judgementday::components::Monster',
			},
			{
				type = 'judgementday::components::Actor',
				name = 'Monster',
				description = 'A monster',
				hp = 2,
				maxHP = 2,
				ap = 0,
				maxAP = 3,
				deck = {
					createActionClaws(),
				}
			},
		},
	}

	return monster
end

defaultMonster = createMonster()

