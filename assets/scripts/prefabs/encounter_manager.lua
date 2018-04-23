local encounters = {
	{
		id = 'e01',
		title = 'Barracks',
		description = 'You arrived at Ares Base 1 after surviving that crazy AI and you just want to rest for a while. But your hopes for a well deserved rest banish as you\'re suddenly woken up by the alarm of the base and a strange noise near your bed.',
		action = 'Defend yourself!',
		encounterType = 'combat',
		monster = 'monster',
		successDescription = 'What was that thing? Before you move on, you look around and find a pistol a couple of med kits inside a locker.',
		successAction = 'Continue',
		loot = {
			createActionPistol(),
			createActionPistol(),
			createActionPistol(),
		},
		failureDescription = 'You Died',
		failureAction = 'Restart',
	},
	{
		id = 'e02',
		title = 'Living Quarters',
		description = 'Still confused, you wander around and reach the living quarters, hoping to find someone that could explain what\'s going on. As you enter the room, you hear a hiss behind you...',
		action = 'Fight',
		encounterType = 'combat',
		successDescription = 'What was that thing? Before you move on, you look around and find a pistol a couple of med kits inside a locker.',
		successAction = 'Continue',
		loot = {
			createActionPistol(),
			createActionPistol(),
			createActionPistol(),
		},
		failureDescription = 'You Died',
		failureAction = 'Restart',
	},
	{
		id = 'e03',
		title = 'Engineering',
		description = 'The engineering room is dark, occasionally illuminated by the sparks that jump from the partially destroyed electronic instruments. In a corner, you see a strange figure crouching over the body of a dead scientist. The creature turns to you as soon as you enter the room...',
		action = 'Fight',
	},
	{
		id = 'e04',
		title = 'Laboratory',
		description = 'You enter the laboratory ready to shoot whatever is there, but for your surprise the room is relatively intact. You move through the room and see one of the scientists, crawling across the floor with his right hand covering a deadly wound. "We should not have dug so much" were his last words before dying in your arms.',
		action = 'Fight',
	},
	{
		id = 'e05',
		title = 'Recreation Room',
		description = 'TBD',
		action = 'Fight',
	},
	{
		id = 'e06',
		title = 'Botanics',
		description = 'The air full of oxygen hits you in the face as soon as you enter the garden area. The plants around you are full of life, ignorant of the catastrophe that extends throughout the rest of the base. For a moment you forget the horrors you have lived up to now. After a short break, you decide to continue your way.',
		action = 'Continue',
	},
	{
		id = 'e07',
		title = 'Infirmary',
		description = 'Nothing has prepared you for what you see next. The infirmary is a dantesque spectacle. Mutilated bodies scattered everywhere. And that nauseating smell. A pile of bodies located in front of you begins to twist to form a kind of tentacle of flesh and bones...',
		action = 'Fight',
	},
	{
		id = 'e08',
		title = 'Power Plant',
		description = 'TBD',
		action = 'Fight',
	},
	{
		id = 'e09',
		title = 'Armory',
		description = 'The armory had already been looted when you arrived, but even so you are able to find some items that can be useful in your way.',
		action = 'Fight',
	},
	{
		id = 'e10',
		title = 'Training Room',
		description = 'TBD',
		action = 'Fight',
	},
	{
		id = 'e11',
		title = 'Hangar',
		description = 'Your hopes of escaping this nightmare disappear completely. Not only are there no ships available, but also the great gate that communicated the base with the outside world is completely in ruins. You try to think of an alternative plan, but the sound of something crawling towards you brings you back to reality...',
		action = 'Fight',
	},
	{
		id = 'e12',
		title = 'Warehouse',
		description = 'TBD',
		action = 'Fight',
	},
	{
		id = 'e13',
		title = 'Data Center',
		description = 'Computers everywhere. Some of the still work, although you don\'t have the technical skills to operate them.',
		action = 'Continue',
	},
	{
		id = 'e14',
		title = 'Comms Center',
		description = 'TBD',
		action = 'Fight',
	},
	{
		id = 'e15',
		title = 'Command Center',
		description = 'TBD',
		action = 'Fight',
	},
	{
		id = 'e16',
		title = 'Recycling',
		description = 'TBD',
		action = 'Fight',
	},
	{
		id = 'e17',
		title = 'Excavation Site',
		description = 'Everything around you seems to indicate that you are in the ruins of what was once a sacred place. The marks on the walls and the floor allude to demons and different dimensions. A blinding light shines from the other side of the room. Something huge begins to move towards you from one of the corners...',
		action = 'Fight',
	},
	{
		id = 'e18',
		title = 'The Void',
		description = 'The light attracts you and you continue to move towards it with the feeling that you no longer have control over your own body. You try to resist the impulse, but your body keeps moving forward. The light becomes stronger and stronger and you feel that it envelops you, making you float.',
		action = 'Fight',
	},		
}

function createEncounterManager()
	return {
		type = 'crimild::Group',
		components = {
			{
				type = 'judgementday::components::EncounterManager',
				encounters = encounters,
			},
		}
	}
end

