require 'assets/scripts/utils/behaviors'
require 'assets/scripts/prefabs/player_card'
require 'assets/scripts/prefabs/monster_card'
require 'assets/scripts/prefabs/player_hand'

function createUICombat()
	return {
		type = 'crimild::Group',
		name = 'combat',
		nodes = {
			createPlayerCard(
				{
					transformation = {
						translate = { -0.5, 0.2, -0.5 },
						rotate_euler = { 0.0, 30.0, 0.0 },
					},
				}
			),
			createMonsterCard(
				{
					transformation = {
						translate = { 0.5, 0.2, -0.5 },
						rotate_euler = { 0.0, -30.0, 0.0 },
					},
				}
			),
			createPlayerHand(
				{
					transformation = {
						translate = { 0.0, -0.5, -1.0 },
					},
				}
			),
		},
	}
end

